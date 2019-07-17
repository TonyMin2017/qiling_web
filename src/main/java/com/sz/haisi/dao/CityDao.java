package com.sz.haisi.dao;

import com.sz.haisi.model.City;

import java.util.List;


public interface CityDao {

    //查询所有的城市 名称； 一个方法中有哪些组成？ 1.方法名，2，方法参数，3.返回值，4.方法体；
    //@Select("select * from t_city")
    public List<City> getAll();

    //模糊查询， 两个条件；
    public List<City> getAllCityAndProvinceBySearch(City city);



    //查询一个城市 ；
    public City getCityByCid(int cid);

    //@Insert("insert into t_city (cname,pid) values (#{cname},#{pid})")
    public int addCity(City city);

    public int updateCity(City city);

    //@Delete("delete from t_city where cid=#{cid}")
    public int deleteCity(int cid);

    //批量删除；传入参数是一个数组；
    public void deleteCitys(int [] cids);

}
