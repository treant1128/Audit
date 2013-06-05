-- MySQL dump 10.13  Distrib 5.6.10, for Win32 (x86)
--
-- Host: localhost    Database: audit
-- ------------------------------------------------------
-- Server version	5.6.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_sms_task`
--

DROP TABLE IF EXISTS `t_sms_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sms_task` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `priority` int(3) DEFAULT NULL,
  `type` int(2) DEFAULT '0' COMMENT '0精细化，1扫沉',
  `method` int(2) DEFAULT NULL COMMENT '0短信，1push',
  `content` varchar(200) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `long_title` int(2) DEFAULT NULL COMMENT '0截断标题，1不截断标题',
  `jump` int(2) DEFAULT NULL COMMENT '0不跳出，1跳出',
  `send_title` varchar(1000) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `send_o_url` varchar(1000) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `send_s_url` varchar(200) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `send_time_type` int(2) DEFAULT '0' COMMENT '0立即下发1定时下发2稍后下发',
  `send_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `lock_flag` int(2) DEFAULT '0' COMMENT '编辑锁定状态1锁定，0未锁定',
  `black_filter` int(2) DEFAULT '1' COMMENT '1过滤黑名单，0不过滤黑名单',
  `qc_type` int(2) DEFAULT NULL COMMENT '0不去重，5仅和已发去重，6仅和与之列表去重，7完全去重',
  `excfile` varchar(50) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `srcfile` text COMMENT '选择的原始文件|分开',
  `sendfile` varchar(50) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `flag` char(6) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `opadmin` varchar(20) CHARACTER SET gbk COLLATE gbk_bin DEFAULT NULL,
  `op_step` int(3) DEFAULT '0' COMMENT '0已提交，1置换完成，2下发中',
  `del_flag` int(2) DEFAULT '0' COMMENT '0未删除，1已删除',
  `status` int(3) DEFAULT '0' COMMENT '0待审核，1待执行，2驳回，3执行中，4结束',
  `vip` int(3) DEFAULT '0',
  `qcfile` mediumtext,
  `interval_time` varchar(200) DEFAULT NULL COMMENT '下发时间段格式为08:00-12:00，多个时间段用,分隔',
  `num_count` int(11) DEFAULT NULL COMMENT '任务号码数量',
  `data_date` varchar(20) DEFAULT NULL COMMENT '数据日期',
  `audit_time` datetime DEFAULT NULL,
  `audit_suggestion` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `del_flag_indx` (`del_flag`),
  KEY `op_step_indx` (`op_step`),
  KEY `create_time_indx` (`create_time`),
  KEY `lock_flag_indx` (`lock_flag`),
  KEY `idxflag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sms_task`
--

