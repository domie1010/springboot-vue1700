package com.web.service;

import com.github.pagehelper.PageInfo;
import com.web.bean.Students;
import com.web.bean.Type;

import java.util.List;

/**
 * Created by zyz on 2016/11/9.
 */
public interface TypeSerivce
{

     List<Type> querySelectAllType();

     int insertType(Type type);

     int updateType(Type type);

     Type selectById(int typeId);

     int deleteById(int typeId);


}
