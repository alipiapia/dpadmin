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
 * 栏目验证器
 * @package app\cms\validate
 * @author thinkphp
 */
class Column extends Validate
{
    // 定义验证规则
    protected $rule = [
        'pid|所属栏目'    => 'require',
        'name|栏目名称'   => 'require|unique:cms_column,name^pid',
        'model|内容模型'  => 'require',
    ];
}