LOCK TABLES `t_sms_task` WRITE;
/*!40000 ALTER TABLE `t_sms_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sms_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `priv` varchar(256) NOT NULL,
  `power` varchar(256) NOT NULL,
  `location` varchar(256) DEFAULT NULL,
  `secret` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','wk@9527','1','1','wukong','http://22.96.167.232/jslt/login.do?input=o9goW9fNwdfe9AL%2BxcU%2BH0%2F8gOlMWRi%2F'),(2,'xzx01','xzx01','1','1','wukong','http://42.96.167.232/jslt/login.do?input=IwxEed372Y5Nu8zpQdnVgw%3D%3D'),(3,'','123','1','1','wukong','http://42.96.167.232/jslt/login.do?input=pIia2a2adfXn6CUc4rg3%2BA%3D%3D'),(4,'离职人员','123','1','1','wukong','http://42.96.167.232/jslt/login.do?input=AqD3ve3YeE6kiJrZrZp19efoJRziuDf4'),(5,'hanxingmei','61667108','1','1','wukong','http://42.96.167.232/jslt/login.do?input=GMQ7ec%2Bomvhuhf9TonsTb6AvavDtidqX'),(6,'luxi','128486','1','1','wukong','http://42.96.167.232/jslt/login.do?input=3W0jeKfOlvPb9lwxchvWYQ%3D%3D'),(7,'hintsnow','791027','1','1','wukong','http://42.96.167.232/jslt/login.do?input=l4HWX%2BvoRNz4arPt%2BP%2FWablg8b6lNgz%2B'),(8,'chenyufang','232s9as3','1','1','wukong','http://42.96.167.232/jslt/login.do?input=u%2BXpjIDoPthLRN4cETHL4vL6cMPCpLrI'),(9,'shouyongfeng','syf666735','1','1','wukong','http://42.96.167.232/jslt/login.do?input=xEgSo4KO5gFxnR385peutX0DY%2B9UVk3v%2BFBgsJLYW%2B0%3D'),(10,'xzxxf','sz!x9x@02Xf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=G%2B%2FV%2FbA6XGlhr94Yo%2BB84%2FOMVl4IxILm'),(11,'zhaofenge','123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Wel77UjXRQ89gWyPuex8CTlhutGqcfdy'),(12,'liudi','taidi','1','1','wukong','http://42.96.167.232/jslt/login.do?input=xuTCjPO3Hkfsl%2FRyfRhQXA%3D%3D'),(13,'Yangyi','pener1977','1','1','wukong','http://42.96.167.232/jslt/login.do?input=rKKgAOJEgmWMNbX%2FJyeO0TlhutGqcfdy'),(14,'yangfeiyan','delete','1','1','wukong','http://42.96.167.232/jslt/login.do?input=6q9pQZIE%2F%2FB55wo4ayyrs8pgCGGBnsmx'),(15,'yangmin','asdfx3233','1','1','wukong','http://42.96.167.232/jslt/login.do?input=T%2BgFaqJ7ocX%2FEAtOGtB0wzmPW2%2FN32bC'),(16,'sunhaitao','sd323sagg','1','1','wukong','http://42.96.167.232/jslt/login.do?input=IhiBpETFNR3A%2F5r6%2B%2Fl8Ns2%2BTq2DvWQL'),(17,'liangchang','521zijihejiaren','1','1','wukong','http://42.96.167.232/jslt/login.do?input=i36HAcGVliIX%2FgQOSxrBNT7nqs5yWTS1A7RAmumor0U%3D'),(18,'liuhaolong','198688','1','1','wukong','http://42.96.167.232/jslt/login.do?input=d2RqEq9RGPcbOGIYuTH2YHFteQeTJ07g'),(19,'zhongna','43916056','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Meh7eeB%2F0C7o43Js%2B1BVCTlhutGqcfdy'),(20,'wangdeming','7716487','1','1','wukong','http://42.96.167.232/jslt/login.do?input=4mRApBd9Zp3vgM7kyNYUlZbsQtShanta'),(21,'huangqin','wukong','1','1','wukong','http://42.96.167.232/jslt/login.do?input=0rVPCzJlyszFZk6xXkcKKrlg8b6lNgz%2B'),(22,'liuguo','asd3223sw','1','1','wukong','http://42.96.167.232/jslt/login.do?input=IeGvlHJm%2FxyRdXwZXTwJnjlhutGqcfdy'),(23,'ahkf','ahkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=0esqe%2BRhz%2FLzjFZeCMSC5g%3D%3D'),(24,'sdlttest','sdlttest','1','1','wukong','http://42.96.167.232/jslt/login.do?input=ddA%2BZMnyq9RmYvVCYagbmpVrU8HSlzsh'),(25,'zhangyingye','zyy19810221','1','1','wukong','http://42.96.167.232/jslt/login.do?input=1FVFqoZsylBm%2Fc3mU%2BAKpY3bKWrlrlhguWDxvqU2DP4%3D'),(26,'sfkf1','sfkf1','1','1','wukong','http://42.96.167.232/jslt/login.do?input=FCTdKD3P4Qw8UvbSNpHsiQ%3D%3D'),(27,'sfdf2','sfdf2','1','1','wukong','http://42.96.167.232/jslt/login.do?input=8O3HvkVp0bpQXVVja5mgcw%3D%3D'),(28,'cckf','cckf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=4eBFS%2BnavzfzjFZeCMSC5g%3D%3D'),(29,'maskf','maskf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=hGOaM5o%2BXXFq%2B8oFWf3kyg%3D%3D'),(30,'bbkf','bbkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=i9Qxz0l3DSfzjFZeCMSC5g%3D%3D'),(31,'aqkf','aqkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=gDDBTlv11VfzjFZeCMSC5g%3D%3D'),(32,'whkf','whkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Kf6txrORBsbzjFZeCMSC5g%3D%3D'),(33,'lakf','lakf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=%2Fipx%2BB%2BIkPzzjFZeCMSC5g%3D%3D'),(34,'hfkf','hfkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=PgIDMfgvghLzjFZeCMSC5g%3D%3D'),(35,'fykf','fykf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=z13Dp0FsZV%2FzjFZeCMSC5g%3D%3D'),(36,'hnkf','hnkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=n5Rcj5%2Fj59zzjFZeCMSC5g%3D%3D'),(37,'tlkf','tlkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=61EpJ0jH9QLzjFZeCMSC5g%3D%3D'),(38,'chkf','chkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=6qqiMuLAtv3zjFZeCMSC5g%3D%3D'),(39,'xckf','xckf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=baE03VtmHlzzjFZeCMSC5g%3D%3D'),(40,'chzkf','chzkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=ELDq%2B4qLm28TOgRMMuDpbA%3D%3D'),(41,'szkf','szkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=CZeAOZ11XSLzjFZeCMSC5g%3D%3D'),(42,'hbkf','hbkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=s8TBltw2PizzjFZeCMSC5g%3D%3D'),(43,'hskf','hskf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=gZnIPgx56UPzjFZeCMSC5g%3D%3D'),(44,'czkf','czkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=mM7ig%2BGPVqHzjFZeCMSC5g%3D%3D'),(45,'bzkf','bzkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=rccxHEewxejzjFZeCMSC5g%3D%3D'),(46,'sdltjnkf','sdltjnkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=rDYn1FAU4uZq0%2BXkcHULh%2FOMVl4IxILm'),(47,'sdltqdkf','sdltqdkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=xKOZz8gwHIyH8wEZbX4VJ%2FOMVl4IxILm'),(48,'sdltzbkf','sdltzbkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=ec06AySV8dhaLzZ3Bx0AjPOMVl4IxILm'),(49,'sdltzzkf','sdltzzkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=ZCsJpG%2BbrnXmLBzPXvYVoPOMVl4IxILm'),(50,'sdltdykf','sdltdykf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=C7wu1OQ07kg3Fz36oiKHF%2FOMVl4IxILm'),(51,'sdltytkf','sdltytkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=gju4UoLZ0LMJqtQHdys5v%2FOMVl4IxILm'),(52,'sdltwfkf','sdltwfkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=OtdgYNao8JBRqO6YhDhjRPOMVl4IxILm'),(53,'sdltjinkf','sdltjinkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=XjWYjRbaWaA0zteH5M5ncuQ5qCDGcq3J'),(54,'sdlttakf','sdlttakf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=ByQP9n9Am8P6nnpu9FKuVfOMVl4IxILm'),(55,'sdltweihkf','sdltweihkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=cqbPIBT0ZP2DFjblH9HZCqUO%2FltVkm5MT%2FyA6UxZGL8%3D'),(56,'sdltrzkf','sdltrzkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=%2BD%2FtXECDs3uy5dY4wZGD7POMVl4IxILm'),(57,'sdltbinzkf','sdltbinzkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=BufO5C%2Bh84h7HlJS%2BaNPoW0q6mwEZCp%2FT%2FyA6UxZGL8%3D'),(58,'sdltdzkf','sdltdzkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=8EA%2Fs001%2BzHj5im3P8XMOfOMVl4IxILm'),(59,'sdltlckf','sdltlckf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Pp0GxLpRy7TbRRGh5P6ue%2FOMVl4IxILm'),(60,'sdltlykf','sdltlykf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=y6fKQD4hxdR2EiQP2RtPJfOMVl4IxILm'),(61,'sdlthzkf','sdlthzkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=dJ84sdjJDFYD%2F4Znk6kBxPOMVl4IxILm'),(62,'sdltlwkf','sdltlwkf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=UEJZu9mkRe1OLhKSTtHywfOMVl4IxILm'),(63,'hejie','manman520520','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Yn0STRQS1Sbq9zQbbuuRNRKaOjGY5mgv'),(64,'wangrongfang','wrf123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=q3I9P1i0QxR%2BqfE40o%2F%2B31vWU0dt94eM%2BFBgsJLYW%2B0%3D'),(65,'zjukf','zjukf','1','1','wukong','http://42.96.167.232/jslt/login.do?input=ZrdvxPpM0PK4f201uEVDWA%3D%3D'),(66,'zjuwg','zjuwg','1','1','wukong','http://42.96.167.232/jslt/login.do?input=2TKTAsY0rok4Gd1IWXrPRw%3D%3D'),(67,'zjuhz','zjuhz','1','1','wukong','http://42.96.167.232/jslt/login.do?input=SDDH5%2Fb%2Bj1fIHCIH86jr4w%3D%3D'),(68,'zjuwz','zjuwz','1','1','wukong','http://42.96.167.232/jslt/login.do?input=W0COvWDX9UmC%2BbocG3SKgA%3D%3D'),(69,'zjutz','zjutz','1','1','wukong','http://42.96.167.232/jslt/login.do?input=W6hgyxwqGr1B7n9RGKGCJQ%3D%3D'),(70,'zjujh','zjujh','1','1','wukong','http://42.96.167.232/jslt/login.do?input=8ac%2BW9LdwGzx75%2FLm%2BX8Sg%3D%3D'),(71,'zjuls','zjuls','1','1','wukong','http://42.96.167.232/jslt/login.do?input=bdUgxiqRwH3UGqPPCoQkRw%3D%3D'),(72,'zjuqz','zjuqz','1','1','wukong','http://42.96.167.232/jslt/login.do?input=xjaxROvKyuFmYCHJ46zzow%3D%3D'),(73,'zjunb','zjunb','1','1','wukong','http://42.96.167.232/jslt/login.do?input=5KjCTi2rp4vCJNyFPdoY6g%3D%3D'),(74,'zjujx','zjujx','1','1','wukong','http://42.96.167.232/jslt/login.do?input=%2FpJRKhtby1UUEz2490icZw%3D%3D'),(75,'zjusx','zjusx','1','1','wukong','http://42.96.167.232/jslt/login.do?input=jCnbwxYBNB4CqrMLSmZD%2BQ%3D%3D'),(76,'zjuzs','zjuzs','1','1','wukong','http://42.96.167.232/jslt/login.do?input=eOjzWkz%2Bqs1iowOGbUzdRQ%3D%3D'),(77,'zjuhuz','zjuhuz','1','1','wukong','http://42.96.167.232/jslt/login.do?input=JCa7h2GBApy%2BKuPw669d3U%2F8gOlMWRi%2F'),(78,'jibing','123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=WeKWsuNHVcogaU%2FzylW8xk%2F8gOlMWRi%2F'),(79,'zhanglinjun','123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=lo7PsC6kT9wUSqSsPy2MiAd0iegArkwx'),(80,'zhanghui','410330890','1','1','wukong','http://42.96.167.232/jslt/login.do?input=PvSqn4%2F9XfnKkihM5I0w5N6PCaZmEd21'),(81,'mali','784320','1','1','wukong','http://42.96.167.232/jslt/login.do?input=JdRoiGd3QvHn56btHtoNCw%3D%3D'),(82,'suqiang','s123456q','1','1','wukong','http://42.96.167.232/jslt/login.do?input=3ph%2F2vayE7nK5gK338FM4DlhutGqcfdy'),(83,'liumingyan','123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=fn%2F9%2FlBenrt%2F%2BjjOmLuWbQH%2FzejrvtD%2B'),(84,'jiaguangjian','123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=hamqsWlHh9QqaKg0eDatC%2BnT9S4b8ar7'),(85,'zhangshunkui','123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=hKqSBd8J533Hm1EJmtPhsunT9S4b8ar7'),(86,'zengjingyu','cat123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=zAlbLY0ZovUbIUiQXsBifbuShhpJSQJW5%2BglHOK4N%2Fg%3D'),(87,'wangzhe','wangzhe','1','1','wukong','http://42.96.167.232/jslt/login.do?input=dgFvfrj8VP12AW9%2BuPxU%2Fblg8b6lNgz%2B'),(88,'caoyizhi','23a234','1','1','wukong','http://42.96.167.232/jslt/login.do?input=0F5k%2F9b8zW55PEn7NVIjHLlg8b6lNgz%2B'),(89,'nanfang','cat123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=lrJBHSvfWIrMI8UMan9V7AH%2FzejrvtD%2B'),(90,'chengengbin','binbin','1','1','wukong','http://42.96.167.232/jslt/login.do?input=pyLMp%2BRVRvVZW88wKEKQr89GV23mNzY9'),(91,'lailiangxing','lailiangXING321','1','1','wukong','http://42.96.167.232/jslt/login.do?input=W67S20AGJNDp6iX2YUDca0NVMfToN9V65ZOOKh0yjYrn6CUc4rg3%2BA%3D%3D'),(92,'kepeiqiang','517457038','1','1','wukong','http://42.96.167.232/jslt/login.do?input=hYUSfZe5x4WnfjB0tm0ctl%2FriMlz8%2FUa5%2BglHOK4N%2Fg%3D'),(93,'dangxuehong','xhd457904582','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Q0Jm%2FUCN%2Bot3Jdv8MUn8Glajo9ZmtwzaOWG60apx93I%3D'),(94,'weilanzhi','delete','1','1','wukong','http://42.96.167.232/jslt/login.do?input=ToPnVH%2FqyZX8UJwUaZf5oDlhutGqcfdy'),(95,'baojing','871231','1','1','wukong','http://42.96.167.232/jslt/login.do?input=WkTO3gK7qD4pPu6mG780yPhQYLCS2Fvt'),(96,'wanglan','3923057','1','1','wukong','http://42.96.167.232/jslt/login.do?input=516kWWQd%2Bqh0bffdF8sjErlg8b6lNgz%2B'),(97,'chendan','3sa34ds','1','1','wukong','http://42.96.167.232/jslt/login.do?input=cguLPKTqVdf86v6n3%2FNwprlg8b6lNgz%2B'),(98,'sunbaojing','s19780918','1','1','wukong','http://42.96.167.232/jslt/login.do?input=OeszwSOIGc3va6%2BFOsftwPdiIimrrDJH5%2BglHOK4N%2Fg%3D'),(99,'caomanming','caomanming','1','1','wukong','http://42.96.167.232/jslt/login.do?input=hL7AReUEon9hjh%2BHOnMlRl0yu4zVR57jT%2FyA6UxZGL8%3D'),(100,'zhoupengfei','86469885','1','1','wukong','http://42.96.167.232/jslt/login.do?input=HXf9Ud5irJ%2FVwYNtosrmcicsaqtYyIp45%2BglHOK4N%2Fg%3D'),(101,'zhangke','123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=9ZAcmvTjODZb1lNHbfeHjPhQYLCS2Fvt'),(102,'gaoming','029010','1','1','wukong','http://42.96.167.232/jslt/login.do?input=qx9sSbaDkJ1StB2fwFDC6fhQYLCS2Fvt'),(103,'caoting','029010','1','1','wukong','http://42.96.167.232/jslt/login.do?input=536%2Bmcie67VStB2fwFDC6fhQYLCS2Fvt'),(104,'liupu','pp62211396','1','1','wukong','http://42.96.167.232/jslt/login.do?input=HnOC9MnXarxrypyvok8GEzlhutGqcfdy'),(105,'zhanglj','zlj123','1','1','wukong','http://42.96.167.232/jslt/login.do?input=e24htMClP3h151htWgVkbfhQYLCS2Fvt'),(106,'suqiang2','s123456q','1','1','wukong','http://42.96.167.232/jslt/login.do?input=JdQnxctgI8Tkh8BgSvFrlBcf%2Fjyz4sE8'),(107,'xuelong','xlwer213ewr','1','1','wukong','http://42.96.167.232/jslt/login.do?input=nW6QsuxU0sceByfRb8dVGSsskve1C5m1'),(108,'duanling','dl345','1','1','wukong','http://42.96.167.232/jslt/login.do?input=QGDWjq0cJI0UgrYJOGN7q%2FhQYLCS2Fvt'),(109,'chenyy','cyy620','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Q1Ho1ZRHAkjhbUZsC3nv5E%2F8gOlMWRi%2F'),(110,'chenyuanyuan','cyy123','1','1','wukong','http://42.96.167.232/jslt/login.do?input=VM2AiW%2BHCfAsR6vZNJcb3JkONjk%2BufPU'),(111,'lujf','lujf123','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Y6sltrVDJinFFAyoZaEus%2BfoJRziuDf4'),(112,'sufei','sufei563','1','1','wukong','http://42.96.167.232/jslt/login.do?input=%2FBkt2N7WvwtNOzJdX1bFhPhQYLCS2Fvt'),(113,'zhuyuan','zhuyuan777','1','1','wukong','http://42.96.167.232/jslt/login.do?input=ZhPyG1GJt2rCxZb%2F%2B9F%2BLIClkZqzemi7'),(114,'gaoyan','gaoyan_123','1','1','wukong','http://42.96.167.232/jslt/login.do?input=dPQCfLKELppnWImmwpr%2FVTmPW2%2FN32bC'),(115,'lijinhui','860405','1','1','wukong','http://42.96.167.232/jslt/login.do?input=gLnahdK7LuWOTZ3xunizfLlg8b6lNgz%2B'),(116,'fenghua','fenghua_789','1','1','wukong','http://42.96.167.232/jslt/login.do?input=3QrN5zACwHh6dQe%2Fj8qfwf%2FNcKklsS%2By'),(117,'renlikun','rlk9527','1','1','wukong','http://42.96.167.232/jslt/login.do?input=Tz5mMIWjb1%2FN6rYGp%2FzaTDlhutGqcfdy'),(118,'qianzhengping','qianzhengping223','1','1','wukong','http://42.96.167.232/jslt/login.do?input=u%2BQYOscTTDF3N5%2F8eqqpDXDUIVGTORvrTlMvLP2oSOD4UGCwkthb7Q%3D%3D'),(119,'zhangguiming','zgm282530','1','1','wukong','http://42.96.167.232/jslt/login.do?input=spZMTTnZkZzNoFWU26wo6BlS1rKDVPMg%2BFBgsJLYW%2B0%3D'),(120,'wangzhitao','123456','1','1','wukong','http://42.96.167.232/jslt/login.do?input=G70aAKK6xOnPCBwT1%2BfcrgH%2FzejrvtD%2B'),(121,'demo','demo010','1','1','wukong','http://42.96.167.232/jslt/login.do?input=BY7G6dCZ1f8U3CzTn1SK9ufoJRziuDf4'),(122,'jianglu','jianglu','2','2',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-05 14:34:37
