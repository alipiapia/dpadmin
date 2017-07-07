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
 * 品牌验证器
 * @package app\common\validate
 * @author pp
 */
class Brand extends Validate
{
    //定义验证规则
    protected $rule = [
        'name|品牌名称' => 'require|chsDash',
        'desc|描述' => 'require',
        'picture|图片' => 'require',
    ];

    //定义验证提示
    protected $message = [
        'picture.require' => '请上传图片',
    ];

    //定义验证场景
    protected $scene = [
        //添加
        'add'  =>  ['name' => 'require', 'picture' => 'require'],
        //更新
        'update'  =>  ['name' => 'require', 'picture' => 'require'],
    ];
}
