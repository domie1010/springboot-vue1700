package com.web.service;

import com.github.pagehelper.PageInfo;
import com.web.bean.Entity;


/**
 * Created by zyz on 2016/11/9.
 */
public interface EntitySerivce
{

     PageInfo<Entity> selectEntity(Entity entity,Integer pageNum);

     int insertEntity(Entity entity);

     int updateEntity(Entity entity);

     Entity selectById(Long entityId);

     int deleteById(Long entityId);


}
