package com.sz.haisi.web;

import com.sz.haisi.model.TRole;
import com.sz.haisi.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService iRoleService;

    @RequestMapping("/list")
    @ResponseBody
    public List<TRole> getAll(){
        return iRoleService.getAllRoles();
    }
}
