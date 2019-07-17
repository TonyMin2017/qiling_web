package com.sz.haisi.service;

import com.sz.haisi.dao.TRoleMapper;
import com.sz.haisi.model.TRole;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {
    //@Autowired
    private TRoleMapper tRoleMapper;

    @Override
    public List<TRole> getAllRoles() {
        return tRoleMapper.selectByExample(null);
    }
}
