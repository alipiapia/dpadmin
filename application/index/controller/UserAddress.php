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
 * 收货地址控制器
 * @package app\index\controller
 */

class UserAddress extends Home
{
        
    protected $user;
    protected $userInfo;
    protected $userAddress;

    protected function _initialize(){
        parent::_initialize();
        $this->user = controller('common/User', 'model');
        $this->userInfo = session('user_auth_index');
        $this->userAddress = new UserAddressModel;
    }

    /**
     * 选择收货人
     * @author pp
     */
    public function selectAddress()
    {
        $map = ['uid' => $this->userInfo['id']];
        $userAddress = $this->userAddress->getColumn($map, 'id,uid,username,mobile,address');
        // pp($userAddress);

        if(request()->isPost()){
            //
        }else{
            return view('useraddress/selectaddress', [
                    'title' => '选择收货人',
                    'useraddress' => $userAddress,
            ]);
        }
    }

    //个人中心-我的收货地址
    public function ulist()
    {
        $map = $this->getMap();
        $map['uid'] = $this->userInfo['id'];
        // pp($map);
        // if(isset($map['username'])){
        //     if (preg_match("/^1\d{10}$/", trim($map['username'][1], '%'))) {
        //         // 手机号登录
        //         $map['mobile'] = ['like', $map['username'][1]];
        //     } else {
        //         // 用户名登录
        //         $map['username'] = ['like', $map['username'][1]];
        //     }
        // }
        $map['username|mobile'] = $map['username'];unset($map['username']);
        // pp($map);

        //获取用户信息
        // $uid = $this->user->getValue(['id' => $this->userInfo['id']], 'id');
        $userAddress = $this->userAddress->getColumn($map, 'id,uid,username,mobile,address');
        // pp($userAddress);

        // return $this->fetch();
        return view('useraddress/ulist', [
                'title' => '个人中心-我的收货地址',
                'useraddress' => $userAddress,
                'keyword' => (input('keyword') !== null) ? input('keyword') : ''
            ]);
    }

    /**
     * 个人中心-收货地址-添加
     * @author pp
     */
    public function uadd()
    {   
        if(request()->isPost()){
            $data = request()->post();
            $data['uid'] = $this->userInfo['id'];
            // pp($data);

            // 验证数据
            $result = $this->validate($data, 'UserAddress');
            if(true !== $result){
                // 验证失败 输出错误信息
                $this->error($result);
            }

            $res = UserAddressModel::create($data);
            if ($res) {
                $this->success('收货地址添加成功');
            } else {
                $this->error($res);
            }
        }else{
            return view('useraddress/uadd', [
                    'title' => '个人中心-收货地址-添加',
            ]);
        }
    }

    /**
     * 个人中心-收货地址-编辑
     * @author pp
     */
    public function uedit()
    {
        $addressInfo = $this->userAddress->getOneDarry(['id' => input('id')]);
        // pp($addressInfo);

        if(request()->isPost()){
            $data = request()->post();
            // pp($data);

            // 验证数据
            $result = $this->validate($data, 'UserAddress');
            if(true !== $result){
                // 验证失败 输出错误信息
                $this->error($result);
            }

            $res = $this->userAddress->save($data, ['id' => $data['id']]);
            if ($res) {
                $this->success('收货地址更新成功', url('index/UserAddress/ulist'));
            } else {
                $this->error($res);
            }

        }else{
            return view('useraddress/uedit', [
                    'title' => '个人中心-收货地址-编辑',
                    'addressinfo' => $addressInfo,
            ]);
        }
    }

    /**
     * 个人中心-收货地址-删除
     * @author pp
     */
    public function udelete()
    {
        $delId = $this->userAddress->where(['id' => input('id')])->delete();
        // return $delId ? 1 : 0;
        $delId ? $this->success("删除成功") : $this->error("删除失败");
    }
}
