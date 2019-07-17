package com.sz.haisi.web;

import com.sz.haisi.model.Province;
import com.sz.haisi.service.IProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/province")
public class ProvinceController {

    @Autowired
    private IProvinceService iProvinceService;

    @RequestMapping("/list")
    @ResponseBody
    public List<Province> getAllProvince(){
        return iProvinceService.getAllProvince();
    }
}
