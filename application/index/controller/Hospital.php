<?php

/*
* @Theme 后台医院管理 控制器
* @Author pp
* @Date 18th Oct,2016
*
*/

namespace app\admin\controller;
use app\common\controller\Filter;//公共过滤控制器
use think\Db;

class HospitalManage extends Filter
{
    public $logicOrder;
    public $modelHospital;
    public $modelCompany;
    public $modelHospitalCompany;
    public $modelMachine;
    public $modelMachineName;
    public $modelMachineSku;
    public $modelMachineStatus;
    
    public function _initialize() {
        parent::_initialize();
        $this->logicOrder = controller('common/Order','logic');
        $this->modelHospital = controller('common/Hospital','model');
        $this->model_company = controller('common/Company','model');
        $this->modelHospitalCompany = controller('common/HospitalCompany','model');
        $this->modelMachine = controller('common/Machine','model');
        $this->modelMachineName = controller('common/MachineName','model');
        $this->modelMachineSku = controller('common/MachineSku','model');
        $this->modelMachineStatus = controller('common/MachineStatus','model');
        $this->assign('sidebar', 27);
    }

    public function preview(){
        $pro_arr = '';
        $province_id = '';
        $city_id = '';
        $town_id = '';
        $map = [];
        if(input('pro_arr')){
            $pro_arr = $province_id = $map['province_id'] = input('pro_arr');
        }
        if(input('province_id')){
            $pro_arr = $province_id = $map['province_id'] = input('province_id');
        }
        if(input('city_id')){
            $map['city_id'] = input('city_id');
            $city_id = input('city_id');
        }
        if(input('town_id')){
            $map['town_id'] = input('town_id');
            $town_id = input('town_id');
        }
        // if(input('stime')){
        //     $map['created_at'] = ['egt',date("Y-m-d H:i:s",strtotime(input('stime').' 00:00:00'))];
        // }
        // if(input('etime')){
        //     $map['created_at'] = ['elt',date("Y-m-d H:i:s",strtotime(input('etime').' 23:59:59'))];
        // }
        if(input('level')){
            $map['level'] = input('level');
        }
        if(input('keyword')){
            $map['name'] = ['like','%'.input('keyword').'%'];
        }
        // dd($pro_arr);
        $page_list = Db::name('Hospital')->where($map)->order('id desc')->paginate(5);
        $page = $page_list->render();
        $hospital_data = $page_list->toArray();
        $hospital_list = $hospital_data['data'];
        foreach ($hospital_list as $k => $v) {
            $hospital_list[$k]['machineCount'] = getMachineCount($v['id']);//设备数量
            $hospital_list[$k]['repairinfo1'] = $this->logicOrder->getOrgRepairInfo(1,1,$v['id']);//维修单
            $hospital_list[$k]['repairinfo2'] = $this->logicOrder->getOrgRepairInfo(2,1,$v['id']);//保养单
            $hospital_list[$k]['repairinfo3'] = $this->modelHospital->getApplyNumAndPrice($v['id']);//申购
        }
        // dd($hospital_list);
        return view('hospitalmanage/index',[
                    'page' => $page,
                    'title' => '客户管理',
                    'hospital_list' => $hospital_list,
                    'hospital_level' => config('hospital_level'),
                    'pro_arr' => $pro_arr,
                    'province_id' => $province_id,
                    'city_id' => $city_id,
                    'town_id' => $town_id,
                    // 'stime' => input('stime'),
                    // 'etime' => input('etime'),
                    'level' => input('level'),
                    'keyword' => input('keyword'),
                ]);
    }

    //显示列表:医院
    public function index(){
        $pro_array = config('province_array');
        $pro_count = [];
        foreach ($pro_array as $k => $v) {
            $pro_count[$k]['id'] = Db::name("Geo")->where(['areaname' => ['like', $v.'%']])->value('area_id');
            $pro_count[$k]['name'] = $v;
            $pro_count[$k]['count'] = Db::name('Hospital')->where(['province_id' => $pro_count[$k]['id']])->count();
        }
        // dd($pro_count);
        return view('hospitalmanage/preview', [
                  'title' => '客户管理',
                  'pro_count' => $pro_count
        ]);
    }

