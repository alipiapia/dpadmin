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

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
    }

    //首页
    public function ulist()
    {
        //获取用户信息
        $sessionUser =session('user_auth_index');
        $userInfo = $this->user->getOneDarry(['id' => $sessionUser['id']]);
        // pp($userInfo);

        // return $this->fetch();
        return view('ulist', [
                'title' => '个人中心-我的提成',
                'user' => $userInfo,
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
