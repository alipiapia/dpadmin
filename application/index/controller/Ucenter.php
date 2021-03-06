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
 * 前台个人中心控制器
 * @package app\index\controller
 */

class Ucenter extends Home
{
        
    protected $userInfo;
    protected $user;
    protected $order;
    protected $cart;

    protected function _initialize(){
        parent::_initialize();
        $this->userInfo = session('user_auth_index');
        $this->user = controller('common/User', 'model');
        $this->order = controller('common/Order', 'model');
        $this->cart = controller('common/Cart', 'model');
        // pp(has_signin());
        // pp(session('user_auth_index'));
        // cookie(null);
        // pp($_COOKIE);
        // session(null);
        // pp($_SESSION);
    }

    //首页
    public function index()
    {
        //获取用户信息
        $userInfo = $this->user->getOneDarry(['id' => $this->userInfo['id']]);

        //购物车内数量
        $cartNum = $this->cart->where(['uid' => $this->userInfo['id']])->count();

        return view('index', [
                'title' => '个人中心',
                'user' => $userInfo,
                'config_order_status' => config('order.order_status'),
                'cartnum' => $cartNum,
            ]);
    }
}
