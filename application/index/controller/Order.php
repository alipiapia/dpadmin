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
use app\common\model\Spec as SpecModel;
use app\common\model\Order as OrderModel;
use app\common\model\UserAddress as UserAddressModel;
use app\common\model\UserAccount as UserAccountModel;
use app\common\model\Cart as CartModel;

/**
 * 前台订单控制器
 * @package app\index\controller
 */

class Order extends Home
{
        
    protected $user;
    protected $userInfo;
    protected $product;
    protected $spec;
    protected $order;
    protected $userAddress;
    protected $userAccount;
    protected $cart;

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
        $this->userInfo = session('user_auth_index');
        $this->product = new ProductModel;
        $this->spec = new SpecModel;
        $this->order = new OrderModel;
        $this->userAddress = new UserAddressModel;
        $this->userAccount = new UserAccountModel;
        $this->cart = new CartModel;
    }

    /**
     * 确认订单
     * @author pp
     */
    public function checkOrder()
    {
        $gets = request()->get();
        $data = json_decode($gets['products'],true);
        // pp($data);

        if(empty($data)){
            $this->error("商品不存在");
        }

        $orderInfo = [];
        foreach($data as $k => $v){
            $orderInfo[$k]['product_id'] = $v[0];
            $orderInfo[$k]['product_spec'] = $v[1];
            $orderInfo[$k]['product_spec_name'] = $this->spec->getValue(['id' => $v[1]], 'name');
            $orderInfo[$k]['product_count'] = $v[2];
            $orderInfo[$k]['cart_id'] = $v[3];
            $orderInfo[$k]['product'] = $this->product->getOneDarry(['id' => $v[0]]);//商品
        }

        $defaultAddress = $this->userAddress->getOneDarry(['uid' => $this->userInfo['id'], 'is_default' => 1]);//默认收货地址
        $latestAddress = $this->userAddress->getLists(['uid' => $this->userInfo['id']], 'update_time DESC', '', 1);//最近更新地址
        $address = $defaultAddress ? $defaultAddress : (isset($latestAddress[0]) ? $latestAddress[0] : []);//收货地址

        // $orderInfo['address'] = $this->userAddress->getColumn(['uid' => $this->userInfo['id']]);//收货地址
        // pp($orderInfo);

        return view('checkorder', [
                'title' => '确认订单',
                'session_user' => session('user_auth_index'),
                'order' => $orderInfo,
                'address' => $address,
        ]);
    }

    /**
     * 生成订单
     * @author pp
     */
    public function buildOrder(){
        $gets = request()->get();
        $pro = json_decode($gets['products'],true);
        // pp($pro);

        foreach($pro as $k => $v){
            //订单号生成
            $newOrderNo = $this->order->buildOrderNo();

            //商品详情
            $v['product_id'] = $v[0];unset($v[0]);
            $v['product_spec'] = $v[1];unset($v[1]);
            $v['product_count'] = $v[2];unset($v[2]);
            $v['buyer'] = $v[3];unset($v[3]);
            $v['buyer_address'] = $v[4];unset($v[4]);
            $v['order_note'] = $v[5];unset($v[5]);
            $cart_id = $v[6];unset($v[6]);
            $productInfo = $this->product->getOneDarry(['id' => $v['product_id']]);
            $v['product_price'] = $productInfo['price'];

            //检查订单号唯一性
            $orderCheck = $this->order->getValue(['order_sn' => $newOrderNo], 'order_sn');
            $v['order_sn'] = $orderCheck ? $this->order->buildOrderNo() : $newOrderNo;

            $v['order_price'] = $v['product_count'] * $v['product_price'];
            $checkResult = $this->validate($v, 'Order');
            // pp($addOrder);

            if(true !== $checkResult) return $this->error($checkResult);
            $creatOrder = OrderModel::create($v);
            if($creatOrder){
                $this->cart->where(['id' => $cart_id])->delete();
                $upData = [
                    'stock' => ($productInfo['stock'] - $v['product_count']),//更新库存
                    'sales' => ($productInfo['sales'] + $v['product_count']),//更新销售数量
                ];
                $upProduct = $this->product->upData($upData, ['id' => $productInfo['id']]);
                // return 1;
                // $this->redirect('index/order/ulist');
                continue;
            }else{
                // return 0;
                // $this->redirect('index/cart/index');
                break;
            }
            // return $creatOrder ? 1 : 0;
            // if ($order = OrderModel::create($data)) {
                // return $this->success('订单生成成功', url('index/Order/ulist'));
            // } else {
                // return $this->error('订单生成失败');
            // }
        }
        $this->redirect('index/ucenter/index');
    }

    /**
     * 检查支付密码
     * @author pp
     */
    public function checkPay(){
        $order_sn = input('order_sn') ? input('order_sn'): 0;
        $orderInfo = $this->order->getOneDarry(['order_sn' => $order_sn]);
        $userInfo = $this->user->getOneDarry(['id' => $this->userInfo['id']]);
        if(!$userInfo['paypass']){
            $this->error("请先设置支付密码", url('index/user/paypass'));
        }
        if(!input('order_sn') || !$orderInfo){
            $this->error("订单不存在");
        }

        return view('checkpay', [
                'title' => '支付订单',
                'order' => $orderInfo,
                'user' => $userInfo,
        ]);
    }

    /**
     * 支付订单
     * @author pp
     */
    public function payOrder(){
        $data = request()->post();
        $orderInfo = $this->order->getOneDarry(['order_sn' => $data['order_sn']]);
        //添加 除待付款以外状态不允许付款
        if($orderInfo['order_status'] != 0){
            // $this->error("订单已支付或被删除");
            return 2;
        }
        $payCheck = $this->user->checkPass($this->userInfo['id'], 'paypass', $data['paypass']);
        $userInfo = $this->user->getOneDarry(['id' => $this->userInfo['id']]);

        //密码验证通过，进行资金变动等操作
        if($payCheck){
            //更新订单信息
            $upUserOrder = $this->order->upData(['order_status' => 1, 'pay_status' => 1], ['order_sn' => $data['order_sn']]);

            //更新账户信息
            $upUser = $this->user->upData(['balance' => ($userInfo['balance'] - $orderInfo['order_price'])], ['id' => $this->userInfo['id']]);

            //添加账户明细记录
            $accountData = [
                'uid' => $this->userInfo['id'],
                'sign' => 1,
                'count' => $orderInfo['order_price'],
                'type' => 0,
            ];
            // $addUserAccount = UserAccountModel::create($accountData);
            $addUserAccount = add_user_account($accountData);
            //
            return 1;
        }else{
            return 0;
        }
    }

    /**
     * 取消订单
     * @author pp
     */
    public function cancelOrder()
    {
        if(!input('order_sn')){
            return 0;
        }

        $orderInfo = $this->order->getOneDarry(['order_sn' => input('order_sn')]);
        $productInfo = $this->product->getOneDarry(['id' => $orderInfo['product_id']]);

        //更新订单信息
        $upOrder = $this->order->upData(['order_status' => 3], ['order_sn' => input('order_sn')]);

        //更新商品库存信息
        // $upProduct = $this->product->where(['id' => $orderInfo['product_id']])->setInc('stock', $orderInfo['product_count']);
        // $upProduct = $this->product->where(['id' => $orderInfo['product_id']])->setDec('sales', $orderInfo['product_count']);
        $upData = [
            'stock' => ($productInfo['stock'] + $orderInfo['product_count']),//更新库存
            'sales' => ($productInfo['sales'] - $orderInfo['product_count']),//更新销售数量
        ];
        $upProduct = $this->product->upData($upData, ['id' => $productInfo['id']]);

        // return $upOrder ? 1 : 0;
        $upOrder ? $this->success("订单取消成功") : $this->error("订单取消失败");
    }

    //个人中心-我的订单
    public function ulist()
    {
        $map = ['buyer' => $this->userInfo['id']];

        if((input('order_status') !== null)){
            $map['order_status'] = input('order_status');
        }

        // pp($map); 

        //我的订单
        // $orders = $this->order->getColumn($map);
        $orders = $this->order->getLists($map, 'create_time DESC');
        // pp($orders);
        $newOrders = $orders;
        foreach ($orders as $k => $v) {
            $userAddress = $this->userAddress->getOneDarry(['id' => $v['buyer_address']]);
            $newOrders[$k]['address'] = $userAddress['username'] .' ' . $userAddress['mobile'] . '' .$userAddress['address'] . $v['order_note'];
        }
        // pp($newOrders);

        // return $this->fetch();
        return view('ulist', [
                'title' => '个人中心-我的订单',
                'order' => $newOrders,
                'config_order_status' => config('order.order_status'),
            ]);
    }

    /**
     * 个人中心-订单详情
     * @author pp
     */
    public function udetail()
    {
        if(!input('order_sn')){
            $this->error("订单不存在");
        }

        $orderInfo = $this->order->getOneDarry(['order_sn' => input('order_sn')]);
        $orderInfo['picture'] = get_product_value($orderInfo['product_id'], 'picture');
        // pp($orderInfo);

        if(request()->isPost()){
            pp(input('order_sn'));
        }else{
            return view('udetail', [
                    'title' => '个人中心-订单详情',
                    'order' => $orderInfo,
                    'config_order_status' => config('order.order_status'),
                    'config_pay_status' => config('order.pay_status'),
            ]);
        }
    }
}
