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

namespace app\admin\model;

use think\Model;

/**
 * 日志模型
 * @package app\admin\model
 */
class Action extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = '__ADMIN_ACTION__';

    // 自动写入时间戳
    protected $autoWriteTimestamp = true;
}