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

namespace app\common\validate;

use think\Validate;

/**
 * 收货地址验证器
 * @package app\common\validate
 * @author pp
 */
class UserAddress extends Validate
{
    //定义验证规则
    protected $rule = [
        'username|收货人' => 'require|chsDash',
        'mobile|手机号'   => 'require|regex:^1\d{10}',
        'address|详细地址'      => 'require',
    ];

    //定义验证提示
    protected $message = [
        'username.require' => '收货人不能为空',
        'username.chsDash' => '请输入有效字符',
        'mobie.require'    => '手机号码不能为空',
        'mobile.regex'     => '手机号码不正确',
        'address.require'    => '详细地址不能为空',
    ];

    //定义验证场景
    protected $scene = [
        //
    ];
}
