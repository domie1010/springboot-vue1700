package com.web.dao;

import com.web.bean.Entity;
import com.web.bean.EntityOrder;
import com.web.bean.EntityOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EntityOrderMapper {
    int countByExample(EntityOrderExample example);

    int deleteByExample(EntityOrderExample example);

    int deleteByPrimaryKey(Long orderId);

    int insert(EntityOrder record);

    int insertSelective(EntityOrder record);

    List<EntityOrder> selectByExample(EntityOrderExample example);

    EntityOrder selectByPrimaryKey(Long orderId);

    int updateByExampleSelective(@Param("record") EntityOrder record, @Param("example") EntityOrderExample example);

    int updateByExample(@Param("record") EntityOrder record, @Param("example") EntityOrderExample example);

    int updateByPrimaryKeySelective(EntityOrder record);

    int updateByPrimaryKey(EntityOrder record);


    List<EntityOrder> list(EntityOrder entityOrder);
}