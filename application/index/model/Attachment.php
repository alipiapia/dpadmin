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
 * 附件模型
 * @package app\admin\model
 */
class Attachment extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = '__ADMIN_ATTACHMENT__';

    // 自动写入时间戳
    protected $autoWriteTimestamp = true;

    /**
     * 根据附件id获取路径
     * @param  string $id 附件id
     * @return string     路径
     */
    public function getFilePath($id = '')
    {
        return $this->where('id', $id)->value('path');
    }

    /**
     * 根据图片id获取缩略图路径，如果缩略图不存在，则返回原图路径
     * @param string $id 图片id
     * @author thinkphp
     * @return mixed
     */
    public function getThumbPath($id = '')
    {
        $result = $this->where('id', $id)->field('path,thumb')->find();
        if ($result) {
            return $result['thumb'] != '' ? $result['thumb'] : $result['path'];
        } else {
            return $result;
        }
    }

    /**
     * 根据附件id获取名称
     * @param  string $id 附件id
     * @return string     名称
     */
    public function getFileName($id = '')
    {
        return $this->where('id', $id)->value('name');
    }
}
