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
 * 前台提成控制器
 * @package app\index\controller
 */

class Commission extends Home
{
        
    protected $user;
    protected $userAccount;

    protected function _initialize(){
        parent::_initialize();
        $this->userInfo = session('user_auth_index');
        $this->user = controller('common/User', 'model');
        $this->userAccount = controller('common/UserAccount', 'model');
    }

    //首页
    public function ulist()
    {
        //获取用户信息
        $userInfo = $this->user->getOneDarry(['id' => $this->userInfo['id']]);
        $commissions = $this->userAccount->getColumn(['uid' => $this->userInfo['id']]);
        $com_sum = $this->userAccount->where(['uid' => $this->userInfo['id']])->sum('count');
        // pp($commissions);

        // return $this->fetch();
        return view('ulist', [
                'title' => '个人中心-我的提成',
                'user' => $userInfo,
                'commission' => $commissions,
                'com_sum' => $com_sum
            ]);
    }

    /**
     * 提成详情
     * @author pp
     */
    public function udetail()
    {
        if(request()->isPost()){
            //
        }else{
            return view('udetail', [
                    'title' => '个人中心-提成详情',
            ]);
        }
    }
}
