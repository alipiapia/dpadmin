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
        $data = request()->get();
        if(empty($data['product_id'])){
            $this->error("商品不存在");
        }
        //添加到购物车
        $data['uid'] = $this->userInfo['id'];
        $cartMap = ['uid' => $data['uid'], 'product_id' => $data['product_id'], 'product_spec' => $data['product_spec']];//检查是否为同一规格商品
        $cartCheck = $this->cart->getOneDarry($cartMap);
        if($cartCheck){
            $this->cart->where($cartMap)->setInc('product_count', $data['product_count']);
        }else{
            $checkResult = $this->validate($data, 'Cart');
            if(true !== $checkResult) return $this->error($checkResult);
            $this->cart->create($data);            
        }
        $this->redirect(url('index/cart/index'));die;
        
        $orderInfo['product_id'] = $data['product_id'];
        $orderInfo['product_spec'] = $data['product_spec'];
        $orderInfo['product_spec_name'] = $this->spec->getValue(['id' => $data['product_spec']], 'name');
        $orderInfo['product_spec_stock'] = $this->spec->getValue(['id' => $data['product_spec']], 'stock');
        $orderInfo['product_count'] = $data['product_count'];
        $orderInfo['product'] = $this->product->getOneDarry(['id' => $data['product_id']]);//商品

        $userInfo = [];
        if(session('user_auth_index')){
            // $user = session('user_auth_index');
            // $userInfo = $this->user->getOneDarry(['id' => $user['id']]);
            // if(isset($userInfo['pro_level'])){
            //     switch ($userInfo['pro_level']) {
            //         case '1':
            //             $orderInfo['product']['price'] = $orderInfo['product']['cost_price'];
            //             break;
            //         case '2':
            //             $orderInfo['product']['price'] = $orderInfo['product']['promotion_price'];
            //             break;
                    
            //         default:
            //             $orderInfo['product']['price'] = $orderInfo['product']['member_price'];
            //             break;
            //     }            
            // }
            $orderInfo['product']['price'] = $orderInfo['product']['member_price'];
        }else{
            $orderInfo['product']['price'] = $orderInfo['product']['price'];
        }

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
     * 确认购物车订单
     * @author pp
     */
    public function checkCartOrder()
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
            $orderInfo[$k]['product_spec_stock'] = $this->spec->getValue(['id' => $v[1]], 'stock');
            $orderInfo[$k]['product_count'] = $v[2];
            $orderInfo[$k]['cart_id'] = $v[3];
            $orderInfo[$k]['product'] = $this->product->getOneDarry(['id' => $v[0]]);//商品

            $userInfo = [];
            if(session('user_auth_index')){
                // $user = session('user_auth_index');
                // $userInfo = $this->user->getOneDarry(['id' => $user['id']]);
                // if(isset($userInfo['pro_level'])){
                //     switch ($userInfo['pro_level']) {
                //         case '1':
                //             $orderInfo[$k]['product']['price'] = $orderInfo[$k]['product']['cost_price'];
                //             break;
                //         case '2':
                //             $orderInfo[$k]['product']['price'] = $orderInfo[$k]['product']['promotion_price'];
                //             break;
                        
                //         default:
                //             $orderInfo[$k]['product']['price'] = $orderInfo[$k]['product']['member_price'];
                //             break;
                //     }            
                // }
                $orderInfo[$k]['product']['price'] = $orderInfo[$k]['product']['member_price'];
            }else{
                $orderInfo[$k]['product']['price'] = $orderInfo['product']['price'];
            }
        }

        $defaultAddress = $this->userAddress->getOneDarry(['uid' => $this->userInfo['id'], 'is_default' => 1]);//默认收货地址
        $latestAddress = $this->userAddress->getLists(['uid' => $this->userInfo['id']], 'update_time DESC', '', 1);//最近更新地址
        $address = $defaultAddress ? $defaultAddress : (isset($latestAddress[0]) ? $latestAddress[0] : []);//收货地址

        // $orderInfo['address'] = $this->userAddress->getColumn(['uid' => $this->userInfo['id']]);//收货地址
        // pp($orderInfo);

        return view('checkcartorder', [
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
            $v['shipping_fee'] = $v[5];unset($v[5]);
            $v['order_note'] = $v[6];unset($v[6]);
            if(isset($v[7])){
                $cart_id = $v[7];
                unset($v[7]);
            }else{
                $cart_id = 0;
            }
            $productInfo = $this->product->getOneDarry(['id' => $v['product_id']]);

            $userInfo = [];
            if(session('user_auth_index')){
                // $user = session('user_auth_index');
                // $userInfo = $this->user->getOneDarry(['id' => $user['id']]);
                // if(isset($userInfo['pro_level'])){
                //     switch ($userInfo['pro_level']) {
                //         case '1':
                //             $v['product_price'] = $productInfo['cost_price'];
                //             break;
                //         case '2':
                //             $v['product_price'] = $productInfo['promotion_price'];
                //             break;
                        
                //         default:
                //             $v['product_price'] = $productInfo['member_price'];
                //             break;
                //     }            
                // }
                $v['product_price'] = $productInfo['member_price'];
            }else{
                $v['product_price'] = $productInfo['price'];
            }
            // $v['product_price'] = $productInfo['price'];

            //检查订单号唯一性
            $orderCheck = $this->order->getValue(['order_sn' => $newOrderNo], 'order_sn');
            $v['order_sn'] = $orderCheck ? $this->order->buildOrderNo() : $newOrderNo;

            $v['order_price'] = $v['product_count'] * $v['product_price'] + $v['shipping_fee'];
            $checkResult = $this->validate($v, 'Order.add');
            // pp($addOrder);

            if(true !== $checkResult) return $this->error($checkResult);
            $creatOrder = OrderModel::create($v);
            if($creatOrder){
                $this->cart->where(['id' => $cart_id])->delete();
                $upData = [
                    // 'stock' => ($productInfo['stock'] - $v['product_count']),//更新库存
                    'sales' => ($productInfo['sales'] + $v['product_count']),//更新销售数量
                ];
                $upProduct = $this->product->upData($upData, ['id' => $productInfo['id']]);
                $upSpecStock = $this->spec->where(['id' => $v['product_spec']])->setDec('stock', $v['product_count']);
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
        $orderInfo = $this->order->getOneDarry(['order_sn' => $data['order_sn']]);//订单详情
        $productInfo = $this->product->getOneDarry(['id' => $orderInfo['product_id']]);//商品详情
        $curUser = $this->user->getOneDarry(['id' => $orderInfo['buyer']]);//当前用户
        $refUser = $this->user->getOneDarry(['mobile' => $curUser['ref_mobile']]);//直属上级用户
        $groupTopUser = $this->user->getOneDarry(['mobile' => $curUser['group_mobile']]);//团队队长用户
        // pp($groupTopUser);
        //添加 除待付款以外状态不允许付款
        if($orderInfo['order_status'] != 0){
            // $this->error("订单已支付或被删除");
            return 2;
        }
        $payCheck = $this->user->checkPass($this->userInfo['id'], 'paypass', $data['paypass']);
        $userInfo = $this->user->getOneDarry(['id' => $this->userInfo['id']]);

        //密码验证通过，进行资金变动等操作
        if($payCheck){

            //账户资金明细type
            $configAccountType = config('order.account_type');

            //团队奖励
            $proPercent = (int)config('group_prize');

            //更新订单信息
            $upUserOrder = $this->order->upData(['order_status' => 1, 'pay_status' => 1], ['order_sn' => $data['order_sn']]);

            //更新当前账户信息
            // $upCurUser = $this->user->upData(['balance' => ($userInfo['balance'] - $orderInfo['order_price'])], ['id' => $this->userInfo['id']]);
            $upCurUser = $this->user->where(['id' => $this->userInfo['id']])->setDec('balance', $orderInfo['order_price']);

            //添加当前账户明细记录
            $curAccountData = [
                'uid' => $this->userInfo['id'],
                'sign' => 1,
                'count' => $orderInfo['order_price'],
                'type' => 0,
                'desc' => '购买商品:'.$productInfo['name'].' 数量：'.$orderInfo['product_count'].' 产生:'.$configAccountType[0]
            ];
            // $addCurUserAccount = UserAccountModel::create($curAccountData);
            $addCurUserAccount = add_user_account($curAccountData);


            //二级代理商 推荐佣金 计算
            if($curUser['pro_level'] == 2){                
                $additionalPrice = $productInfo['member_price'] - $productInfo['promotion_price'];//差价=会员价-代理价
                $additionalPrice = ($additionalPrice > 0) ? $additionalPrice : 0;
                if($additionalPrice){
                    $additionalPrice *= $orderInfo['product_count'];
                    $upGroupTopUser = $this->user->where(['id' => $curUser['id']])->setInc('balance', $additionalPrice);
                    $groupTopAccountData = [
                        'uid' => $curUser['id'],
                        'sign' => 2,
                        'count' => $additionalPrice,
                        'type' => 3,
                        'desc' => '用户:'.$userInfo['username'].' 购买商品:'.$productInfo['name'].' 数量：'.$orderInfo['product_count'].' 产生:'.$configAccountType[3]
                    ];
                    $addGroupTopUserAccount = add_user_account($groupTopAccountData);
                }
            }

            //当前用户代理等级pro_level > 2时，进行团队奖励&推荐佣金计算
            if($curUser['pro_level'] > 2){

                //团队奖励 开始
                if($refUser){
                    $proPercent = (isset($proPercent) && $proPercent > 0) ? $proPercent : 0;//团队奖励
                    // $upRefUser = $this->user->upData(['balance' => ($userInfo['balance'] - $orderInfo['order_price'])], ['id' => $this->userInfo['id']]);
                    if($proPercent){
                        $proPercent *= $orderInfo['product_count'];
                        $upRefUser = $this->user->where(['id' => $refUser['id']])->setInc('balance', $proPercent);
                        $refAccountData = [
                            'uid' => $refUser['id'],
                            'sign' => 2,
                            'count' => $proPercent,
                            'type' => 2,
                            'desc' => '用户:'.$userInfo['username'].' 购买商品:'.$productInfo['name'].' 数量：'.$orderInfo['product_count'].' 产生:'.$configAccountType[2]
                        ];
                        $addRefUserAccount = add_user_account($refAccountData);  
                    }              
                }

                //推荐佣金 开始
                if($groupTopUser){
                    $additionalPrice = $productInfo['member_price'] - $productInfo['promotion_price'];//推荐佣金=会员价-代理价
                    $additionalPrice = ($additionalPrice > 0) ? $additionalPrice : 0;
                    if($additionalPrice){
                        $additionalPrice *= $orderInfo['product_count'];
                        $upGroupTopUser = $this->user->where(['id' => $groupTopUser['id']])->setInc('balance', $additionalPrice);
                        $groupTopAccountData = [
                            'uid' => $groupTopUser['id'],
                            'sign' => 2,
                            'count' => $additionalPrice,
                            'type' => 3,
                            'desc' => '用户:'.$userInfo['username'].' 购买商品:'.$productInfo['name'].' 数量：'.$orderInfo['product_count'].' 产生:'.$configAccountType[3]
                        ];
                        $addGroupTopUserAccount = add_user_account($groupTopAccountData);
                    }
                }
            }

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
        $specInfo = $this->spec->getOneDarry(['id' => $orderInfo['product_spec']]);
//		pp($specInfo);

        //更新订单信息
        $upOrder = $this->order->upData(['order_status' => 4], ['order_sn' => input('order_sn')]);

        //更新商品库存信息
        // $upProduct = $this->product->where(['id' => $orderInfo['product_id']])->setInc('stock', $orderInfo['product_count']);
        // $upProduct = $this->product->where(['id' => $orderInfo['product_id']])->setDec('sales', $orderInfo['product_count']);		
		$proData = [
			//'stock' => ($productInfo['stock'] + $orderInfo['product_count']),//更新库存
			'sales' => (($productInfo['sales'] - $orderInfo['product_count']) > 0) ? ($productInfo['sales'] - $orderInfo['product_count']) : 0,//更新销售数量
		];
        $upProduct = $this->product->upData($proData, ['id' => $productInfo['id']]);

		$speData = [
			'stock' => $specInfo['stock'] + $orderInfo['product_count'],//更新库存
		];
		$upSpec = $this->spec->upData($speData, ['product_id' => $orderInfo['product_id']]);

        // return $upOrder ? 1 : 0;
        $upOrder ? $this->success("订单取消成功") : $this->error("订单取消失败");
    }

    //个人中心-我的订单
    public function ulist()
    {
        $map = $this->getMap();
        $map['buyer'] = $this->userInfo['id'];

        if((input('order_status') !== null)){
            $map['order_status'] = input('order_status');
        }
        if(isset($map['order_sn'])){
            $map['order_sn|shipping_num'] = $addressMap['username|mobile'] = $map['order_sn'];
            $addrIds = $this->userAddress->getColumn($addressMap, 'id');
            if($addrIds){
                $map['buyer_address'] = ['in', $addrIds];
                unset($map['order_sn|shipping_num']);
            }
            unset($map['order_sn']);
        }

        // pp($map); 

        //我的订单
        // $orders = $this->order->getColumn($map);
        $orders = $this->order->getLists($map, 'create_time DESC');
        // pp($orders);
        $newOrders = $orders;
        foreach ($orders as $k => $v) {
            $userAddress = $this->userAddress->getOneDarry(['id' => $v['buyer_address']]);
			if($userAddress){
				$newOrders[$k]['address'] = $userAddress['username'] .' ' . $userAddress['mobile'] . ' ' . $userAddress['prov'] .'省/'. $userAddress['city'].'市/'. $userAddress['dist'] .$userAddress['address'] . ' '. $v['order_note'];
			}else{
				$newOrders[$k]['address'] = '';
			}
        }
        // pp($newOrders);

        // return $this->fetch();
        return view('ulist', [
                'title' => '个人中心-我的订单',
                'order' => $newOrders,
                'config_order_status' => config('order.order_status'),
                'keyword' => (input('keyword') !== null) ? input('keyword') : ''
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
        $userAddress = $this->userAddress->getOneDarry(['id' => $orderInfo['buyer_address']]);
		$orderInfo['allAddress'] = '';
		if($userAddress){
			$orderInfo['allAddress'] = $userAddress['prov'] .'省/'. $userAddress['city'].'市/'. $userAddress['dist'] .$userAddress['address'];			
		}
//		pp($userAddress);

        // if(request()->isPost()){
        //     pp(input('order_sn'));
        // }else{
            return view('udetail', [
                    'title' => '个人中心-订单详情',
                    'order' => $orderInfo,
                    'config_order_status' => config('order.order_status'),
                    'config_pay_status' => config('order.pay_status'),
            ]);
        // }
    }
}
