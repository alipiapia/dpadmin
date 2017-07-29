<?php
// +----------------------------------------------------------------------
// | 框架 [ thinkphp ]
// +----------------------------------------------------------------------
// | 版权所有 2008~2017 thinkphp [ http://www.thinkphp.cn ]
// +----------------------------------------------------------------------
// | 官方网站: http://thinkphp.cn
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

namespace app\index\controller;
// use think\Controller;
use app\common\controller\Common;
use app\common\model\User as UserModel;
use app\common\model\Product as ProductModel;
use app\common\model\Cate as CateModel;
use app\common\model\Spec as SpecModel;

/**
 * 前台首页控制器
 * @package app\index\controller
 */
class Index extends Common
{
    /**
     * 初始化方法
     * @author thinkphp
     */
    protected function _initialize()
    {
        parent::_initialize();

        //是否为移动设备
        if(!is_mobile()){
            echo "提示：请使用手机访问！";die;
        }
    }
    
    public function index()
    {
        // cookie(null);
        // pp($_COOKIE);
        // session(null);
        // pp($_SESSION);
        // 默认跳转模块
        if (config('home_default_module') != 'index') {
            $this->redirect(config('home_default_module'). '/index/index');
        }

        $map = $this->getMap();
        $map['status'] = 1;
        // $map['group_end_time'] = ['gt', time()];
        // $productList = (new ProductModel)->getColumn($map);//商品
        // $cateList = (new CateModel)->getColumn('', 'id,name,picture,icon');//分类
        $productList = (new ProductModel)->getLists($map, 'sales desc', '', 5);//热卖商品
        $cateList = (new CateModel)->getLists('', 'sort', 'id,name,picture,icon', 8);//首页分类

        foreach ($productList as $k => $v) {
            $proSpec = $userInfo = [];
            $specStock = 0;
            $proSpec = (new SpecModel)->getColumn(['product_id' => $v['id']], 'stock');
            if(!$proSpec){
                unset($productList[$k]);
                break;
            }else{
                foreach($proSpec as $kk => $vv){
                    $specStock += $vv;
                }
            }
            if($specStock < 1){
                unset($productList[$k]);
                break;
            }

            if(session('user_auth_index')){
                // $user = session('user_auth_index');
                // $userInfo = (new UserModel)->getOneDarry(['id' => $user['id']]);
                // if(isset($userInfo['pro_level'])){
                //     switch ($userInfo['pro_level']) {
                //         case '1':
                //             $productList[$k]['price'] = $v['cost_price'];
                //             break;
                //         case '2':
                //             $productList[$k]['price'] = $v['promotion_price'];
                //             break;
                        
                //         default:
                //             $productList[$k]['price'] = $v['member_price'];
                //             break;
                //     }            
                // }
                $productList[$k]['price'] = $v['member_price'];
            }else{
                $productList[$k]['price'] = $v['price'];
            }
        }
        // pp($productList);

        // return $this->fetch();
        return view('index', [
                'title' => '首页',
                'keyword' => input('keyword'),
                'product' => $productList,
                'cate' => $cateList,
            ]);
    }

    /**
     * 未登录跳转
     * @author pp
     */
    public function loginpatch()
    {
        return view('loginpatch', [
                'title' => '登录提示',
            ]);
    }
}
