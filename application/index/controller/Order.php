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

use app\common\model\Product as ProductModel;
use app\common\model\UserAddress as UserAddressModel;

/**
 * 前台订单控制器
 * @package app\index\controller
 */

class Order extends Home
{
        
    protected $user;
    protected $userInfo;
    protected $product;
    protected $userAddress;

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
        $this->userInfo = session('user_auth');
        $this->product = new ProductModel;
        $this->userAddress = new UserAddressModel;

        if(!has_signin()){
            $this->error("您必须先登录，才能进行此操作", url('index/user/login'));
        }
    }

    /**
     * 生成订单
     * @author pp
     */
    public function buildOrder()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        $orderInfo['product'] = $this->product->getColumn('');//商品
        $orderInfo['address'] = $this->userAddress->getColumn(['uid' => $this->userInfo['id']]);//收货地址
        // pp($orderInfo);

        if(request()->isPost()){
            //
        }else{
            return view('buildorder', [
                    'title' => '确认订单',
                    'order' => $orderInfo,
            ]);
        }
    }

    //个人中心-我的订单
    public function ulist()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }

        //获取用户信息
        $sessionUser = session('user_auth');
        $userInfo = $this->user->getOneDarry(['id' => $sessionUser['id']]);
        // pp($userInfo);

        // return $this->fetch();
        return view('ulist', [
                'title' => '个人中心-我的订单',
                'user' => $userInfo,
            ]);
    }

    /**
     * 个人中心-订单详情
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
                    'title' => '个人中心-订单详情',
            ]);
        }
    }
}
