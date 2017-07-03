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
 * 前台资金明细控制器
 * @package app\index\controller
 */

class Bill extends Home
{
        
    protected $user;

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('index/User', 'model');
        // pp(has_signin());
        // pp(session('user_auth'));
        // cookie(null);
        // pp($_COOKIE);
        // session(null);
        // pp($_SESSION);

        if(!has_signin()){
            // $this->redirect(url('index/user/login'));
            $this->error("您必须先登录，才能进行此操作", url('index/user/login'));
        }
    }

    //首页
    public function index()
    {
        // return '个人中心';
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }

        //获取用户信息
        $sessionUser =session('user_auth');
        $userInfo = $this->user->getOneDarry(['id' => $sessionUser['id']]);
        // pp($userInfo);

        // return $this->fetch();
        return view('index', [
                'title' => '个人中心-资金明细',
                'user' => $userInfo,
            ]);
    }

    /**
     * 资金明细
     * @author pp
     */
    public function detail()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        if(request()->isPost()){
            //
        }else{
            return view('detail', [
                    'title' => '个人中心-资金明细',
            ]);
        }
    }
}
