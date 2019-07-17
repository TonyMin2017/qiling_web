package com.sz.haisi.service;

import com.sz.haisi.dao.ProvinceDao;
import com.sz.haisi.model.Province;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceServiceImpl implements IProvinceService {

    //@Autowired
    private ProvinceDao provinceDao;

    @Override
    public List<Province> getAllProvince() {
        return provinceDao.getAllProvince();
    }


}
