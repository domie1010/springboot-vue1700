--用户表
CREATE TABLE users(
  user_id  BIGINT PRIMARY key IDENTITY (1000,1),
  username VARCHAR(50) NOT NULL UNIQUE ,
  password varchar(50) NOT NULL ,
  real_name varchar(50)

);


--学生表

CREATE TABLE students(
  stu_code  BIGINT PRIMARY key   ,--学号
  username varchar(50) NOT NULL UNIQUE ,--账号
  password varchar(50) NOT NULL ,--密码
  real_name varchar(50),--姓名
  college varchar(50),--专业
  major varchar(50), --班级
  account FLOAT DEFAULT 0,--账户余额,
  phone varchar(11)
);


--车辆品牌表


CREATE TABLE type(
  type_id int NOT NULL  PRIMARY KEY IDENTITY (1,1),
  type_name varchar(255) UNIQUE

);

--自行车表
CREATE TABLE entity(
  entityid BIGINT NOT NULL PRIMARY KEY IDENTITY (1000,1),
  fk_typeId int FOREIGN KEY REFERENCES type(type_id) ,
  entity_name varchar(255) NOT NULL ,
  price FLOAT DEFAULT 0,
  entity_image varchar(255),
  entity_desc varchar(5000),
  entity_info varchar(255)
);



---订单

create TABLE  entity_order(
  order_id BIGINT PRIMARY KEY IDENTITY (1000,1),
  fk_stu_code bigint FOREIGN KEY REFERENCES students(stu_code),
  fk_entity_id bigint FOREIGN KEY REFERENCES entity(entityid),
  start_date date NOT NULL ,
  end_date date NOT NULL ,
  total_price FLOAT
);
