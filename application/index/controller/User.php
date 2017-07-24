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

use app\common\model\User as UserModel;
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
     * 支付密码
     * @author pp
     */
    public function paypass()
    {
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
                    'title' => '个人中心-支付密码',
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
                    'title' => '个人中心-登录密码',
            ]);
        }
    }

    /**
     * 资料修改
     * @author pp
     */
    public function profile()
    {
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
            return view('profile', [
                    'title' => '个人中心-资料修改',
                    'user' => $userInfo,
            ]);            
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

        // return $this->redirect('index/member/login');
        $this->success('退出成功', url('index/member/login'));
    }

    /**
     * 找回密码
     * @author pp
     */
    public function findpassword()
    {
        if(request()->isPost()){
            //
        }else{
            // return $this->fetch();
            return view('findpassword', [
                    'title' => '找回密码',
            ]);
        }
    }
}
