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
        
    protected $user;

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');

        if(!has_signin()){
            $this->redirect(url('index/index/loginpatch'));
            // $this->error("您必须先登录，才能进行此操作", url('index/user/login'));
        }
    }

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

    //我的购物车
    public function ulist()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }

        //获取用户信息
        $sessionUser =session('user_auth');
        $userInfo = $this->user->getOneDarry(['id' => $sessionUser['id']]);
        // pp($userInfo);

        // return $this->fetch();
        return view('ulist', [
                'title' => '我的购物车',
                'user' => $userInfo,
            ]);
    }

    /**
     * 购物车详情
     * @author pp
     */
    public function udetail()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        if(request()->isPost()){
            //
        }else{
            return view('udetail', [
                    'title' => '购物车详情',
            ]);
        }
    }
}
