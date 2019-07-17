package com.sz.haisi.web;

import com.sz.haisi.model.MyMenu;
import com.sz.haisi.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MyMenuController {
    @Autowired
    private IMenuService iMenuService;

    @RequestMapping("/list")
    @ResponseBody
    public List<MyMenu> getAllMenus(){
        return iMenuService.getAllMenus();
    }
}
