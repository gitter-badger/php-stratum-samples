/*================================================================================*/
/* DDL SCRIPT                                                                     */
/*================================================================================*/
/*  Title    :                                                                    */
/*  FileName : stratum-example01.ecm                                              */
/*  Platform : MySQL 5                                                            */
/*  Version  : Concept                                                            */
/*  Date     : zaterdag 21 februari 2015                                          */
/*================================================================================*/
/*================================================================================*/
/* CREATE TABLES                                                                  */
/*================================================================================*/

CREATE TABLE `BAR_USER_STATUS` (
  `ust_id` TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
  `ust_description` VARCHAR(40) NOT NULL,
  `ust_label` VARCHAR(20) CHARACTER SET ascii,
  CONSTRAINT `PK_BAR_USER_STATUS` PRIMARY KEY (`ust_id`)
);

CREATE TABLE `BAR_USER` (
  `usr_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
  `ust_id` TINYINT UNSIGNED NOT NULL,
  `usr_name` VARCHAR(20),
  `usr_password_hash` VARCHAR(60),
  `usr_email` VARCHAR(80),
  CONSTRAINT `PK_BAR_USER` PRIMARY KEY (`usr_id`)
);

/*================================================================================*/
/* CREATE INDEXES                                                                 */
/*================================================================================*/

CREATE UNIQUE INDEX `IX_BAR_USER1` ON `BAR_USER` (`usr_name`);

/*================================================================================*/
/* CREATE FOREIGN KEYS                                                            */
/*================================================================================*/

ALTER TABLE `BAR_USER`
  ADD CONSTRAINT `FK_BAR_USER_BAR_USER_STATUS`
  FOREIGN KEY (`ust_id`) REFERENCES `BAR_USER_STATUS` (`ust_id`);
