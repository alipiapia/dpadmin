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

use app\common\model\UserAccount as UserAccountModel;

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
        $this->userAccount = new UserAccountModel;
    }

    //个人中心-我的资金明细
    public function ulist()
    {
        //获取用户信息
        $map = ['uid' => $this->userInfo['id']];
        // $uid = $this->user->getValue(['id' => $this->userInfo['id']], 'id');
        // $userAccount = $this->userAccount->getColumn(['uid' => $this->userInfo['id']], 'id,uid,sign,count,type,create_time');
        $userAccount = $this->userAccount->getLists($map, 'create_time DESC', 'id,uid,sign,count,type,create_time');
        // pp(count($userAccount));

        // return $this->fetch();
        return view('useraccount/ulist', [
                'title' => '个人中心-我的资金明细',
                'useraccount' => $userAccount,
                'config_account_type' => config('order.account_type'),
            ]);
    }

    /**
     * 个人中心-资金详情
     * @author pp
     */
    public function udetail()
    {
        if(!input('id')){
            $this->error("找不到资金明细");
        }

        $accountInfo = $this->userAccount->getOneDarry(['id' => input('id')]);

        if(!$accountInfo){
            $this->error("找不到资金明细");
        }
        // pp($accountInfo);
        return view('useraccount/udetail', [
                'title' => '个人中心-资金明细',
                'accountinfo' => $accountInfo,
                'balance' => get_user_value($this->userInfo['id'], 'balance'),
                'config_account_type' => config('order.account_type'),
        ]);
    }

    /**
     * 个人中心-资金详情-删除
     * @author pp
     */
    public function udelete()
    {
        $delId = $this->userAccount->where(['id' => input('id')])->delete();
        // return $delId ? 1 : 0;
        $delId ? $this->success("删除成功") : $this->error("删除失败");
    }
}
