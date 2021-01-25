/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/1/25 16:30:24                           */
/*==============================================================*/


drop table if exists categories;

drop table if exists knowledge;

drop table if exists sensitiveWord;

drop table if exists set_categories;

drop table if exists share;

drop table if exists user;

/*==============================================================*/
/* Table: categories                                            */
/*==============================================================*/
create table categories
(
   categories_id        int not null auto_increment,
   name                 varchar(128) not null,
   primary key (categories_id)
)
auto_increment = 10
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table categories comment '分类表';

/*==============================================================*/
/* Table: knowledge                                             */
/*==============================================================*/
create table knowledge
(
   k_id                 int not null auto_increment,
   user_id              int not null,
   title                varchar(0) not null,
   abstract             varchar(0),
   content              longtext,
   createTime           datetime not null default NOW(),
   primary key (k_id)
)
auto_increment = 1000
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table knowledge comment '知识点表';

/*==============================================================*/
/* Table: sensitiveWord                                         */
/*==============================================================*/
create table sensitiveWord
(
   SWord_ID             int not null auto_increment comment '敏感词ID',
   word                 varchar(128) not null comment '敏感词',
   primary key (SWord_ID)
)
auto_increment = 100000
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table sensitiveWord comment '敏感词表';

/*==============================================================*/
/* Table: set_categories                                        */
/*==============================================================*/
create table set_categories
(
   k_id                 int not null,
   categories_id        int not null,
   primary key (k_id, categories_id)
);

alter table set_categories comment '设置分类表';

/*==============================================================*/
/* Table: share                                                 */
/*==============================================================*/
create table share
(
   user_id              int not null,
   k_id                 int not null
);

alter table share comment '分享表';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null auto_increment comment '用户ID',
   name                 varchar(128) not null comment '用户昵称',
   userName             varchar(32) not null comment '用户账号',
   password             varchar(32) not null comment '用户密码',
   avatar               varchar(1024) not null comment '头像URL',
   email                varchar(100) not null comment '用户邮箱',
   reg_ip               varchar(32) not null comment '注册ip',
   log_ip               varchar(32) not null comment '登录ip',
   role                 varchar(20) not null comment '角色',
   state                int not null comment '用户状态',
   primary key (user_id)
)
auto_increment = 1000
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table user comment '用户表';

alter table knowledge add constraint FK_Reference_5 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table set_categories add constraint FK_Reference_1 foreign key (k_id)
      references knowledge (k_id) on delete restrict on update restrict;

alter table set_categories add constraint FK_Reference_4 foreign key (categories_id)
      references categories (categories_id) on delete restrict on update restrict;

alter table share add constraint FK_Reference_2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table share add constraint FK_Reference_3 foreign key (k_id)
      references knowledge (k_id) on delete restrict on update restrict;

