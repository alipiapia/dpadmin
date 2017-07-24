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
use app\common\model\Product as ProductModel;
use app\common\model\Cate as CateModel;

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
