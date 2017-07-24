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
    // protected function _initialize()
    // {
    //     parent::_initialize();
    // }

    //列表页
    public function index()
    {
        $map = $this->getMap();
        $map['status'] = 1;
        // $map['group_end_time'] = ['gt', time()];
        // pp($map);
        // $productList = (new ProductModel)->getColumn($map);
        $productList = (new ProductModel)->getLists($map, 'sales desc', '');//热卖商品
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
        $pid = input('pid');
        // $productDetail = Db::name('Product')->find($pid);
        $productDetail = (new ProductModel)->getOneDarry(['id' => $pid]);
        $pictures = (new AdminAttachmentModel)->getColumn(['id' => ['in', explode(',', $productDetail['pictures'])]], 'id,name,path');
        $spec = (new SpecModel)->getColumn(['id' => ['in', explode(',', $productDetail['spec'])]], 'id,name,product_id');
        // pp($spec);

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
