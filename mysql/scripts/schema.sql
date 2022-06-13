DROP DATABASE IF EXISTS test_db;
CREATE DATABASE test_db;

CREATE USER 'test_user'@'%' IDENTIFIED WITH mysql_native_password BY 'test_password';
GRANT SELECT, INSERT, DELETE, UPDATE, CREATE, ALTER, DROP ON test_db.* TO 'test_user'@'%';
# GRANT ALL PRIVILEGES ON *.* TO 'test_user'@'%';
FLUSH PRIVILEGES;

USE test_db;

SET FOREIGN_KEY_CHECKS=0;

########################################################################################
########################################################################################

DROP TABLE IF EXISTS `test_table` CASCADE;
CREATE TABLE `test_table`
(
    record_id           INT NOT NULL AUTO_INCREMENT,
    record_value        INT,
    created_at          DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at          DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (record_id),
    UNIQUE (record_id)
) ENGINE=INNODB;
