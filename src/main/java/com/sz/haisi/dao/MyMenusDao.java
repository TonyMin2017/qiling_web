package com.sz.haisi.dao;

import com.sz.haisi.model.MyMenu;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class MyMenusDao {
    @Autowired
    private SessionFactory factory;

    private Session getSession(){
        return factory.openSession();
    }

    public List<MyMenu> getAllMenus(){
        return getSession().createQuery("from MyMenu").list();
    }
}
