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

namespace app\admin\controller;

use app\common\controller\Common;
use app\admin\model\Menu as MenuModel;
use think\Db;

/**
 * 用于处理ajax请求的控制器
 * @package app\admin\controller
 */
class Ajax extends Common
{
    /**
     * 获取联动数据
     * @param string $table 表名
     * @param int $pid 父级ID
     * @param string $key 下拉选项的值
     * @param string $option 下拉选项的名称
     * @param string $pidkey 父级id字段名
     * @author thinkphp
     * @return \think\response\Json
     */
    public function getLevelData($table = '', $pid = 0, $key = 'id', $option = 'name', $pidkey = 'pid')
    {
        if ($table == '') {
            return json(['code' => 0, 'msg' => '缺少表名']);
        }

        $data_list = Db::name($table)->where($pidkey, $pid)->column($option, $key);

        if ($data_list === false) {
            return json(['code' => 0, 'msg' => '查询失败']);
        }

        if ($data_list) {
            $result = [
                'code' => 1,
                'msg'  => '请求成功',
                'list' => format_linkage($data_list)
            ];
            return json($result);
        } else {
            return json(['code' => 0, 'msg' => '查询不到数据']);
        }
    }

    /**
     * 获取筛选数据
     * @param string $table 表名
     * @param string $field 字段名
     * @param array $map 查询条件
     * @param string $options 选项，用于显示转换
     * @author thinkphp
     * @return \think\response\Json
     */
    public function getFilterList($table = '', $field = '', $map = [], $options = '')
    {
        if ($table == '') {
            return json(['code' => 0, 'msg' => '缺少表名']);
        }
        if ($field == '') {
            return json(['code' => 0, 'msg' => '缺少字段']);
        }
        if (!empty($map) && is_array($map)) {
            foreach ($map as &$item) {
                if (is_array($item)) {
                    foreach ($item as &$value) {
                        $value = trim($value);
                    }
                } else {
                    $item = trim($item);
                }
            }
        }

        $data_list = Db::name($table)->where($map)->group($field)->column($field);
        if ($data_list === false) {
            return json(['code' => 0, 'msg' => '查询失败']);
        }

        if ($data_list) {
            if ($options != '') {
                // 从缓存获取选项数据
                $options = cache($options);
                if ($options) {
                    $temp_data_list = [];
                    foreach ($data_list as $item) {
                        $temp_data_list[$item] = isset($options[$item]) ? $options[$item] : '';
                    }
                    $data_list = $temp_data_list;
                } else {
                    $data_list = parse_array($data_list);
                }
            } else {
                $data_list = parse_array($data_list);
            }

            $result = [
                'code' => 1,
                'msg'  => '请求成功',
                'list' => $data_list
            ];
            return json($result);
        } else {
            return json(['code' => 0, 'msg' => '查询不到数据']);
        }
    }

    /**
     * 获取指定模块的菜单
     * @param string $module 模块名
     * @author thinkphp
     * @return mixed
     */
    public function getModuleMenus($module = '')
    {
        $menus = MenuModel::getMenuTree(0, '', $module);
        $result = [
            'code' => 1,
            'msg'  => '请求成功',
            'list' => format_linkage($menus)
        ];
        return json($result);
    }

    /**
     * 设置配色方案
     * @param string $theme 配色名称
     * @author thinkphp
     */
    public function setTheme($theme = '') {
        $map['name'] = 'system_color';
        $map['group'] = 'system';
        if (Db::name('admin_config')->where($map)->setField('value', $theme)) {
            $this->success('设置成功');
        } else {
            $this->error('设置失败，请重试');
        }
    }

    /**
     * 获取侧栏菜单
     * @param string $module_id 模块id
     * @param string $module 模型名
     * @param string $controller 控制器名
     * @author thinkphp
     * @return string
     */
    public function getSidebarMenu($module_id = '', $module = '', $controller = '')
    {
        $menus = MenuModel::getSidebarMenu($module_id, $module, $controller);

        $output = '';
        foreach ($menus as $key => $menu) {
            if (!empty($menu['url_value'])) {
                $output = $menu['url_value'];
                break;
            }
            if (!empty($menu['child'])) {
                $output = $menu['child'][0]['url_value'];
                break;
            }
        }
        return $output;
    }
}