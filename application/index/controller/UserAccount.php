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

use app\common\model\UserAddress as UserAddressModel;

/**
 * 用户资金变动控制器
 * @package app\index\controller
 */

class UserAccount extends Home
{
        
    protected $user;
    protected $userInfo;
    protected $userAccount;

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
        $this->userInfo = session('user_auth_index');
        $this->userAccount = new UserAddressModel;

        if(!has_signin()){
            $this->redirect(url('index/index/loginpatch'));
            // $this->error("您必须先登录，才能进行此操作", url('index/user/login'));
        }
    }

    //个人中心-我的收货地址
    public function ulist()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }

        //获取用户信息
        // $uid = $this->user->getValue(['id' => $this->userInfo['id']], 'id');
        $userAccount = $this->userAccount->getColumn(['uid' => $this->userInfo['id']], 'id,uid,username,mobile,address');
        // pp($userAccount);

        // return $this->fetch();
        return view('useraccount/ulist', [
                'title' => '个人中心-我的收货地址',
                'useraccount' => $userAccount,
            ]);
    }

    /**
     * 个人中心-资金详情
     * @author pp
     */
    public function udetail()
    {
        if(!is_mobile()){
            return "提示：请使用手机访问！";
        }

        // pp($orderInfo);

        if(request()->isPost()){
            pp(input('order_sn'));
        }else{
            return view('useraccount/udetail', [
                    'title' => '个人中心-订单详情',
                    'config_order_status' => config('order.order_status'),
                    'config_pay_status' => config('order.pay_status'),
            ]);
        }
    }

    /**
     * 个人中心-收货地址-删除
     * @author pp
     */
    public function udelete()
    {
        $delId = $this->userAccount->where(['id' => input('id')])->delete();
        // return $delId ? 1 : 0;
        $delId ? $this->success("删除成功") : $this->error("删除失败");
    }
}
