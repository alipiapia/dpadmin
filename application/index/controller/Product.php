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

use app\common\controller\Common;
use app\common\model\User as UserModel;
use app\common\model\Product as ProductModel;
use app\common\model\Spec as SpecModel;
use app\common\model\AdminAttachment as AdminAttachmentModel;

/**
 * 前台商品控制器
 * @package app\index\controller
 */
class Product extends Common
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

    //列表页
    public function index()
    {
        $map = $this->getMap();
        $map['status'] = 1;
        // $map['group_end_time'] = ['gt', time()];
        // pp($map);
        // $productList = (new ProductModel)->getColumn($map);
        $productList = (new ProductModel)->getLists($map, 'sales desc', '');//热卖商品
        foreach ($productList as $k => $v) {
            $proSpec = $userInfo = [];
            $specStock = 0;
            $proSpec = (new SpecModel)->getColumn(['product_id' => $v['id']], 'stock');
            // pp($proSpec);
            if(!$proSpec){
                unset($productList[$k]);
                break;
            }else{
                foreach($proSpec as $kk => $vv){
                    $specStock += $vv;
                }
            }
            // pp($specStock);
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
                'title' => '商品列表',
                'product' => $productList,
                'keyword' => input('keyword'),
            ]);
    }

    //详情
    public function detail()
    {
        if(!input('pid'))$this->error("找不到商品");
        // $productDetail = Db::name('Product')->find(input('pid'));
        $productDetail = (new ProductModel)->getOneDarry(['id' => input('pid')]);
        $pictures = (new AdminAttachmentModel)->getColumn(['id' => ['in', explode(',', $productDetail['pictures'])]], 'id,name,path');
        // $spec = (new SpecModel)->getColumn(['id' => ['in', explode(',', $productDetail['spec'])]], 'id,name,product_id');
        $oriSpec = (new SpecModel)->getColumn(['product_id' => input('pid')], 'id,name,product_id,stock');
        if(!$oriSpec)$this->error("商品规格未添加");
        $spec = $oriSpec;
        $productDetail['stock'] = 0;
        if($oriSpec){
            foreach ($oriSpec as $k => $v) {
                $spec[$k]['is_able'] = false;
                if($v['stock'] > 0){
                    $spec[$k]['is_able'] = true;
                }
                $productDetail['stock'] += $v['stock'];
            }
        }
        if(!$productDetail['stock'])$this->error("商品库存不足");
        
        $userInfo = [];
        if(session('user_auth_index')){
            // $user = session('user_auth_index');
            // $userInfo = (new UserModel)->getOneDarry(['id' => $user['id']]);
            // if(isset($userInfo['pro_level'])){
            //     switch ($userInfo['pro_level']) {
            //         case '1':
            //             $productDetail['price'] = $productDetail['cost_price'];
            //             break;
            //         case '2':
            //             $productDetail['price'] = $productDetail['promotion_price'];
            //             break;
                    
            //         default:
            //             $productDetail['price'] = $productDetail['member_price'];
            //             break;
            //     }            
            // }
            $productDetail['price'] = $productDetail['member_price'];
        }else{
            $productDetail['price'] = $productDetail['price'];
        }
        // pp($productDetail);

        // return $this->fetch();
        return view('detail',[
                'title' => '商品详情',
                'product' => $productDetail,
                'pictures' => $pictures,
                'spec' => $spec,
                'session_user' => session('user_auth_index'),
            ]);
    }
}
