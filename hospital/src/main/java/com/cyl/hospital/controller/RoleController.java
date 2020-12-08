package com.cyl.hospital.controller;

import com.cyl.hospital.beans.menuInfo;
import com.cyl.hospital.beans.roleInfo;
import com.cyl.hospital.beans.roleMenu;
import com.cyl.hospital.beans.userInfo;
import com.cyl.hospital.service.MenuService;
import com.cyl.hospital.service.RoleService;
import com.cyl.hospital.service.UserInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    RoleService roleService;
    @Autowired
    MenuService menuService;
    @Autowired
    UserInfoService userInfoService;

    @RequestMapping("/getRoleList")
    public String getRoleList(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,
                              @RequestParam(value = "pageSize",defaultValue = "5")  Integer pageSize,
                              Model model, @ModelAttribute("roleName")String roleName){
        PageHelper.startPage(pageNum,pageSize);
        List<roleInfo> roleList = roleService.getRoleList(roleName);
        PageInfo<roleInfo> page = new PageInfo(roleList);
        model.addAttribute("page",page);
        model.addAttribute("roleList",roleList);
        return "role/roleList";
    }


    @RequestMapping(value = "/addRole",method = RequestMethod.GET)
    public String gotoAddRole(){
        return "role/createRole";
    }

    @RequestMapping(value = "/addRole",method = RequestMethod.POST)
    public String AddRole(roleInfo role,Model model){
        roleService.addRole(role);
        model.addAttribute("msg","添加成功");
        return "role/createRole";
    }

    //删除角色
    @RequestMapping("/delRole")
    public String delRole(int id) {
        roleService.delRoleById(id);
        return "forward:getRoleList";
    }

    //跳转到更新界面
    @RequestMapping(value = "/updateRole", method = RequestMethod.GET)
    public String gotoUpdateRole(int id, Model model) {
        roleInfo rolee = roleService.getRoleById(id);
        model.addAttribute("rolee", rolee);
        return "role/roleEdit";
    }

    //更新
    @RequestMapping(value = "/updateRole", method = RequestMethod.POST)
    public String updateRole(@ModelAttribute("rolee") roleInfo role, Model model) {
        roleService.updateRole(role);
        model.addAttribute("msg", "修改成功");
        return "role/roleEdit";
    }

    @RequestMapping("/gotoRoleEdit")
    public String gotoRoleEdit(@ModelAttribute("roleId") int roleId,Model model) {
        //查询所有菜单
        List<menuInfo> menuList = menuService.getMenuListForRole(0);
        for(menuInfo m:menuList){
            if(m.getParentId()==0){
                m.setSubList(menuService.getMenuListForRole(m.getId()));
            }
        }
        model.addAttribute("menuList",menuList);

        //根据roleId查询对应的菜单，拼成字符串
        List<roleMenu> roleMenuList = roleService.getRoleMenuId(roleId);
        String menuIdStr = "";
        for(int i=0;i<roleMenuList.size();i++){
            if(i!=roleMenuList.size()-1){
                menuIdStr += roleMenuList.get(i).getMenuId()+",";
            }else {
                menuIdStr += roleMenuList.get(i).getMenuId();
            }
        }
        System.out.println("角色id:"+roleId);
        System.out.println("角色对应菜单id是:"+menuIdStr);

        model.addAttribute("menuIdStr",menuIdStr);

        return "role/RoleLimitEdit";
    }

    //修改角色对应的菜单
    @RequestMapping("/roleMenuUpdate")
    public String roleMenuUpdate(int roleId, Model model, HttpServletRequest request){

        //先删除
        roleService.delRoleMenu(roleId);

        //再重新增加
        String[] menuIdList = request.getParameterValues("ids");
        for(String menuId:menuIdList){
            System.out.println("更新的菜单id"+menuId);
            Map<Object,Object> map = new HashMap<Object, Object>();
            map.put("roleId",roleId);
            map.put("menuId",menuId);
            roleService.addRoleMenu(map);
        }
        //查询所有菜单
        List<menuInfo> menuList = menuService.getMenuListForRole(0);
        for(menuInfo m:menuList){
            if(m.getParentId()==0){
                m.setSubList(menuService.getMenuListForRole(m.getId()));
            }
        }
        model.addAttribute("menuList",menuList);

        //最后重新查询角色对应的id,拼成字符串
        List<roleMenu> roleMenuList = roleService.getRoleMenuId(roleId);
        String menuIdStr = "";
        for(int i=0;i<roleMenuList.size();i++){
            if(i!=roleMenuList.size()-1){
                menuIdStr += roleMenuList.get(i).getMenuId()+",";
            }else {
                menuIdStr += roleMenuList.get(i).getMenuId();
            }
        }
        System.out.println("角色id:"+roleId);
        System.out.println("角色对应菜单id是:"+menuIdStr);

        model.addAttribute("menuIdStr",menuIdStr);
        model.addAttribute("msg","更新成功");
        return "role/RoleLimitEdit";
    }

    @RequestMapping("/searchUserList")
    public String searchUserList(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,
                                 @RequestParam(value = "pageSize",defaultValue = "5")  Integer pageSize,
                                 Model model, @ModelAttribute("userName")String userName){

        PageHelper.startPage(pageNum,pageSize);
        List<userInfo> userList = userInfoService.getUserList(userName);
        PageInfo<userInfo> page = new PageInfo(userList);
        model.addAttribute("page",page);
        model.addAttribute("userList",userList);
        return "role/userRoleList";
    }

    //给用户分配角色
    @RequestMapping("/userRoleManage")
    public String userRoleManage(int id,Model model){
        userInfo user = userInfoService.getUserById(id);
        List<roleInfo> roleList = roleService.getAllRole();

        model.addAttribute("user",user);
        model.addAttribute("roleList",roleList);
        return "role/userRoleManage";
    }

    //修改用户角色权限
    @RequestMapping("/updateUserRole")
    public String updateUserRole(Model model,int userId,int roleId){
        userInfo user = userInfoService.getUserById(userId);
        user.setRoleId(roleId);
        //修改
        userInfoService.updateUserRole(user);
        //查询角色
        List<roleInfo> roleList = roleService.getAllRole();
        model.addAttribute("roleList",roleList);
        model.addAttribute("user",user);
        model.addAttribute("msg","修改成功");
        return "role/userRoleManage";
    }
}
