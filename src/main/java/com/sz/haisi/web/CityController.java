package com.sz.haisi.web;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sz.haisi.common.PageBean;
import com.sz.haisi.common.ResultInfo;
import com.sz.haisi.model.City;
import com.sz.haisi.service.ICityService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/city")
public class CityController {

    Logger logger = Logger.getLogger(CityController.class);

    @Autowired
    private ICityService iCityService;

    //查询所有城市 及省，没有条件查询；
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<City> getAllCity() {
        return  iCityService.getAll();
    }

    //模糊查询城市与省；有条件查询，动态sql
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    public PageBean<City> searchAllCity(String cityName, String provinceName,int pageIndex) {
        City city = new City(cityName,provinceName);
        PageHelper.startPage(pageIndex,5);
        List<City> rows = iCityService.getAllCityAndProvinceBySearch(city);
        Page<City> pageList = (Page<City>) rows;
        PageBean<City> pb = new PageBean<>(
                pageList.getTotal(),
                pageList.getResult(),
                pageList.getPageSize(),
                pageList.getPages(),
                pageList.getPageNum());
        return pb;
    }


    @RequestMapping("/city")
    public String city() {
        //去list页面；异步 加载；
        return "city/list";
    }


    @RequestMapping("/toAdd")
    public String toAdd() {
        //去添加页面；
        return "city/add";
    }

    @RequestMapping("/add")
    public ModelAndView add(City city) {
        int n = iCityService.addCity(city);
        return new ModelAndView("city/list", "list", iCityService.getAll());
    }

    //查询一个城市 的方法，返回的也是json; {"cid":1,"cname":"深圳","pid",2}
    @RequestMapping("/getCityByCid")
    @ResponseBody
    public City getCityByCid(int cid){
        return iCityService.getCityByCid(cid);
    }

    //新增或修改的方法；返回json  {"errorCode":0,"errorMsg":"操作成功！"}
    @RequestMapping("/save")
    @ResponseBody
    public ResultInfo save(City city) {
        String msg = "";
        int errorCode = 1; //默认是1，失败；
        logger.info("===================:"+city.toString());
        if (city.getCid()>0){
            //修改；
            int n = iCityService.updateCity(city);
            if (n>0){
                msg = "修改成功";
                errorCode = 0; //默认是0，新增成功；
            }else {
                msg = "修改失败";
                errorCode = 2; //默认是0，新增失败；
            }
        }else{
            //新增；
            int n = iCityService.addCity(city);
            if (n>0){
                msg = "新增成功";
                errorCode = 0; //默认是0，新增成功；
            }else {
                msg = "新增失败";
                errorCode = 1; //默认是0，新增失败；
            }
        }
        return  new ResultInfo(errorCode,msg);
    }


    //删除一个  {"errorCode":0,"errorMsg":"删除成功！"}
    @RequestMapping("/delete")
    @ResponseBody
    public ResultInfo delete(int cid) {
        String msg = "删除失败！";
        int errorCode = 1; //默认是1，删除失败；
        int n = iCityService.deleteCity(cid);
        if (n>0){
            //删除成功；
            errorCode = 0;
            msg = "删除成功！";
        }
        return new ResultInfo(errorCode,msg);
    }


    //批量删除
    @RequestMapping("/deleteAll")
    @ResponseBody
    public ResultInfo deleteAll(int [] cids) {
        String msg = "批量删除成功！";
        int errorCode = 0; //默认是0，删除成功；
        try {
            iCityService.deleteCitys(cids);
        }catch (Exception ex){
            //删除失败；
            errorCode = 1;
            msg = "批量删除失败！";
        }
        return new ResultInfo(errorCode,msg);
    }
}
