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
 * 文档字段验证器
 * @package app\cms\validate
 * @author thinkphp
 */
class Field extends Validate
{
    //定义验证规则
    protected $rule = [
        'name|字段名称'   => 'require|regex:^[a-z]\w{0,39}$|unique:cms_field,name^model',
        'title|字段标题'  => 'require|length:1,30',
        'type|字段类型'   => 'require|length:1,30',
        'define|字段定义' => 'require|length:1,100',
        'tips|字段说明'   => 'length:1,200',
    ];

    //定义验证提示
    protected $message = [
        'name.regex' => '字段名称由小写字母和下划线组成',
    ];
}
