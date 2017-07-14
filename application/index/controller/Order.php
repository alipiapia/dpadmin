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

use app\common\model\Order as OrderModel;
use app\common\model\Product as ProductModel;
use app\common\model\UserAddress as UserAddressModel;
use app\common\model\Spec as SpecModel;

/**
 * 前台订单控制器
 * @package app\index\controller
 */

class Order extends Home
{
        
    protected $user;
    protected $userInfo;
    protected $order;
    protected $product;
    protected $userAddress;
    protected $spec;

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
        $this->userInfo = session('user_auth_index');
        $this->order = new OrderModel;
        $this->product = new ProductModel;
        $this->userAddress = new UserAddressModel;
        $this->spec = new SpecModel;

        if(!has_signin()){
            $this->redirect(url('index/index/loginpatch'));
            // $this->error("您必须先登录，才能进行此操作", url('index/user/login'));
        }
    }

    /**
     * 确认订单
     * @author pp
     */
    public function checkOrder()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        $data = request()->get();
        if(empty($data['product_id'])){
            $this->error("商品不存在");
        }

        $orderInfo['product_id'] = $data['product_id'];
        $orderInfo['product_spec'] = $data['product_spec'];
        $orderInfo['product_spec_name'] = $this->spec->getValue(['id' => $data['product_spec']], 'name');
        $orderInfo['product_count'] = $data['product_count'];
        $orderInfo['product'] = $this->product->getOneDarry(['id' => $data['product_id']]);//商品

        $defaultAddress = $this->userAddress->getOneDarry(['uid' => $this->userInfo['id'], 'is_default' => 1]);//默认收货地址
        $latestAddress = $this->userAddress->getLists(['uid' => $this->userInfo['id']], 'update_time DESC', '', 1);//最近更新地址
        $orderInfo['address'] = $defaultAddress ? $defaultAddress : (isset($latestAddress[0]) ? $latestAddress[0] : []);//收货地址
        // $orderInfo['address'] = $this->userAddress->getColumn(['uid' => $this->userInfo['id']]);//收货地址
        // pp($orderInfo);

        return view('checkorder', [
                'title' => '确认订单',
                'order' => $orderInfo,
                'session_user' => session('user_auth_index'),
        ]);
    }

    /**
     * 生成订单
     * @author pp
     */
    public function buildOrder(){
        $data = request()->post();
        //订单号生成
        $newOrderNo = $this->order->buildOrderNo();
        $orderCheck = $this->order->getValue(['order_sn' => $newOrderNo], 'order_sn');//检查订单号唯一性
        $data['order_sn'] = $orderCheck ? $this->order->buildOrderNo() : $newOrderNo;

        //商品信息
        $data['product_price'] = $this->product->getValue(['id' => $data['product_id']], 'price');
        $data['order_price'] = $data['product_count'] * $data['product_price'];
        $checkResult = $this->validate($data, 'Order');
        // pp($addOrder);
        if(true !== $checkResult) return $this->error($checkResult);
        $creatOrder = OrderModel::create($data);
        return $creatOrder ? 1 : 0;
        // if ($order = OrderModel::create($data)) {
            // return $this->success('订单生成成功', url('index/Order/ulist'));
        // } else {
            // return $this->error('订单生成失败');
        // }
    }

    /**
     * 支付订单
     * @author pp
     */
    public function payOrder(){        
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }
        pp("pp");
        $order_sn = input('order_sn');
        $orderInfo = $this->order->getOneDarry(['order_sn' => $order_sn]);
        $userInfo = $this->user->getOneDarry(['id' => $this->userInfo['id']]);
        if(request()->isPost()){
            //
        }else{
            return view('payorder', [
                    'title' => '支付订单',
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
        $sessionUser = session('user_auth_index');
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
