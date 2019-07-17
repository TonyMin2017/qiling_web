package com.sz.haisi.service;

import com.sz.haisi.dao.CityDao;
import com.sz.haisi.model.City;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements ICityService {

    //@Autowired
    private CityDao cityDao;

    @Override
    public List<City> getAll() {
        return cityDao.getAll();
    }

    @Override
    public List<City> getAllCityAndProvinceBySearch(City city) {
        return cityDao.getAllCityAndProvinceBySearch(city);
    }

    @Override
    public City getCityByCid(int cid) {
        return cityDao.getCityByCid(cid);
    }

    @Override
    public int addCity(City city) {
        return cityDao.addCity(city);
    }

    @Override
    public int updateCity(City city) {
        return  cityDao.updateCity(city);
    }

    @Override
    public int deleteCity(int cid) {
        return cityDao.deleteCity(cid);
    }

    @Override
    public void deleteCitys(int[] cids) {
        cityDao.deleteCitys(cids);
    }
}
