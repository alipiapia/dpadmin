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

namespace app\index\validate;

use think\Validate;

/**
 * 用户验证器
 * @package app\admin\validate
 * @author thinkphp
 */
class User extends Validate
{
    //定义验证规则
    protected $rule = [
        'username|用户名' => 'require|alphaNum|unique:User',
        'password|密码'  => 'require|length:6,20',
        'ref_mobile|推荐人手机号'      => 'require',
        // 'email|邮箱'     => 'email|unique:User',
        'mobile|手机号'   => 'regex:^1\d{10}|unique:User',
    ];

    //定义验证提示
    protected $message = [
        'username.require' => '请输入用户名',
        // 'email.require'    => '邮箱不能为空',
        // 'email.email'      => '邮箱格式不正确',
        // 'email.unique'     => '该邮箱已存在',
        'password.require' => '密码不能为空',
        'password.length'  => '密码长度6-20位',
        'mobile.regex'     => '手机号不正确',
    ];

    //定义验证场景
    protected $scene = [
        //更新password
        'update'  =>  ['email', 'password' => 'length:6,20', 'mobile'],
        //登录
        'login'  =>  ['username' => 'require', 'password' => 'require'],
        //注册
        'register'  =>  ['username' => 'require', 'password' => 'require','ref_mobile'],
    ];
}