    //添加：医院
    public function add()
    {
        $pro_arr = input('pro_arr');
      // dd($pro_arr);
        $request = request();
      if(request()->isPost()){
        // dd(input(''));
        $post = $request->post();
        // pp($post['department_ids']);
        $file1_id = input('file1_id');
        $name = input('name');
        $level = input('level');
        $address = input('address');
        $owner = input('owner');
        $telephone = input('telephone');

        // $hospital_data['province'] = getAreaName(input('province'));
        // $hospital_data['city'] = getAreaName(input('city'));
        // $hospital_data['town'] = isset(input('area')) ? getAreaName(input('area')) : '';

        // $department_ids = input('department_ids');
        // dd(input('department_ids'));

        if(!$file1_id)$this->error("请上传医院图片！");
        if(!$name)$this->error("请正确填写医院名称！");
        if(!$level)$this->error("请正确填写医院等级！");
        if(!input('province_id') || !input('city_id'))$this->error("请正确填写地区！");
        if(!$address)$this->error("请正确填写详细地址！");
        if(!$owner)$this->error("请正确填写医院负责人！");
        if(!$telephone)$this->error("请正确填写联系电话！");
        if(!$post['department_ids'])$this->error("请正确填写科室！");

        //同一地区同名医院判断
        $check_map = [
            'province_id' => input('province_id'),
            'city_id' => input('city_id'),
            'name' => input('name')
        ];
        $check_map['town_id'] = input('area_id') ? input('area_id') : 0;
        $check_hosname = $this->modelHospital->getValue($check_map);
        if($check_hosname)$this->error("该医院名称已存在，请尝试其它医院名称！");

        $hospital_data = [
            'name' => $name,
            'level' => $level,
            'province_id' => input('province_id'),
            'city_id' => input('city_id'),
            'address' => $address,
            'owner' => $owner,
            'telephone' => $telephone,
            // 'department_ids' => implode(',' , $post('department_ids')),
            'file1_id' => $file1_id,
            'created_at' => date("Y-m-d H:i:s"),
            'updated_at' => date("Y-m-d H:i:s")
        ];
        $hospital_data['town_id'] = input('area_id') ? input('area_id') : 0;

        $add_hospital_id = Db::name('Hospital')->insertGetId($hospital_data);

        // $department_ids = array_merge(config('default_department'),$post['department_ids']);
        $department_ids = array_unique($post['department_ids']);
        // pp(array_unique($department_ids));

        //添加科室
        $add_department_ids = [];
        foreach($department_ids as $k => $v){
          $add_department_ids[$k] = Db::name('HospitalDepartment')->insertGetId([
                'hospital_id' => $add_hospital_id,
                'name' => $v,
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s")
          ]);
        }

        //更新医院科室ids
        $up_hospital_dps = Db::name('Hospital')
        ->where(['id' => $add_hospital_id])
        ->update(['department_ids' => implode(',' , $add_department_ids)]);
        // dd($add_department_ids);

        //添加默认下级，名称为 【某某设备科长】 Start

        // //用户添加
        // $add_user_data = [
        //   // 'mobile' => input('mobile'),
        //   'name' => $name.'_设备科长',
        //    'password' => md5('111111'),
        //     // 'status' => 1,
        //    'created_at' => date("Y-m-d H:i:s"),
        //    'updated_at' => date("Y-m-d H:i:s")
        //  ];
        // $add_user_id = Db::name('User')->insertGetId($add_user_data);

        // //职位添加
        // $add_postion_data = [
        //   'hospital_id' => $add_hospital_id,
        //   'parent_id' => 0,
        //   'name' => '设备科长',
        //   'created_at' => date("Y-m-d H:i:s"),
        //   'updated_at' => date("Y-m-d H:i:s")
        // ];
        // $add_position_id = Db::name('HospitalPosition')->insertGetId($add_postion_data);

        // //管理员添加
        // $admin_data = [
        //     'user_id' => $add_user_id,//用户
        //     'group_id' => 1,//分组
        //     'role_id' => 1,//角色
        //     'org_id' => $add_hospital_id,//机构id
        //     'position_id' => $add_position_id,//职位
        // ];
        // $add_admin_id = Db::name('UserOrg')->insertGetId($admin_data);

        //添加默认下级，名称为 【某某设备科长】 End

        $up_hospital_dps ? $this->redirect("admin/HospitalManage/preview", ['pro_arr' => input('province_id')]) : $this->error("医院添加失败！");
      }else{
        $hospital_level = config('hospital_level');
        $default_department = config('default_department');
        // pp($default_department);
        return view('hospitalmanage/add',[
            'title' => '医院添加',
            'hospital_level' => $hospital_level,
            'default_department' => $default_department,
            'pro_arr' => $pro_arr
            ]);
      }
    }

