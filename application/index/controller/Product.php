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

/**
 * 前台商品控制器
 * @package app\index\controller
 */
class Product extends Common
{

    //列表页
    public function index()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        // return $this->fetch();
        return view('index', [
                'title' => '商品列表',
            ]);
    }

    //详情
    public function detail()
    {
        $pid = input('pid');
        // $product_detail = Db::name('Product')->find($pid);
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        // return $this->fetch();
        return view('detail',[
                'title' => '商品详情',
                // 'data' => $product_detail
            ]);
    }
}
