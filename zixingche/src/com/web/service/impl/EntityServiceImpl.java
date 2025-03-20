package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.web.bean.Entity;
import com.web.bean.Users;
import com.web.bean.UsersExample;
import com.web.dao.EntityMapper;
import com.web.dao.UsersMapper;
import com.web.service.EntitySerivce;
import com.web.service.UsersSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class EntityServiceImpl implements EntitySerivce {
    @Autowired
    private EntityMapper mapper;




    public PageInfo<Entity> selectEntity(Entity entity, Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Entity> entities = mapper.selectEntityWithType(entity);
        PageInfo<Entity> info = new PageInfo<Entity>(entities);
        return info;
    }
    @Transactional(readOnly = false)
    public int insertEntity(Entity entity) {
        return mapper.insert(entity);
    }
    @Transactional(readOnly = false)
    public int updateEntity(Entity entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    public Entity selectById(Long entityId) {
        return mapper.selectByPrimaryKey(entityId);
    }
    @Transactional(readOnly = false)
    public int deleteById(Long entityId) {
        return mapper.deleteByPrimaryKey(entityId);
    }
}
