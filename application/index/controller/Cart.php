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
use app\common\model\Cart as CartModel;
use app\common\model\Spec as SpecModel;

/**
 * 前台购物车控制器
 * @package app\index\controller
 */
class Cart extends Home
{
        
    protected $user;
    protected $userInfo;
    protected $product;
    protected $cart;
    protected $spec;

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
        $this->userInfo = session('user_auth_index');
        $this->product = new ProductModel;
        $this->cart = new CartModel;
        $this->spec = new SpecModel;
    }

    //我的购物车首页
    public function index()
    {
        $map = [
            'uid' => $this->userInfo['id'],
        ];
        $cartLists = $this->cart->getLists($map);
        $newCartLists = $cartLists;
        foreach ($cartLists as $k => $v) {
            $newCartLists[$k]['product'] = $this->product->getOneDarry(['id' => $v['product_id']]);

            $userInfo = [];
            if(session('user_auth_index')){
                $user = session('user_auth_index');
                $userInfo = $this->user->getOneDarry(['id' => $user['id']]);
                if(isset($userInfo['pro_level'])){
                    switch ($userInfo['pro_level']) {
                        case '1':
                            $newCartLists[$k]['product']['price'] = $newCartLists[$k]['product']['cost_price'];
                            break;
                        case '2':
                            $newCartLists[$k]['product']['price'] = $newCartLists[$k]['product']['promotion_price'];
                            break;
                        
                        default:
                            $newCartLists[$k]['product']['price'] = $newCartLists[$k]['product']['member_price'];
                            break;
                    }            
                }
            }else{
                $newCartLists[$k]['product']['price'] = $newCartLists[$k]['product']['price'];
            }

            $newCartLists[$k]['product_spec_stock'] = $this->spec->getValue(['id' => $v['product_spec']], 'stock');
        }
        // pp($newCartLists);
        $view = count($newCartLists) ? 'index' : 'empty';

        return view($view, [
                'title' => '我的购物车',
                'cart' => $newCartLists,
            ]);
    }

    //我的购物车
    public function ulist()
    {
        //获取用户信息
        $sessionUser =session('user_auth_index');
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
        if(request()->isPost()){
            //
        }else{
            return view('udetail', [
                    'title' => '购物车详情',
            ]);
        }
    }

    /**
     * 个人中心-购物车-删除
     * @author pp
     */
    public function delete()
    {
        $delId = $this->cart->where(['id' => input('id')])->delete();
        return $delId ? 1 : 0;
        // $delId ? $this->success("删除成功") : $this->error("删除失败");
    }
}
