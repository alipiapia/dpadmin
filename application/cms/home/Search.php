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

namespace app\cms\home;

use think\Db;

/**
 * 前台搜索控制器
 * @package app\cms\admin
 */
class Search extends Common
{
    /**
     * 搜索列表
     * @param string $keyword 关键词
     * @author thinkphp
     * @return mixed
     */
    public function index($keyword = '')
    {
        if ($keyword == '') $this->error('请输入关键字');
        $map = [
            'cms_document.trash'  => 0,
            'cms_document.status' => 1,
            'cms_document.title'  => ['like', "%$keyword%"]
        ];

        $data_list = Db::view('cms_document', true)
            ->view('admin_user', 'username', 'cms_document.uid=admin_user.id', 'left')
            ->where($map)
            ->order('create_time desc')
            ->paginate(config('list_rows'));

        $this->assign('keyword', $keyword);
        $this->assign('lists', $data_list);
        $this->assign('pages', $data_list->render());

        return $this->fetch(); // 渲染模板
    }
}