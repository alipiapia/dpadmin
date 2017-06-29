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
 * 前台首页控制器
 * @package app\index\controller
 */
class Index extends Common
{
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

        //是否为移动设备
        if(!is_mobile()){
        	return "提示：请使用手机访问！";
        }

        return $this->fetch();
    }
}
