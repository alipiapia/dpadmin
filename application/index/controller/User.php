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

        // if(has_signin()){
        //     $this->redirect(url('index/index/index'));
        // }
    }

    /**
     * 首页
     * @author pp
     */
    public function index()
    {
        // pp($this->user->getValue('username'));
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        $this->redirect(url('index/user/login'));
        // pp(request()->module());
        // $this->login();
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
        // pp(session('user_auth'));
        // pp(has_signin());
        // pp(cookie('signin_token'));
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
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
     * 退出登录
     * @author pp
     */
    public function logout()
    {
        session(null);
        cookie('id', null);
        cookie('signin_token', null);

        // return $this->redirect('index/user/login');
        $this->success('退出成功', url('index/user/login'));
    }

    /**
     * 注册
     * @author pp
     */
    public function register()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        if ($this->request->isPost()) {
            $data = $this->request->post();
            // pp($data);

            // // 验证码
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

            $res = $this->user->addData($data);
            if ($res) {
                // $this->login($data['username'], $data['password']);
                $this->user->login($data['username'], $data['password']);
                $this->success($res, url('index/ucenter/index'));
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

    /**
     * 资料修改
     * @author pp
     */
    public function upprofile()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        $userInfo = $this->user->getOneDarry(['id' => UID]);
        if(request()->isPost()){
            $data = request()->post();
            // pp($data);
            if(!$data['nickname'])$this->error("昵称不能为空");
            if(!$data['email'])$this->error("邮箱不能为空");

            $upId = $this->user->upData(['nickname' => $data['nickname'], 'email' => $data['email']], ['id' => UID]);
            if($upId){
                $this->success("修改成功", url('index/ucenter/index'));
            }else{
                $this->error("修改失败");
            }
        }else{
            // return $this->fetch('findpassword');
            return view('upprofile', [
                    'title' => '资料修改',
                    'user' => $userInfo,
            ]);            
        }
    }

    /**
     * 支付密码
     * @author pp
     */
    public function paypass()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        $origin_paypass = $this->user->getValue(['id' => UID], 'paypass');//原密码
        if(request()->isPost()){
            $data = $this->request->post();
            
            if(isset($data['paypass'])){
                if(!$data['paypass'] || !$data['new_paypass'] || !$data['re_new_paypass'])$this->error("密码不能为空");
                if($data['new_paypass'] != $data['re_new_paypass'])$this->error("两次新密码不一致");
                if($data['paypass'] == $data['new_paypass'])$this->error("新密码不能和原密码相同");
                $checkpass = $this->user->checkPass(UID, 'paypass', $data['paypass']);
                if($checkpass){
                    goto end;
                }else{
                    $this->error("原密码错误");
                }                
            }else{
                if(!$data['new_paypass'] || !$data['re_new_paypass'])$this->error("密码不能为空");
                if($data['new_paypass'] != $data['re_new_paypass'])$this->error("两次新密码不一致");
                goto end;
            }
            end:
            $upId = $this->user->upData(['paypass' => $data['new_paypass']], ['id' => UID]);
            if($upId){
                $this->success("修改成功", url('index/ucenter/index'));
            }else{
                $this->error("修改失败");
            }
        }else{
            // return $this->fetch();
            return view('paypass', [
                    'title' => '支付密码',
                    'origin_paypass' => $origin_paypass,
            ]);
        }
    }

    /**
     * 登录密码
     * @author pp
     */
    public function loginpass()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        if(request()->isPost()){
            $data = $this->request->post();
            // $result = $this->validate($data['loginpass'], 'User');
            // pp($result);
            if(!$data['loginpass'] || !$data['new_loginpass'] || !$data['re_new_loginpass'])$this->error("密码不能为空");
            if($data['new_loginpass'] !== $data['re_new_loginpass'])$this->error("两次新密码不一致");
            if($data['loginpass'] == $data['new_loginpass'])$this->error("新密码不能和原密码相同");
            $checkpass = $this->user->checkPass(UID, 'password', $data['loginpass']);
            if($checkpass){
                $upId = $this->user->upData(['password' => $data['new_loginpass']], ['id' => UID]);
                if($upId){
                    $this->success("修改成功", url('index/ucenter/index'));
                }else{
                    $this->error("修改失败");
                }
            }else{
                $this->error("原密码错误");
            }
        }else{
            // return $this->fetch();
            return view('loginpass', [
                    'title' => '登录密码',
            ]);
        }
    }

    /**
     * 找回密码
     * @author pp
     */
    public function findpassword()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        if(request()->isPost()){
            //
        }else{
            // return $this->fetch();
            return view('findpassword', [
                    'title' => '找回密码',
            ]);
        }
    }

    /**
     * 收货地址
     * @author pp
     */
    public function address()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        if(request()->isPost()){
            //
        }else{
            // return $this->fetch();
            return view('address', [
                    'title' => '收货地址',
            ]);
        }
    }
}
