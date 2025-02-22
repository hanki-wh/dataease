DROP TABLE IF EXISTS `core_copilot_msg`;
CREATE TABLE `core_copilot_msg`  (
     `id` bigint NOT NULL COMMENT 'ID',
     `user_id` bigint DEFAULT NULL COMMENT '用户ID',
     `dataset_group_id` bigint DEFAULT NULL COMMENT '数据集ID',
     `msg_type` varchar(255) DEFAULT NULL COMMENT 'user or api',
     `engine_type` varchar(255) DEFAULT NULL COMMENT 'mysql oracle ...',
     `schema_sql` longtext COMMENT 'create sql',
     `question` longtext COMMENT '用户提问',
     `history` longtext COMMENT '历史信息',
     `copilot_sql` longtext COMMENT 'copilot 返回 sql',
     `api_msg` longtext COMMENT 'copilot 返回信息',
     `sql_ok` int DEFAULT NULL COMMENT 'sql 状态',
     `chart_ok` int DEFAULT NULL COMMENT 'chart 状态',
     `chart` longtext COMMENT 'chart 内容',
     `chart_data` longtext COMMENT '视图数据',
     `exec_sql` longtext COMMENT '执行请求的SQL',
     `msg_status` int  DEFAULT NULL COMMENT 'msg状态，0失败 1成功',
     `err_msg` longtext COMMENT 'de错误信息',
     `create_time` bigint  DEFAULT NULL COMMENT '创建时间',
     PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `core_copilot_token`;
CREATE TABLE `core_copilot_token`  (
      `id` bigint NOT NULL COMMENT 'ID',
      `type` varchar(255) DEFAULT NULL COMMENT 'free or license',
      `token` longtext,
      `update_time` bigint DEFAULT NULL,
      PRIMARY KEY (`id`)
);

INSERT INTO `core_copilot_token` VALUES (1, 'free', null, null);
INSERT INTO `core_copilot_token` VALUES (2, 'license', null, null);


DROP TABLE IF EXISTS `core_copilot_config`;
CREATE TABLE `core_copilot_config`  (
    `id` bigint NOT NULL COMMENT 'ID',
    `copilot_url` varchar(255) DEFAULT NULL,
    `username` varchar(255) DEFAULT NULL,
    `pwd` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `core_copilot_config` VALUES (1, 'https://copilot-demo.test.fit2cloud.dev:5000', 'xlab', 'Q2Fsb25nQDIwMTU=');

