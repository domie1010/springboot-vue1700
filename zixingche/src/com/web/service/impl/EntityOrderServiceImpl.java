package com.web.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.web.bean.Entity;
import com.web.bean.EntityOrder;
import com.web.bean.Students;
import com.web.dao.EntityOrderMapper;
import com.web.dao.StudentsMapper;
import com.web.service.EntityOrderService;
import com.web.service.StudentSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zyz on 2016/11/13.
 */
@Service
public class EntityOrderServiceImpl implements EntityOrderService {
    @Autowired
    private EntityOrderMapper mapper;
    @Autowired
    private StudentSerivce s;
    @Transactional(readOnly = false)
    public int insertOrder(EntityOrder order,Students students) {

        //TODO
        students.setAccount(students.getAccount()-order.getTotalPrice());
        s.addAccount(students.getAccount(),students.getStuCode());
        return mapper.insert(order);

    }
    @Transactional(readOnly = false)
    public int updateState(long orderid,String state){

        EntityOrder eo = new EntityOrder();
        eo.setOrderId(orderid);
        eo.setOrderState(state);
        return  mapper.updateByPrimaryKeySelective(eo);
    }
    @Transactional(readOnly = false)
    public int deleteOrder(long orderid) {
        return mapper.deleteByPrimaryKey(orderid);
    }
    @Transactional(readOnly = false)
    public PageInfo<EntityOrder> list(EntityOrder entityOrder,Integer pageNum) {
        //分页查询
        PageHelper.startPage(pageNum,10);
        List<EntityOrder> entities = mapper.list(entityOrder);
        PageInfo<EntityOrder> info = new PageInfo<EntityOrder>(entities);
        return info;
    }
}
