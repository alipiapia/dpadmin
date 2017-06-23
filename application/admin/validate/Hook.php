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

namespace app\admin\validate;

use think\Validate;

/**
 * 钩子验证器
 * @package app\admin\validate
 * @author thinkphp
 */
class Hook extends Validate
{
    //定义验证规则
    protected $rule = [
        'name|钩子名称'  => 'require|regex:^[a-zA-Z]\w{0,39}$|unique:admin_hook'
    ];

    //定义验证提示
    protected $message = [
        'name.regex' => '钩子名称由字母和下划线组成',
    ];
}
