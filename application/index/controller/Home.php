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
 * 前台公共控制器
 * @package app\index\controller
 */
class Home extends Common
{
    /**
     * 初始化方法
     * @author thinkphp
     */
    protected function _initialize()
    {
        // 系统开关
        if (!config('web_site_status')) {
            $this->error('站点已经关闭，请稍后访问~');
        }

        //是否为移动设备
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }

        // 判断是否登录，并定义用户ID常量
        defined('UID') or define('UID', has_signin());
        
        // 前台公共模板
        $this->assign('_index_base_layout', config('index_base_layout'));

        // pp(has_signin());
    }
}
