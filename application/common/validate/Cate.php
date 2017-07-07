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
 * 分类验证器
 * @package app\common\validate
 * @author pp
 */
class Cate extends Validate
{
    //定义验证规则
    protected $rule = [
        'name|分类名称' => 'require|chsDash',
        'desc|详情' => 'require',
    ];

    //定义验证提示
    protected $message = [
        //
    ];

    //定义验证场景
    protected $scene = [
        //添加
        'add'  =>  ['name' => 'require', 'desc' => 'require'],
        //更新
        'update'  =>  ['name' => 'require', 'desc' => 'require'],
    ];
}
