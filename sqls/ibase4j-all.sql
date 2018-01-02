/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.17 : Database - ibase4j
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ibase4j` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ibase4j`;

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values 
('iBase4J-Scheduler','STATE_ACCESS'),
('iBase4J-Scheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values 
('iBase4J-Scheduler','sky1514363057457',1514368883368,20000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

/*Table structure for table `sys_article` */

DROP TABLE IF EXISTS `sys_article`;

CREATE TABLE `sys_article` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_` varchar(2) DEFAULT NULL COMMENT '类型',
  `author_` varchar(16) DEFAULT NULL COMMENT '作者',
  `title_` varchar(128) DEFAULT NULL COMMENT '标题',
  `content_` longtext COMMENT '内容',
  `out_url` varchar(512) DEFAULT NULL COMMENT '外部链接',
  `seo_keyword` varchar(64) DEFAULT NULL COMMENT 'seo关键字',
  `seo_description` varchar(256) DEFAULT NULL COMMENT 'seo描述',
  `is_top` tinyint(1) DEFAULT NULL COMMENT '是否置顶',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章';

/*Data for the table `sys_article` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `unit_id` bigint(20) NOT NULL COMMENT '隶属单位',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门编号',
  `sort_no` int(3) DEFAULT NULL COMMENT '排序号',
  `leaf_` int(1) DEFAULT NULL COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime  NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime  NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=825363166504628225 DEFAULT CHARSET=utf8 COMMENT='部门';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`id_`,`unit_id`,`dept_name`,`parent_id`,`sort_no`,`leaf_`,`enable_`,`remark_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,1,'iBase4J',0,1,0,1,'qw',1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:06'),
(2,1,'市场部',1,1,1,1,'t',0,'2016-06-28 18:04:06',1,'2017-12-27 13:58:42'),
(825363166504628224,1,'技术部',1,2,NULL,NULL,'',1,'2017-01-28 23:21:28',1,'2017-12-27 13:58:50');

/*Table structure for table `sys_dic` */

DROP TABLE IF EXISTS `sys_dic`;

CREATE TABLE `sys_dic` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_` varchar(50) NOT NULL,
  `code_` varchar(50) DEFAULT NULL,
  `code_text` varchar(100) DEFAULT NULL,
  `parent_type` varchar(50) DEFAULT NULL,
  `parent_code` varchar(50) DEFAULT NULL,
  `sort_no` int(2) DEFAULT NULL,
  `editable_` tinyint(1) NOT NULL DEFAULT '1',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime     DEFAULT null,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime     DEFAULT null,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `type__code_` (`type_`,`code_`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='数据字典明细表';

/*Data for the table `sys_dic` */

insert  into `sys_dic`(`id_`,`type_`,`code_`,`code_text`,`parent_type`,`parent_code`,`sort_no`,`editable_`,`enable_`,`remark_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'SEX','0','未知',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:13'),
(2,'SEX','1','男',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:12'),
(3,'SEX','2','女',NULL,NULL,3,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:11'),
(4,'LOCKED','0','激活',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:11'),
(5,'LOCKED','1','锁定',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:10'),
(6,'ROLETYPE','1','业务角色',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:09'),
(7,'ROLETYPE','2','管理角色',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:09'),
(8,'ROLETYPE','3','系统内置角色',NULL,NULL,3,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:08'),
(9,'LEAF','0','树枝节点',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:07'),
(10,'LEAF','1','叶子节点',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:07'),
(11,'EDITABLE','0','只读',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:06'),
(12,'EDITABLE','1','可编辑',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:06'),
(13,'ENABLE','0','禁用',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:05'),
(14,'ENABLE','1','启用',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:04'),
(15,'AUTHORIZELEVEL','1','访问权限',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:03'),
(16,'AUTHORIZELEVEL','2','管理权限',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:02'),
(17,'MENUTYPE','1','系统菜单',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:03'),
(18,'MENUTYPE','2','业务菜单',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:01'),
(19,'USERTYPE','1','经办员',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:50'),
(20,'USERTYPE','2','管理员',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:48'),
(21,'USERTYPE','3','系统内置用户',NULL,NULL,3,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:47'),
(22,'EXPAND','0','收缩',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:47'),
(23,'EXPAND','1','展开',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:46'),
(24,'CRUD','add','新增',NULL,NULL,1,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:56'),
(25,'CRUD','read','查询',NULL,NULL,2,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:58'),
(26,'CRUD','update','修改',NULL,NULL,3,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:59'),
(27,'CRUD','delete','删除',NULL,NULL,4,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:03:59'),
(28,'CRUD','open','打开',NULL,NULL,5,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:00'),
(29,'CRUD','close','关闭',NULL,NULL,6,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:01'),
(30,'CRUD','run','执行',NULL,NULL,7,0,1,NULL,1,'2016-06-28 18:04:06',1,'2016-06-28 18:04:01');

/*Table structure for table `sys_email` */

DROP TABLE IF EXISTS `sys_email`;

CREATE TABLE `sys_email` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '邮件编号',
  `email_name` varchar(128) NOT NULL COMMENT '邮件名称',
  `sender_` varchar(32) NOT NULL COMMENT '使用发送',
  `email_title` varchar(256) NOT NULL COMMENT '发送标题',
  `email_content` text NOT NULL COMMENT '发送内容',
  `remark_` varchar(500) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime   NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime   NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='邮件表';

/*Data for the table `sys_email` */

insert  into `sys_email`(`id_`,`email_name`,`sender_`,`email_title`,`email_content`,`remark_`,`enable_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'test','t','a','并蒂芙蓉',NULL,1,1,'2017-02-02 16:37:54',1,'2017-02-02 16:37:54');

/*Table structure for table `sys_email_config` */

DROP TABLE IF EXISTS `sys_email_config`;

CREATE TABLE `sys_email_config` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '邮件配置编号',
  `smtp_host` varchar(32) NOT NULL COMMENT 'SMTP服务器',
  `smtp_port` varchar(8) NOT NULL COMMENT 'SMTP服务器端口',
  `send_method` varchar(16) NOT NULL COMMENT '发送方式',
  `sender_name` varchar(64) NOT NULL COMMENT '名称',
  `sender_account` varchar(32) NOT NULL COMMENT '发邮件邮箱账号',
  `sender_password` varchar(32) NOT NULL COMMENT '发邮件邮箱密码',
  `remark_` varchar(500) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime   NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime   NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=828157583909109761 DEFAULT CHARSET=utf8 COMMENT='邮件配置表';

/*Data for the table `sys_email_config` */

insert  into `sys_email_config`(`id_`,`smtp_host`,`smtp_port`,`send_method`,`sender_name`,`sender_account`,`sender_password`,`remark_`,`enable_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(828157583909109760,'smtp.163.com','101','0','iBase4J','iBase4J@163.com','BK5sgjz5JOOsFuD4w0mbe7==',NULL,1,1,'2017-02-05 16:25:29',1,'2017-02-05 16:37:50');

/*Table structure for table `sys_email_template` */

DROP TABLE IF EXISTS `sys_email_template`;

CREATE TABLE `sys_email_template` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '邮件模版编号',
  `email_name` varchar(128) NOT NULL COMMENT '邮件名称',
  `email_account` varchar(32) DEFAULT NULL COMMENT '发送邮件帐号',
  `sort_` int(5) DEFAULT NULL COMMENT '排序号',
  `title_` varchar(512) DEFAULT NULL COMMENT '标题模版',
  `template_` text COMMENT '内容模板',
  `remark_` varchar(500) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime   NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime   NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件模版表';

/*Data for the table `sys_email_template` */

/*Table structure for table `sys_event` */

DROP TABLE IF EXISTS `sys_event`;

CREATE TABLE `sys_event` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `title_` varchar(50) DEFAULT NULL,
  `request_uri` varchar(50) DEFAULT NULL,
  `parameters_` varchar(500) DEFAULT NULL,
  `method_` varchar(20) DEFAULT NULL,
  `client_host` varchar(50) DEFAULT NULL,
  `user_agent` varchar(300) DEFAULT NULL,
  `status_` int(3) DEFAULT NULL,
  `enable_` tinyint(1) DEFAULT NULL,
  `remark_` text,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime   NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime   NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `sys_event` */

insert  into `sys_event`(`id_`,`title_`,`request_uri`,`parameters_`,`method_`,`client_host`,`user_agent`,`status_`,`enable_`,`remark_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-26 22:41:19',1,'2017-12-26 22:41:19'),
(2,'用户登出','/logout','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',NULL,'2017-12-26 22:55:33',NULL,'2017-12-26 22:55:33'),
(3,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-26 22:55:35',1,'2017-12-26 22:55:35'),
(4,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-26 23:35:19',1,'2017-12-26 23:35:19'),
(5,'用户登出','/logout','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',NULL,'2017-12-26 23:37:03',NULL,'2017-12-26 23:37:03'),
(6,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-27 13:37:32',1,'2017-12-27 13:37:32'),
(7,'用户登出','/logout','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',NULL,'2017-12-27 13:44:13',NULL,'2017-12-27 13:44:13'),
(8,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-27 13:44:15',1,'2017-12-27 13:44:15'),
(9,'用户登出','/logout','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',NULL,'2017-12-27 13:46:41',NULL,'2017-12-27 13:46:41'),
(10,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[test]登录成功.',2,'2017-12-27 13:46:52',2,'2017-12-27 13:46:52'),
(11,'用户登出','/logout','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',NULL,'2017-12-27 13:47:30',NULL,'2017-12-27 13:47:30'),
(12,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-27 13:47:33',1,'2017-12-27 13:47:33'),
(13,'用户登出','/logout','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',NULL,'2017-12-27 13:48:36',NULL,'2017-12-27 13:48:36'),
(14,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-27 13:49:15',1,'2017-12-27 13:49:15'),
(15,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-27 13:51:05',1,'2017-12-27 13:51:05'),
(16,NULL,'/error','{}','GET','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',404,NULL,'',NULL,'2017-12-27 13:51:07',NULL,'2017-12-27 13:51:07'),
(17,NULL,'/error','{}','GET','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',404,NULL,'',NULL,'2017-12-27 13:51:39',NULL,'2017-12-27 13:51:39'),
(18,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-27 13:58:10',1,'2017-12-27 13:58:10'),
(19,'修改部门','/dept','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',1,'2017-12-27 13:58:42',1,'2017-12-27 13:58:42'),
(20,'修改部门','/dept','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',1,'2017-12-27 13:58:50',1,'2017-12-27 13:58:50'),
(21,'用户登录','/login','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'[admin]登录成功.',1,'2017-12-27 16:15:39',1,'2017-12-27 16:15:39'),
(22,'上传图片','/upload/imageData','','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',1,'2017-12-27 16:19:19',1,'2017-12-27 16:19:19'),
(23,'修改用户信息','/user','{}','POST','10.192.1.30','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0',200,NULL,'',1,'2017-12-27 16:19:20',1,'2017-12-27 16:19:20');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `menu_name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `menu_type` smallint(2) DEFAULT '2' COMMENT '菜单类型(0:CURD;1:系统菜单;2:业务菜单;)',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级菜单编号',
  `iconcls_` varchar(50) DEFAULT NULL COMMENT '节点图标CSS类名',
  `request_` varchar(100) DEFAULT NULL COMMENT '请求地址',
  `expand_` tinyint(1) NOT NULL DEFAULT '0' COMMENT '展开状态(1:展开;0:收缩)',
  `sort_no` int(2) DEFAULT NULL COMMENT '排序号',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `permission_` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime      DEFAULT null,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime     DEFAULT  null,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='菜单';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id_`,`menu_name`,`menu_type`,`parent_id`,`iconcls_`,`request_`,`expand_`,`sort_no`,`is_show`,`permission_`,`remark_`,`enable_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'系统管理',1,0,'glyphicon glyphicon-cog','#',0,1,1,'sys',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-29 08:19:19'),
(2,'用户管理',1,1,'glyphicon glyphicon-user','main.sys.user.list',0,1,1,'sys.base.user',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-29 08:38:35'),
(3,'部门管理',1,1,'glyphicon glyphicon-flag','main.sys.dept.list',0,2,1,'sys.base.dept',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-28 18:07:43'),
(4,'菜单管理',1,1,'glyphicon glyphicon-list','main.sys.menu.list',0,3,1,'sys.base.menu',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-28 18:07:45'),
(5,'角色管理',1,1,'glyphicon glyphicon-tags','main.sys.role.list',0,4,1,'sys.base.role',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-28 18:07:47'),
(6,'会话管理',1,1,'glyphicon glyphicon-earphone','main.sys.session.list',0,6,1,'sys.base.session',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-28 18:07:49'),
(7,'字典管理',1,1,'glyphicon glyphicon-book','main.sys.dic.list',0,7,1,'sys.base.dic',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-28 18:07:50'),
(8,'参数管理',1,1,'glyphicon glyphicon-wrench','main.sys.param.list',0,8,1,'sys.base.param',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-28 18:07:52'),
(9,'调度中心',1,0,'glyphicon glyphicon-fire','#',0,2,1,'sys.task',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-30 14:23:57'),
(10,'调度管理',1,9,'glyphicon glyphicon-random','main.task.scheduled.list',0,3,1,'sys.task.scheduled',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-30 14:24:02'),
(11,'调度日志',1,9,'glyphicon glyphicon-file','main.task.log.list',0,4,1,'sys.task.log',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-28 18:08:48'),
(14,'清除缓存',1,1,NULL,NULL,0,9,0,'sys.sys.cache',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-29 09:39:25'),
(15,'用户权限',1,1,NULL,NULL,0,10,0,'sys.permisson.roleMenu',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-29 09:39:27'),
(16,'用户角色',1,1,NULL,NULL,0,11,0,'sys.permisson.useRole',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-29 09:39:29'),
(17,'角色权限',1,1,NULL,NULL,0,12,0,'sys.permisson.userMenu',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-29 09:39:33'),
(18,'单位管理',1,1,'glyphicon glyphicon-flag','main.sys.unit.list',0,2,1,'sys.base.unit',NULL,1,1,'2016-06-20 09:16:56',1,'2016-06-28 18:07:43');

/*Table structure for table `sys_msg` */

DROP TABLE IF EXISTS `sys_msg`;

CREATE TABLE `sys_msg` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` varchar(64) NOT NULL COMMENT '平台编号',
  `type_` varchar(32) NOT NULL COMMENT '类型',
  `phone_` varchar(20) NOT NULL COMMENT '接收短信号码',
  `content_` varchar(256) NOT NULL COMMENT '短信内容',
  `send_state` varchar(1) NOT NULL COMMENT '发送状态',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信';

/*Data for the table `sys_msg` */

/*Table structure for table `sys_msg_config` */

DROP TABLE IF EXISTS `sys_msg_config`;

CREATE TABLE `sys_msg_config` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `sms_plat_url` varchar(128) DEFAULT NULL COMMENT '短信平台地址',
  `sms_plat_account` varchar(32) DEFAULT NULL COMMENT '短信平台帐号',
  `sms_plat_password` varchar(64) DEFAULT NULL COMMENT '短信平台密码',
  `send_phone` varchar(11) DEFAULT NULL COMMENT '发送短信',
  `sender_name` varchar(32) DEFAULT NULL COMMENT '发送短信签名',
  `order_is_send` tinyint(1) DEFAULT NULL COMMENT '客户下订单时是否给商家发短信',
  `pay_is_send` tinyint(1) DEFAULT NULL COMMENT '客户付款时是否给商家发短信',
  `send_goods_is_send` tinyint(1) DEFAULT NULL COMMENT '商家发货时是否给客户发短信',
  `regist_is_send` tinyint(1) DEFAULT NULL COMMENT '用户注册时是否给客户发短信',
  `advice_goods_is_send` tinyint(1) DEFAULT NULL COMMENT '用户付款后是否给客户发收货验证码',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_msg_config` */

/*Table structure for table `sys_news` */

DROP TABLE IF EXISTS `sys_news`;

CREATE TABLE `sys_news` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `news_title` varchar(64) NOT NULL COMMENT '新闻标题',
  `news_type` varchar(8) NOT NULL COMMENT '新闻类型',
  `send_time` datetime   NULL COMMENT '发布时间',
  `author_` varchar(32) NOT NULL COMMENT '作者',
  `editor_` varchar(32) NOT NULL COMMENT '编辑',
  `tags_` varchar(128) DEFAULT NULL COMMENT 'Tag标签',
  `keys_` varchar(128) DEFAULT NULL COMMENT '关键字',
  `content_` text COMMENT '内容',
  `reader_times` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `status_` varchar(2) NOT NULL DEFAULT '1' COMMENT '发布状态',
  `remark_` varchar(500) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime   NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime   NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

/*Data for the table `sys_news` */

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `notice_title` varchar(128) NOT NULL COMMENT '公告标题',
  `notice_type` varchar(8) NOT NULL COMMENT '公告类型',
  `send_time` datetime DEFAULT NULL COMMENT '发布时间',
  `info_sources` varchar(256) DEFAULT NULL COMMENT '信息来源',
  `sources_url` varchar(2048) DEFAULT NULL COMMENT '来源地址',
  `content_` text COMMENT '内容',
  `reader_times` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `status_` varchar(2) NOT NULL DEFAULT '1' COMMENT '发布状态',
  `remark_` varchar(500) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime   NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime   NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

/*Data for the table `sys_notice` */

/*Table structure for table `sys_param` */

DROP TABLE IF EXISTS `sys_param`;

CREATE TABLE `sys_param` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数编号',
  `param_key` varchar(50) DEFAULT NULL COMMENT '参数键名',
  `param_value` varchar(100) DEFAULT NULL COMMENT '参数键值',
  `catalog_id` bigint(20) DEFAULT NULL,
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime   NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime   NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局参数表';

/*Data for the table `sys_param` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属部门编号',
  `role_type` int(1) NOT NULL DEFAULT '1' COMMENT '角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime     DEFAULT null,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime     DEFAULT null,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id_`,`role_name`,`dept_id`,`role_type`,`enable_`,`remark_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'管理员',1,1,1,NULL,1,'2016-06-20 09:16:56',1,'2017-01-29 10:11:20');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(50) NOT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime     DEFAULT null,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime     DEFAULT null,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_role_menu_key1` (`role_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='角色授权表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id_`,`role_id`,`menu_id`,`permission_`,`enable_`,`remark_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,1,1,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:04'),
(2,1,2,'add',1,NULL,1,'2016-06-29 09:10:10',1,'2016-06-29 09:10:10'),
(3,1,2,'delete',1,NULL,1,'2016-06-29 09:10:29',1,'2016-06-29 09:10:29'),
(4,1,2,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:07'),
(5,1,2,'update',1,NULL,1,'2016-06-29 09:10:20',1,'2016-06-29 09:10:20'),
(6,1,3,'add',1,NULL,1,'2016-06-29 09:10:50',1,'2016-06-29 09:10:50'),
(7,1,3,'delete',1,NULL,1,'2016-06-29 09:11:18',1,'2016-06-29 09:11:18'),
(8,1,3,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:08'),
(9,1,3,'update',1,NULL,1,'2016-06-29 09:11:01',1,'2016-06-29 09:11:01'),
(10,1,4,'add',1,NULL,1,'2016-06-29 09:12:14',1,'2016-06-29 09:12:14'),
(11,1,4,'delete',1,NULL,1,'2016-06-29 09:18:43',1,'2016-06-29 09:18:43'),
(12,1,4,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:08'),
(13,1,4,'update',1,NULL,1,'2016-06-29 09:18:33',1,'2016-06-29 09:18:33'),
(14,1,5,'add',1,NULL,1,'2016-06-29 09:19:00',1,'2016-06-29 09:19:00'),
(15,1,5,'delete',1,NULL,1,'2016-06-29 09:19:24',1,'2016-06-29 09:19:24'),
(16,1,5,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:09'),
(17,1,5,'update',1,NULL,1,'2016-06-29 09:19:10',1,'2016-06-29 09:19:10'),
(18,1,6,'delete',1,NULL,1,'2016-06-29 09:19:35',1,'2016-06-29 09:19:35'),
(19,1,6,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:09'),
(20,1,7,'add',1,NULL,1,'2016-06-29 09:19:58',1,'2016-06-29 09:19:58'),
(21,1,7,'delete',1,NULL,1,'2016-06-29 09:20:18',1,'2016-06-29 09:20:18'),
(22,1,7,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:10'),
(23,1,7,'update',1,NULL,1,'2016-06-29 09:20:08',1,'2016-06-29 09:20:08'),
(24,1,8,'add',1,NULL,1,'2016-06-29 09:20:34',1,'2016-06-29 09:20:34'),
(25,1,8,'delete',1,NULL,1,'2016-06-29 09:20:53',1,'2016-06-29 09:20:53'),
(26,1,8,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:11'),
(27,1,8,'update',1,NULL,1,'2016-06-29 09:20:44',1,'2016-06-29 09:20:44'),
(28,1,9,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:11'),
(29,1,10,'add',1,NULL,1,'2016-06-29 09:21:55',1,'2016-06-29 09:21:55'),
(30,1,10,'delete',1,NULL,1,'2016-06-29 09:22:07',1,'2016-06-29 09:22:32'),
(31,1,10,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:13'),
(32,1,10,'update',1,NULL,1,'2016-06-29 09:22:49',1,'2016-06-29 09:22:49'),
(33,1,10,'close',1,NULL,1,'2016-06-29 08:45:21',1,'2016-06-29 08:45:21'),
(34,1,10,'open',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:13'),
(35,1,10,'run',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:13'),
(36,1,11,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:13'),
(37,1,14,'update',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:43:18'),
(38,1,15,'update',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:43:33'),
(39,1,16,'update',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:43:34'),
(40,1,17,'update',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:43:35'),
(41,1,18,'read',1,NULL,1,'2016-06-28 18:18:50',1,'2016-06-29 08:23:13');

/*Table structure for table `sys_session` */

DROP TABLE IF EXISTS `sys_session`;

CREATE TABLE `sys_session` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(50) DEFAULT NULL,
  `account_` varchar(50) DEFAULT NULL,
  `ip_` varchar(50) DEFAULT NULL,
  `start_time` datetime   NULL,
  `enable_` tinyint(1) DEFAULT NULL,
  `remark_` varchar(5000) DEFAULT NULL,
  `create_time` datetime   NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime   NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话管理';

/*Data for the table `sys_session` */

/*Table structure for table `sys_unit` */

DROP TABLE IF EXISTS `sys_unit`;

CREATE TABLE `sys_unit` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(128) NOT NULL COMMENT '单位名称',
  `principal_` varchar(32) DEFAULT NULL COMMENT '负责人',
  `phone_` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `address_` varchar(256) DEFAULT NULL COMMENT '地址',
  `sort_` int(5) DEFAULT NULL COMMENT '排序号',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_time` datetime   NULL,
  `create_by` bigint(20) NOT NULL,
  `update_time` datetime   NULL,
  `update_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单位表';

/*Data for the table `sys_unit` */

insert  into `sys_unit`(`id_`,`unit_name`,`principal_`,`phone_`,`address_`,`sort_`,`enable_`,`remark_`,`create_time`,`create_by`,`update_time`,`update_by`) values 
(1,'iBase4J','经理','13945678911','中国',1,NULL,'','2017-01-12 00:00:00',1,'2017-09-19 11:30:17',1);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_` varchar(20) DEFAULT NULL COMMENT '登陆帐户',
  `password_` varchar(50) DEFAULT NULL COMMENT '密码',
  `user_type` varchar(2) DEFAULT '1' COMMENT '用户类型(1普通用户2管理员3系统用户)',
  `user_name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `name_pinyin` varchar(64) DEFAULT NULL COMMENT '姓名拼音',
  `sex_` int(1) NOT NULL DEFAULT '0' COMMENT '性别(0:未知;1:男;2:女)',
  `avatar_` varchar(500) DEFAULT NULL COMMENT '头像',
  `phone_` varchar(50) DEFAULT NULL COMMENT '电话',
  `email_` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `wei_xin` varchar(32) DEFAULT NULL COMMENT '微信',
  `wei_bo` varchar(32) DEFAULT NULL COMMENT '微博',
  `qq_` varchar(32) DEFAULT NULL COMMENT 'QQ',
  `birth_day` date DEFAULT NULL COMMENT '出生日期',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门编号',
  `position_` varchar(64) DEFAULT NULL COMMENT '职位',
  `address_` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `staff_no` varchar(32) DEFAULT NULL COMMENT '工号',
  `enable_` tinyint(1) DEFAULT '1',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `account` (`account_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户管理';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id_`,`account_`,`password_`,`user_type`,`user_name`,`name_pinyin`,`sex_`,`avatar_`,`phone_`,`email_`,`id_card`,`wei_xin`,`wei_bo`,`qq_`,`birth_day`,`dept_id`,`position_`,`address_`,`staff_no`,`enable_`,`remark_`,`create_time`,`create_by`,`update_time`,`update_by`) values 
(1,'admin','i/sV2VpTPy7Y+ppesmkCmM==','3','管理员','GUANLIYUAN',0,'http://localhost/img/744.png','15333821711','12@12',NULL,NULL,NULL,NULL,'2017-01-27',2,'213',NULL,NULL,1,'1','2016-05-06 10:06:52',1,'2017-03-18 18:03:55',1),
(2,'test','i/sV2VpTPy7Y+ppesmkCmM==','1','admin','CESHIRENYUAN',1,'http://localhost/img/689.png','13800138000','123@163.com','','','','','2017-02-01',825363166504628224,'测试','','',1,'1','2016-05-13 16:58:17',1,'2017-12-27 16:19:20',1);

/*Table structure for table `sys_user_menu` */

DROP TABLE IF EXISTS `sys_user_menu`;

CREATE TABLE `sys_user_menu` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(50) NOT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime   DEFAULT null,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime   DEFAULT null,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_user_menu_key1` (`user_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户授权表';

/*Data for the table `sys_user_menu` */

insert  into `sys_user_menu`(`id_`,`user_id`,`menu_id`,`permission_`,`enable_`,`remark_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,1,1,'read',1,NULL,0,'2017-08-28 16:24:01',0,'2017-08-28 16:24:01');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime   DEFAULT null,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime   DEFAULT null,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_id_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户授权表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id_`,`user_id`,`role_id`,`enable_`,`remark_`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,1,1,1,NULL,1,'2016-06-16 15:59:56',1,'2016-06-16 15:59:56');

/*Table structure for table `sys_user_thirdparty` */

DROP TABLE IF EXISTS `sys_user_thirdparty`;

CREATE TABLE `sys_user_thirdparty` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `provider_` varchar(50) NOT NULL COMMENT '第三方类型',
  `open_id` varchar(50) NOT NULL COMMENT '第三方Id',
  `enable_` tinyint(1) DEFAULT NULL,
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_time` datetime  DEFAULT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_time` datetime DEFAULT  NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_id_provider__open_id` (`user_id`,`provider_`,`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户';

/*Data for the table `sys_user_thirdparty` */

/*Table structure for table `task_fire_log` */

DROP TABLE IF EXISTS `task_fire_log`;

CREATE TABLE `task_fire_log` (
  `id_` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  `task_name` varchar(50) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status_` varchar(1) NOT NULL DEFAULT 'I',
  `server_host` varchar(50) DEFAULT NULL COMMENT '服务器名',
  `server_duid` varchar(50) DEFAULT NULL COMMENT '服务器网卡序列号',
  `fire_info` text,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `group_name_task_name_start_time` (`group_name`,`task_name`,`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `task_fire_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
