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
// use app\index\model\User as UserModel;

use think\Validate;
/**
 * 前台用户控制器
 * @package app\index\controller
 */
class User extends Home
{
    public $user;
    public function _initialize(){
        parent::_initialize();
        $this->user = model('User');
        // pp(is_mobile());

        if(is_signin()){
            $this->redirect(url('index/index/index'));
        }
    }

    //首页
    public function index()
    {
        pp($this->user->getValue('username'));
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
        if ($this->request->isPost()) {
            // 获取post数据
            $data = $this->request->post();
            pp($data);
            $rememberme = isset($data['remember-me']) ? true : false;

            // // 登录钩子
            // $hook_result = Hook::listen('signin', $data);
            // if (!empty($hook_result) && true !== $hook_result[0]) {
            //     $this->error($hook_result[0]);
            // }

            // 验证数据
            $result = $this->validate($data, 'User.login');
            if(true !== $result){
                // 验证失败 输出错误信息
                $this->error($result);
            }

            // // 验证码
            // if (config('captcha_signin')) {
            //     $captcha = $this->request->post('captcha', '');
            //     $captcha == '' && $this->error('请输入验证码');
            //     if(!captcha_check($captcha, '', config('captcha'))){
            //         //验证失败
            //         $this->error('验证码错误或失效');
            //     };
            // }

            // 登录
            $UserModel = new UserModel;
            $uid = $UserModel->login($data['username'], $data['password'], $rememberme);
            if ($uid) {
                // 记录行为
                // action_log('user_signin', 'admin_user', $uid, $uid);
                $this->success('登录成功', url('index/ucenter/index'));
            } else {
                $this->error($UserModel->getError());
            }
        } else {
            return is_signin() ? $this->redirect('index/ucenter/index') : $this->fetch();
        }
    }

    /**
     * 退出登录
     * @author thinkphp
     */
    public function logOut()
    {
        session(null);
        cookie('uid', null);
        cookie('signin_token', null);

        return $this->redirect('index/user/login');
    }

    //注册
    public function register()
    {
        // if(!is_mobile()){
        //     return "提示：请使用手机访问！";
        // }
        if ($this->request->isPost()) {
            $data = $this->request->post();
            // pp($data);

            // // 验证码
            // if (config('captcha_signin')) {
            //     $captcha = $this->request->post('captcha', '');
            //     $captcha == '' && $this->error('请输入验证码');
            //     if(!captcha_check($captcha, '', config('captcha'))){
            //         //验证失败
            //         $this->error('验证码错误或失效');
            //     };
            // }

            $res = $this->user->addData($data);
            if ($res) {
                $this->success('注册成功', url('index/ucenter/index'));
            } else {
                $this->error('注册失败');
            }
        } else {
            return is_signin() ? $this->redirect('index/ucenter/index') : $this->fetch();
        }
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
