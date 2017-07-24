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
use think\Validate;

/**
 * 登录注册控制器
 * @package app\index\controller
 */

class Member extends Common
{
    public $user;

    public function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
    }

    /**
     * 首页
     * @author pp
     */
    public function index()
    {
        $this->redirect(url('index/member/login'));
    }

    /**
     * 登录
     * @author pp
     */
    public function login()
    {
        // cookie(null);
        // pp($_COOKIE);
        // session(null);
        // pp($_SESSION);
        // pp(session('user_auth_index'));
        // pp(has_signin());
        // pp(cookie('signin_token'));
        // if(has_signin()){
        //     $this->redirect(url('index/index/index'));
        // }
        if ($this->request->isPost()) {
            // 获取post数据
            $data = $this->request->post();
            // pp($data);
            $rememberme = isset($data['remember-me']) ? true : false;

            // // 登录钩子
            // $hook_result = Hook::listen('signin', $data);
            // if (!empty($hook_result) && true !== $hook_result[0]) {
            //     $this->error($hook_result[0]);
            // }

            // 验证数据
            // $result = $this->validate($data, 'User.login');
            // if(true !== $result){
            //     // 验证失败 输出错误信息
            //     $this->error($result);
            // }

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
            $uid = $this->user->login($data['username'], $data['password'], $rememberme);
            if ($uid) {
                // 记录行为
                // action_log('user_signin', 'admin_user', $uid, $uid);
                $this->success('登录成功', url('index/ucenter/index'));
            } else {
                $this->error($this->user->getError());
            }
        } else {
            // return is_signin() ? $this->redirect('index/ucenter/index') : $this->fetch();
            if(has_signin()){
                $this->redirect('index/ucenter/index');
            }else{
                return view('login', [
                        'title' => '登录',
                ]);                
            }
        }
    }

    /**
     * 注册
     * @author pp
     */
    public function register()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();

            // 验证数据
            $result = $this->validate($data, 'User.register');
            if(true !== $result){
                // 验证失败 输出错误信息
                $this->error($result);
            }

            // 验证码
            // if (config('captcha_signin')) {
                $captcha = $this->request->post('captcha', '');
                $captcha == '' && $this->error('请输入验证码');
                if(!captcha_check($captcha, '', config('captcha'))){
                    //验证失败
                    $this->error('验证码错误或失效');
                };
            // }

            // $this->validate($verify,[
            //     'captcha|验证码'=>'require|captcha'
            // ]);

            // $res = $this->user->addData($data);
            $res = UserModel::create($data);
            if ($res) {
                // $this->login($data['username'], $data['password']);
                $this->user->login($data['username'], $data['password']);
                $this->success('注册成功，自动登录中...', url('index/ucenter/index'));
            } else {
                $this->error($res);
            }
        } else {
            // return is_signin() ? $this->redirect('index/ucenter/index') : $this->fetch();
            if(has_signin()){
                $this->redirect('index/ucenter/index');
            }else{
                return view('register', [
                        'title' => '注册',
                ]);                
            }
        }
    }
}