    //编辑：医院
    public function edit()
    {
      // dd(input(''));
        $request = request();
      if(!input('id'))$this->error("找不到医院！");
      $hospital_data = Db::name('Hospital')->where(['id' => input('id')])->find();
      $hospital_data['file1_pic'] = getSaveName($hospital_data['file1_id']);
      // $hospital_data['province'] = getRegionName($hospital_data['province_id']);
      // $hospital_data['city'] = getRegionName($hospital_data['city_id']);
      // $hospital_data['town'] = getRegionName($hospital_data['town_id']);
      // dd($hospital_data);
      $depart_arr = explode(',', $hospital_data['department_ids']);
      $hospital_departments = [];
      $hospital_machines = [];
      foreach($depart_arr as $k => $v)
      {
        $hospital_departments[$k] = Db::name('HospitalDepartment')->where(['id' => $v])->field('id,name')->find();
        $hospital_machines[$v] = $this->modelMachineName->getMccList(['hospital_id' => input('id'),'department_id' => $v],'id,name',1);
        // $hospital_machines[$v]['dep_id'] = $v;
        $hospital_machiness = $hospital_machines;
        if(is_array($v)){
            foreach ($v as $kk => $vv) {
                $hospital_machiness[] = $vv;
                $hospital_machiness['dep_id'] = $k;//添加科室绑定参数
            }
        }
      }
      // $hospital_machiness = $hospital_machines;
      // foreach ($hospital_machines as $k => $v) {
      //     $hospital_machiness[$k]['dep_id'] = $k;
      // }

      // $hospital_company = Db::name("HospitalCompany")->where(['hospital_id' => $hospital_data['id']])->select();
      $signing_company = getSignCompany($hospital_data['id']);
      $hospital_company = $signing_company ? $signing_company['signing_company'] : '';
      // dd($hospital_departments);

      // $map1['hospital_id'] = input('id');
      // $map1['department_id'] = 1;
      // $hospital_machines = $this->modelMachineName->getMccList($map1,'id,name');
      // $hospital_company_ids = $this->modelHospitalCompany->checkMCSignStatus(6);
      // dd($hospital_company_ids);

      if(request()->isPost() || request()->isAjax())
      {
        // pp($hospital_departments);
        // dd(input('post.'));
        // dd(getSaveName(input('file1_id')));
        $post = $request->post();
        // pp($post['department_ids']);
        if(!input('file1_id'))$this->error("请上传医院图片！");
        if(!input('name'))$this->error("请正确填写医院名称！");
        if(!input('level'))$this->error("请正确填写医院等级！");
        if(!input('province_id') || !input('city_id'))$this->error("请正确填写地区！");
        if(!input('address'))$this->error("请正确填写详细地址！");
        if(!input('owner'))$this->error("请正确填写医院负责人！");
        if(!input('telephone'))$this->error("请正确填写联系电话！");
        if(!$post['department_ids'])$this->error("请正确填写科室！");

        //同一地区同名医院判断
        $check_map = [
            'province_id' => input('province_id'),
            'city_id' => input('city_id'),
            'name' => input('name'),
            'id' => ['neq', input('id')]
        ];
        $check_map['town_id'] = input('area_id') ? input('area_id') : 0;
        $check_hosname = $this->modelHospital->getValue($check_map);
        if($check_hosname)$this->error("该医院名称已存在，请尝试其它医院名称！");

        $hospital_data = input('post.');
        // dd($hospital_data);
        // input('province') = getRegionName(input('province_id'));
        // input('city') = getRegionName(input('city_id'));
        // input('town') = input('area') ? getRegionName(input('area_id')) : '';
        // $hospital_data['department_ids'] = implode(',' , $post['department_ids']);

        // dd($hospital_data);
        // $hospital_data['province_id'] = $hospital_data['province'];
        // $hospital_data['city_id'] = $hospital_data['city'];
        // $hospital_data['town_id'] = $hospital_data['area_id'];
        // unset($hospital_data['province']);
        // unset($hospital_data['city']);
        unset($hospital_data['area_id']);
        $hospital_data['town_id'] = input('area_id') ? input('area_id') : 0;
        unset($hospital_data['department_ids']);
        $hospital_data['updated_at'] = date("Y-m-d H:i:s");
        // dd($hospital_data);

        $edit_department_ids = [];
        //清空科室
        // $remove_department_id = Db::name("HospitalDepartment")->where(['hospital_id' => $hospital_data['id']])->delete();
        //添加科室
        foreach($post['department_ids'] as $k => $v){
            $add_department_data = [
                'hospital_id' => $hospital_data['id'],
                'name' => $v,
            ];
            $check_department_id = Db::name("HospitalDepartment")->where($add_department_data)->find();
            //存在则跳出当前
            if($check_department_id){
                // $edit_department_ids = [];
                continue;
            }
            $add_department_data['created_at'] = date("Y-m-d H:i:s");
            $add_department_data['updated_at'] = date("Y-m-d H:i:s");
          $edit_department_ids[$k] = Db::name('HospitalDepartment')->insertGetId($add_department_data);
        }

        //删除科室 20170223 START
        $del_department_ids = [];
        foreach ($hospital_departments as $k => $v) {
           if(!in_array($v['name'], $post['department_ids'])){
                $del_department_ids[$k] = $v['id'];
                $remove_department_id = Db::name("HospitalDepartment")->where(['id' => $v['id']])->delete();
                $machine_ids = $this->modelMachine->where(['department_id' => $v['id']])->column('id');//设备id
                $del_machine_id = $this->modelMachine->delOne(['id' => ['in', implode(',', $machine_ids)]]);//删除machine表
                $del_machine_sku_id = $this->modelMachineSku->delOne(['machine_id' => ['in', implode(',', $machine_ids)]]);//删除machine_sku表
                $del_machine_status_id = $this->modelMachineStatus->delOne(['machine_id' => ['in', implode(',', $machine_ids)]]);
           }
        }
        //删除科室 20170223 END
        // pp($del_department_ids);

        // dd($edit_department_ids);
        // pp(array_merge($edit_department_ids, $del_department_ids));
        // return in_array(0, $add_sign_id) ? 0 : 1;

        //更新医院科室ids
        $ori_department_ids = Db::name('Hospital')->where(['id' => $hospital_data['id']])->value('department_ids');
        $ori_department = [];
        $ori_department = explode(',', $ori_department_ids);
        // pp($edit_department_ids);
        // $del_dep_ids = [];
        // $del_dep_ids = $ori_department;
        if($del_department_ids){
            foreach ($del_department_ids as $k => $v) {
                foreach ($ori_department as $kk => $vv) {
                    if($v == $vv){
                        // pp($v.'='.$vv);
                        unset($ori_department[$kk]);
                    }
                    // $new[$k] = $vv;
                }
            }
            // $hospital_data['department_ids'] = implode(',', $ori_department);
            // $del_dep_ids = $ori_department;
        }
        // pp($ori_department);
        // $add_dep_ids = [];
        if($edit_department_ids){
            // $hospital_data['department_ids'] = $ori_department_ids.','.implode(',' , $edit_department_ids);
            // $hospital_data['department_ids'] = implode(',' , $edit_department_ids);
            // $hospital_data['department_ids'] = implode(',', array_merge($ori_department,$edit_department_ids));
            $ori_department = array_merge($ori_department,$edit_department_ids);
        }
        // pp($ori_department);
        // $filter_array = array_filter(array_unique(array_merge($add_dep_ids, $del_dep_ids)));
        // pp($filter_array);
        $hospital_data['department_ids'] = implode(',', $ori_department);
        // dd($hospital_data);
        $up_hospital_id = Db::name('Hospital')->where(['id' => $hospital_data['id']])->update($hospital_data);

        if($up_hospital_id){
            $this->redirect("admin/HospitalManage/preview", ['pro_arr' => $hospital_data['province_id']]);
        }else{
            if($edit_department_ids){
                Db::name("HospitalDepartment")->where(['id' => ['in', implode(',' , $edit_department_ids)]])->delete();
            }
            $this->error("医院编辑失败！");
        }
      }
      else
      {
        $hospital_level = config('hospital_level');
        // pp($hospital_departments);
        return view('hospitalmanage/edit',[
          'title' => '医院编辑',
          'hospital_level' => $hospital_level,
          'hospital_departments' => $hospital_departments,
          'hospital_machines' => $hospital_machines,
          'hospital_data' => $hospital_data,
          'hospital_company' => $hospital_company
        ]);
      }
    }

