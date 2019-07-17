package com.sz.haisi.service;

import com.sz.haisi.dao.MyMenusDao;
import com.sz.haisi.model.MyMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    private MyMenusDao myMenusDao;

    @Override
    public List<MyMenu> getAllMenus() {
        //return menuDao.select(null);
        return myMenusDao.getAllMenus();
    }
}
