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

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
        $this->userInfo = session('user_auth_index');
        $this->product = new ProductModel;
        $this->cart = new CartModel;
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
