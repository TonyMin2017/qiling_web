package com.sz.haisi.service;

import com.sz.haisi.model.City;

import java.util.List;

public interface ICityService {

    //查询所有的城市 名称；
    public List<City> getAll();

    //模糊查询， 两个条件；
    public List<City> getAllCityAndProvinceBySearch(City city);

    //查询一个城市 ；
    public City getCityByCid(int cid);

    //新增
    int addCity(City city);
    //修改
    public int updateCity(City city);

    //单个 删除一个城市 ；
    public int deleteCity(int cid);

    //批量删除；传入参数是一个数组；
    public void deleteCitys(int [] cids);
}
