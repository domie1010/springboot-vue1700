package com.web.service;

import com.github.pagehelper.PageInfo;
import com.web.bean.EntityOrder;
import com.web.bean.Students;

/**
 * Created by zyz on 2016/11/13.
 */
public interface EntityOrderService {
    /**
     * 下单
     * @param order
     * @return
     */
    int insertOrder(EntityOrder order,Students students);

    /**
     * 修改订单状态
     */
    int updateState(long orderid,String state);
    /**
     * 删除订单
     *
     *
     */
    int deleteOrder(long orderid);

    /**
     *
     * @param entityOrder
     * @return
     */
    PageInfo<EntityOrder> list(EntityOrder entityOrder,Integer pageNum);
}
