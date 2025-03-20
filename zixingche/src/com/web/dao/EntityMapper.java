package com.web.dao;

import com.web.bean.Entity;
import com.web.bean.EntityExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EntityMapper {
    int countByExample(EntityExample example);

    int deleteByExample(EntityExample example);

    int deleteByPrimaryKey(Long entityid);

    int insert(Entity record);

    int insertSelective(Entity record);

    List<Entity> selectByExample(EntityExample example);

    Entity selectByPrimaryKey(Long entityid);

    int updateByExampleSelective(@Param("record") Entity record, @Param("example") EntityExample example);

    int updateByExample(@Param("record") Entity record, @Param("example") EntityExample example);

    int updateByPrimaryKeySelective(Entity record);

    int updateByPrimaryKey(Entity record);

    List<Entity> selectEntityWithType(Entity entity);
}