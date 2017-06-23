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

namespace app\cms\validate;

use think\Validate;

/**
 * 导航验证器
 * @package app\cms\validate
 * @author thinkphp
 */
class Nav extends Validate
{
    // 定义验证规则
    protected $rule = [
        'tag|菜单标识' => 'require|length:1,30|unique:cms_nav',
        'title|菜单标题' => 'require|length:1,30|unique:cms_nav'
    ];

    // 定义验证场景
    protected $scene = [
        'tag' => ['tag'],
        'title' => ['title']
    ];
}
