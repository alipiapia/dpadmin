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
 * 滚动图片验证器
 * @package app\cms\validate
 * @author thinkphp
 */
class Slider extends Validate
{
    // 定义验证规则
    protected $rule = [
        'title|标题' => 'require|length:1,30',
        'cover|图片' => 'require',
//        'url|链接'   => 'require|url',
    ];

    // 定义验证场景
    protected $scene = [
        'title' => ['title'],
//        'url'   => ['url'],
    ];
}
