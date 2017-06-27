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
 * 前台用户控制器
 * @package app\index\controller
 */
class User extends Home
{
    protected function _initialize(){
        parent::_initialize();
        // pp(is_mobile());

        if(is_signin()){
            $this->redirect(url('index/index/index'));
        }
    }

    //首页
    public function index()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        $this->redirect(url('index/user/login'));
        // pp(request()->module());
        // $this->login();
    }

    //登录
    public function login()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        return $this->fetch();
    }

    //注册
    public function register()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        return $this->fetch();
    }

    //找回密码
    public function findPassword()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        return $this->fetch();
    }
}
