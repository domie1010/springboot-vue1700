package com.web.bean;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class EntityOrder {
    private Long orderId;

    private Long fkStuCode;

    private Long fkEntityId;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date startDate;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date endDate;

    private Double totalPrice;

    private String orderState;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getFkStuCode() {
        return fkStuCode;
    }

    public void setFkStuCode(Long fkStuCode) {
        this.fkStuCode = fkStuCode;
    }

    public Long getFkEntityId() {
        return fkEntityId;
    }

    public void setFkEntityId(Long fkEntityId) {
        this.fkEntityId = fkEntityId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState == null ? null : orderState.trim();
    }

    private Entity entity;

    private Students students;


    public Entity getEntity() {
        return entity;
    }

    public void setEntity(Entity entity) {
        this.entity = entity;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }
}