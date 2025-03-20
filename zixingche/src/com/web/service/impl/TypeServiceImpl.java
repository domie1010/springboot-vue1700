package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.web.bean.Students;
import com.web.bean.StudentsExample;
import com.web.bean.Type;
import com.web.dao.StudentsMapper;
import com.web.dao.TypeMapper;
import com.web.service.StudentSerivce;
import com.web.service.TypeSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
@Service
public class TypeServiceImpl implements TypeSerivce {

    @Autowired
    private TypeMapper mapper;



    public List<Type> querySelectAllType() {
        return mapper.selectByExample(null);
    }
    @Transactional(readOnly = false)
    public int insertType(Type type) {
        return mapper.insert(type);
    }
    @Transactional(readOnly = false)
    public int updateType(Type type) {
        return mapper.updateByPrimaryKey(type);
    }

    @Transactional(readOnly = false)
    public int deleteById(long typeId) {
        return 0;
    }

    public Type selectById(int typeid) {
        return mapper.selectByPrimaryKey(typeid);
    }

    @Transactional(readOnly = false)
    public int deleteById(int typeid) {
        return mapper.deleteByPrimaryKey(typeid);
    }


}
