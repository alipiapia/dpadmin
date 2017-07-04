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

/**
 * 前台购物车控制器
 * @package app\index\controller
 */
class Cart extends Home
{

    //首页
    public function index()
    {
        // return '购物车';
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        // return $this->fetch();
        return view('index', [
                'title' => '购物车',
                // 'user' => $userInfo,
            ]);
    }
}