    //删除指定医院
    public function delete(){
        // return input('id');
        $del_hospital_id = Db::name('Hospital')->where('id' ,input('id'))->delete();//删除医院
        $del_department_id = Db::name('HospitalDepartment')->where('hospital_id' ,input('id'))->delete();//删除医院科室
        $del_position_id = Db::name('HospitalPosition')->where('hospital_id' ,input('id'))->delete();//删除医院职位
        $del_sign_id = Db::name('HospitalCompany')->where('hospital_id' ,input('id'))->delete();//删除签约信息
        $machine_ids = $this->modelMachine->where(['hospital_id' => input('id')])->column('id');//设备id
        $del_machine_id = $this->modelMachine->delOne(['id' => ['in', implode(',', $machine_ids)]]);//删除machine表
        $del_machine_sku_id = $this->modelMachineSku->delOne(['machine_id' => ['in', implode(',', $machine_ids)]]);//删除machine_sku表
        $del_machine_status_id = $this->modelMachineStatus->delOne(['machine_id' => ['in', implode(',', $machine_ids)]]);//删除machine_status表
        // foreach ($machine_ids as $k => $v) {
            // $del_machine_id = Db::name('Machine')->where(['id' => $v])->delete();//删除machine表
            // $del_machine_sku_id = Db::name('MachineSku')->where(['machine_id' => $v])->delete();//删除machine_sku表
            // $del_machine_status_id = Db::name('MachineStatus')->where(['machine_id' => $v])->delete();//删除machine_status表
        // }

      // $del_id ? $this->success("医院删除成功！", "CompanyManage/index") : $this->error("医院删除失败！");
      return $del_hospital_id;
    }

