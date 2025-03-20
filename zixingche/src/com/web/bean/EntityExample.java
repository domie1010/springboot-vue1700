package com.web.bean;

import java.util.ArrayList;
import java.util.List;

public class EntityExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EntityExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andEntityidIsNull() {
            addCriterion("entityid is null");
            return (Criteria) this;
        }

        public Criteria andEntityidIsNotNull() {
            addCriterion("entityid is not null");
            return (Criteria) this;
        }

        public Criteria andEntityidEqualTo(Long value) {
            addCriterion("entityid =", value, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidNotEqualTo(Long value) {
            addCriterion("entityid <>", value, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidGreaterThan(Long value) {
            addCriterion("entityid >", value, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidGreaterThanOrEqualTo(Long value) {
            addCriterion("entityid >=", value, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidLessThan(Long value) {
            addCriterion("entityid <", value, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidLessThanOrEqualTo(Long value) {
            addCriterion("entityid <=", value, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidIn(List<Long> values) {
            addCriterion("entityid in", values, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidNotIn(List<Long> values) {
            addCriterion("entityid not in", values, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidBetween(Long value1, Long value2) {
            addCriterion("entityid between", value1, value2, "entityid");
            return (Criteria) this;
        }

        public Criteria andEntityidNotBetween(Long value1, Long value2) {
            addCriterion("entityid not between", value1, value2, "entityid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidIsNull() {
            addCriterion("fk_typeId is null");
            return (Criteria) this;
        }

        public Criteria andFkTypeidIsNotNull() {
            addCriterion("fk_typeId is not null");
            return (Criteria) this;
        }

        public Criteria andFkTypeidEqualTo(Integer value) {
            addCriterion("fk_typeId =", value, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidNotEqualTo(Integer value) {
            addCriterion("fk_typeId <>", value, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidGreaterThan(Integer value) {
            addCriterion("fk_typeId >", value, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidGreaterThanOrEqualTo(Integer value) {
            addCriterion("fk_typeId >=", value, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidLessThan(Integer value) {
            addCriterion("fk_typeId <", value, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidLessThanOrEqualTo(Integer value) {
            addCriterion("fk_typeId <=", value, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidIn(List<Integer> values) {
            addCriterion("fk_typeId in", values, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidNotIn(List<Integer> values) {
            addCriterion("fk_typeId not in", values, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidBetween(Integer value1, Integer value2) {
            addCriterion("fk_typeId between", value1, value2, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andFkTypeidNotBetween(Integer value1, Integer value2) {
            addCriterion("fk_typeId not between", value1, value2, "fkTypeid");
            return (Criteria) this;
        }

        public Criteria andEntityNameIsNull() {
            addCriterion("entity_name is null");
            return (Criteria) this;
        }

        public Criteria andEntityNameIsNotNull() {
            addCriterion("entity_name is not null");
            return (Criteria) this;
        }

        public Criteria andEntityNameEqualTo(String value) {
            addCriterion("entity_name =", value, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameNotEqualTo(String value) {
            addCriterion("entity_name <>", value, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameGreaterThan(String value) {
            addCriterion("entity_name >", value, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameGreaterThanOrEqualTo(String value) {
            addCriterion("entity_name >=", value, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameLessThan(String value) {
            addCriterion("entity_name <", value, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameLessThanOrEqualTo(String value) {
            addCriterion("entity_name <=", value, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameLike(String value) {
            addCriterion("entity_name like", value, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameNotLike(String value) {
            addCriterion("entity_name not like", value, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameIn(List<String> values) {
            addCriterion("entity_name in", values, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameNotIn(List<String> values) {
            addCriterion("entity_name not in", values, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameBetween(String value1, String value2) {
            addCriterion("entity_name between", value1, value2, "entityName");
            return (Criteria) this;
        }

        public Criteria andEntityNameNotBetween(String value1, String value2) {
            addCriterion("entity_name not between", value1, value2, "entityName");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(Double value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(Double value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(Double value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(Double value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(Double value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<Double> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<Double> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(Double value1, Double value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(Double value1, Double value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andEntityImageIsNull() {
            addCriterion("entity_image is null");
            return (Criteria) this;
        }

        public Criteria andEntityImageIsNotNull() {
            addCriterion("entity_image is not null");
            return (Criteria) this;
        }

        public Criteria andEntityImageEqualTo(String value) {
            addCriterion("entity_image =", value, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageNotEqualTo(String value) {
            addCriterion("entity_image <>", value, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageGreaterThan(String value) {
            addCriterion("entity_image >", value, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageGreaterThanOrEqualTo(String value) {
            addCriterion("entity_image >=", value, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageLessThan(String value) {
            addCriterion("entity_image <", value, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageLessThanOrEqualTo(String value) {
            addCriterion("entity_image <=", value, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageLike(String value) {
            addCriterion("entity_image like", value, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageNotLike(String value) {
            addCriterion("entity_image not like", value, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageIn(List<String> values) {
            addCriterion("entity_image in", values, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageNotIn(List<String> values) {
            addCriterion("entity_image not in", values, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageBetween(String value1, String value2) {
            addCriterion("entity_image between", value1, value2, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityImageNotBetween(String value1, String value2) {
            addCriterion("entity_image not between", value1, value2, "entityImage");
            return (Criteria) this;
        }

        public Criteria andEntityDescIsNull() {
            addCriterion("entity_desc is null");
            return (Criteria) this;
        }

        public Criteria andEntityDescIsNotNull() {
            addCriterion("entity_desc is not null");
            return (Criteria) this;
        }

        public Criteria andEntityDescEqualTo(String value) {
            addCriterion("entity_desc =", value, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescNotEqualTo(String value) {
            addCriterion("entity_desc <>", value, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescGreaterThan(String value) {
            addCriterion("entity_desc >", value, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescGreaterThanOrEqualTo(String value) {
            addCriterion("entity_desc >=", value, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescLessThan(String value) {
            addCriterion("entity_desc <", value, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescLessThanOrEqualTo(String value) {
            addCriterion("entity_desc <=", value, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescLike(String value) {
            addCriterion("entity_desc like", value, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescNotLike(String value) {
            addCriterion("entity_desc not like", value, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescIn(List<String> values) {
            addCriterion("entity_desc in", values, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescNotIn(List<String> values) {
            addCriterion("entity_desc not in", values, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescBetween(String value1, String value2) {
            addCriterion("entity_desc between", value1, value2, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityDescNotBetween(String value1, String value2) {
            addCriterion("entity_desc not between", value1, value2, "entityDesc");
            return (Criteria) this;
        }

        public Criteria andEntityInfoIsNull() {
            addCriterion("entity_info is null");
            return (Criteria) this;
        }

        public Criteria andEntityInfoIsNotNull() {
            addCriterion("entity_info is not null");
            return (Criteria) this;
        }

        public Criteria andEntityInfoEqualTo(String value) {
            addCriterion("entity_info =", value, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoNotEqualTo(String value) {
            addCriterion("entity_info <>", value, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoGreaterThan(String value) {
            addCriterion("entity_info >", value, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoGreaterThanOrEqualTo(String value) {
            addCriterion("entity_info >=", value, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoLessThan(String value) {
            addCriterion("entity_info <", value, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoLessThanOrEqualTo(String value) {
            addCriterion("entity_info <=", value, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoLike(String value) {
            addCriterion("entity_info like", value, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoNotLike(String value) {
            addCriterion("entity_info not like", value, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoIn(List<String> values) {
            addCriterion("entity_info in", values, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoNotIn(List<String> values) {
            addCriterion("entity_info not in", values, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoBetween(String value1, String value2) {
            addCriterion("entity_info between", value1, value2, "entityInfo");
            return (Criteria) this;
        }

        public Criteria andEntityInfoNotBetween(String value1, String value2) {
            addCriterion("entity_info not between", value1, value2, "entityInfo");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}