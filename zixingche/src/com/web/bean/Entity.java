package com.web.bean;

public class Entity {
    private Long entityid;

    private Integer fkTypeid;

    private String entityName;

    private Double price;

    private String entityImage;

    private String entityDesc;

    private String entityInfo;



    public Long getEntityid() {
        return entityid;
    }

    public void setEntityid(Long entityid) {
        this.entityid = entityid;
    }

    public Integer getFkTypeid() {
        return fkTypeid;
    }

    public void setFkTypeid(Integer fkTypeid) {
        this.fkTypeid = fkTypeid;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName == null ? null : entityName.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getEntityImage() {
        return entityImage;
    }

    public void setEntityImage(String entityImage) {
        this.entityImage = entityImage == null ? null : entityImage.trim();
    }

    public String getEntityDesc() {
        return entityDesc;
    }

    public void setEntityDesc(String entityDesc) {
        this.entityDesc = entityDesc == null ? null : entityDesc.trim();
    }

    public String getEntityInfo() {
        return entityInfo;
    }

    public void setEntityInfo(String entityInfo) {
        this.entityInfo = entityInfo == null ? null : entityInfo.trim();
    }


    private Type type;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }
}