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
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }

        $map = $this->getMap();
        $productList = (new ProductModel)->getColumn($map);
        // pp($map);

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
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }

        $pid = input('pid');
        // $productDetail = Db::name('Product')->find($pid);
        $productDetail = (new ProductModel)->getOneDarry(['id' => $pid]);
        $pictures = (new AdminAttachmentModel)->getColumn(['id' => ['in', explode(',', $productDetail['pictures'])]], 'id,name,path');
        $spec = (new SpecModel)->getColumn(['id' => ['in', explode(',', $productDetail['spec'])]]);
        // pp($productDetail);

        // return $this->fetch();
        return view('detail',[
                'title' => '商品详情',
                'product' => $productDetail,
                'pictures' => $pictures,
                'spec' => $spec,
            ]);
    }
}