    //获取打印的医院信息
    public function getHospitalInfo(){
        if(!input('hid'))return '';
        $hospital_info = Db::name('Hospital')->where(['id' => input('hid')])->find();//医院信息
        $hospital_info['doctor_count'] = Db::name('UserOrg')->where(['group_id' => 1,'role_id' => 2, 'org_id' => input('hid')])->count();//该医院下用户id
        $company_info = getSignCompany(input('hid'));//签约公司信息
        $hospital_info = array_merge($hospital_info,$company_info);
        $hospital_info['print_user'] = $this->auth->name;
        // $hospital_info['print_department'] = '设备科';
        $hospital_info['print_date'] = date("Y-m-d H:i:s");
        $hospital_info['machine_count'] = getMachineCount(input('hid'));
        $hospital_info['repairinfo1'] = $this->logicOrder->getOrgRepairInfo(1,1,input('hid'));//维修单
        $hospital_info['repairinfo2'] = $this->logicOrder->getOrgRepairInfo(2,1,input('hid'));//保养单
        $hospital_info['repairinfo3'] = $this->modelHospital->getApplyNumAndPrice(input('hid'));//申购
        // pp($hospital_info);
        // return $hospital_info;
        return view('hospitalmanage/print_hospital',[
                'hospital_info' => $hospital_info
        ]);
    }

    /**地区搜索入口
     *
     */
    public function searchSignCompany(){

        if(request()->isAjax() || request()->isPost()){
            $value=input("post.area");
            $name=trimall(input("post.name"));

            if($value && !empty($value)){//市
                if($name=='area_id'){//前台的area表示区域
                    $map['town_id']=['eq',$value];
                }else{
                    $map[$name]=['eq',$value];
                }
            }

            return $this->model_company->getLists($map,'id DESC','id,name');
        }
    }

    //
    public function getSignMachines(){

        if(request()->isAjax() || request()->isPost()){
            $hospital_id = input("post.hospital_id");
            $department_id = trimall(input("post.department_id"));
            if(!$hospital_id || !$hospital_id)return '';

            $map = [
                'hospital_id' => $hospital_id,
                'department_id' => $department_id
            ];

            return $this->modelMachineName->getMccList($map,'id,name');
        }
    }

    //添加签约公司
    public function addSignCompany(){
        // dd(input(''));
        if(!input('hospital_id') || !input('company_id') || !input('file2_id') || !input('sign_departments') || !input('sign_machines'))return '';
        $sign_departments = explode(',', input('sign_departments'));
        $sign_machines = explode(',', input('sign_machines'));
        $add_sign_id = [];
        foreach ($sign_machines as $k => $v) {
            $ex_str = explode('_', $v);
            $add_sign_data = [
                'hospital_id' => input('hospital_id'),
                'company_id' => input('company_id'),
                'department_ids' => $ex_str[0],
                'machine_name_id' => $ex_str[1]
            ];
            // dd($add_sign_data);
            $check_sign_id = Db::name("HospitalCompany")->where($add_sign_data)->find();
            //存在则跳出当前
            if($check_sign_id){
                $add_sign_id = [];
                continue;
            }
            $add_sign_data['file2_id'] = input('file2_id');
            $add_sign_data['created_at'] = date("Y-m-d H:i:s");
            $add_sign_data['updated_at'] = date("Y-m-d H:i:s");
            $add_sign_id[$k] = Db::name("HospitalCompany")->insertGetId($add_sign_data);//添加签约公司
        }
        // dd($add_sign_data);
        return in_array(0, $add_sign_id) ? 0 : 1;
    }

    //检查科室是否存在
    public function checkHDep(){
        // pp(input(''));
        if(!input('hospital_id') || !input('department_id'))return '';

    }
}
