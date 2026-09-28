SET FOREIGN_KEY_CHECKS = 0;

DROP SCHEMA IF EXISTS `christmas`;
 
CREATE SCHEMA IF NOT EXISTS `christmas` CHARACTER SET utf8;
 
USE `christmas`;
 
DROP TABLE IF EXISTS `christmas`.`donors`;
CREATE TABLE IF NOT EXISTS `christmas`.`donors`(
	`donorID` INT NOT NULL AUTO_INCREMENT,
    `donor_name` VARCHAR(110) NOT NULL,
	`address1` VARCHAR(70) NOT NULL,
    `address2` VARCHAR(50) DEFAULT NULL,
    `city` VARCHAR(30) NOT NULL,
    `state` VARCHAR(2) NOT NULL,
    `zip`  VARCHAR(10) NOT NULL,
    `pick_date` DATETIME DEFAULT NULL,
	`pick_assigned_to` VARCHAR(70) DEFAULT NULL,
	`pick_det` VARCHAR(70) DEFAULT NULL,
	`kids_tag` INT DEFAULT 0,
	`age0_11` INT DEFAULT 0,
	`age12abv` INT DEFAULT 0,
	`gift_tag` INT DEFAULT 0,
	`inf_boy` INT DEFAULT 0,
	`inf_girl` INT DEFAULT 0,
	`tod_boy` INT DEFAULT 0,
	`tod_girl` INT DEFAULT 0,
	`age6_10b` INT DEFAULT 0,
	`age6_10g` INT DEFAULT 0,
	`age11_14b` INT DEFAULT 0,
	`age11_14g` INT DEFAULT 0,
	`age15_18b` INT DEFAULT 0,
	`age15_18g` INT DEFAULT 0,
	`toy_dr` TINYINT(1) DEFAULT 0,
	`instruction` VARCHAR(254) DEFAULT "",
	`active` TINYINT(1) DEFAULT 1,
    PRIMARY KEY(`donorID`)
)ENGINE = InnoDB;
 
DROP TABLE IF EXISTS `christmas`.`donor_contacts`;
CREATE TABLE IF NOT EXISTS `christmas`.`donor_contacts`(  
`contactID` INT NOT NULL AUTO_INCREMENT,
`donorID` INT NOT NULL,
`contact_name` VARCHAR(70) NOT NULL,
`contact_phone` VARCHAR(12) NOT NULL,
`email` VARCHAR(70) DEFAULT NULL,
`alternate_phone` VARCHAR(12) DEFAULT NULL,
`fax` VARCHAR(12) DEFAULT NULL,
PRIMARY KEY(`contactID`),
INDEX `donorID` (`donorID`),
CONSTRAINT fk_contact_donors
	FOREIGN KEY (`donorID`) REFERENCES `christmas`.`donors`(`donorID`)
)ENGINE = InnoDB;
 

 
DROP TABLE IF EXISTS `christmas`.`lottery`;
CREATE TABLE IF NOT EXISTS `christmas`.`lottery`(
	`ticketID` VARCHAR(3) NOT NULL,
    `packetID` INT NOT NULL,
    `sold_by` VARCHAR(70) DEFAULT "",
    `purchased_by` VARCHAR(70) DEFAULT "",
    PRIMARY KEY(`ticketID`)
)ENGINE = InnoDB;


INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('000', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('001', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('002', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('003', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('004', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('005', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('006', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('007', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('008', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('009', 1, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('010', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('011', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('012', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('013', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('014', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('015', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('016', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('017', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('018', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('019', 2, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('020', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('021', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('022', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('023', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('024', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('025', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('026', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('027', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('028', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('029', 3, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('030', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('031', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('032', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('033', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('034', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('035', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('036', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('037', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('038', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('039', 4, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('040', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('041', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('042', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('043', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('044', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('045', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('046', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('047', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('048', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('049', 5, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('050', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('051', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('052', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('053', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('054', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('055', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('056', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('057', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('058', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('059', 6, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('060', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('061', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('062', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('063', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('064', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('065', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('066', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('067', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('068', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('069', 7, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('070', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('071', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('072', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('073', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('074', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('075', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('076', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('077', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('078', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('079', 8, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('080', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('081', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('082', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('083', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('084', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('085', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('086', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('087', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('088', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('089', 9, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('090', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('091', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('092', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('093', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('094', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('095', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('096', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('097', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('098', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('099', 10, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('100', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('101', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('102', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('103', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('104', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('105', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('106', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('107', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('108', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('109', 11, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('110', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('111', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('112', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('113', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('114', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('115', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('116', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('117', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('118', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('119', 12, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('120', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('121', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('122', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('123', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('124', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('125', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('126', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('127', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('128', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('129', 13, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('130', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('131', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('132', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('133', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('134', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('135', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('136', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('137', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('138', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('139', 14, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('140', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('141', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('142', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('143', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('144', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('145', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('146', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('147', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('148', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('149', 15, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('150', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('151', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('152', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('153', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('154', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('155', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('156', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('157', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('158', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('159', 16, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('160', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('161', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('162', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('163', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('164', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('165', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('166', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('167', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('168', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('169', 17, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('170', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('171', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('172', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('173', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('174', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('175', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('176', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('177', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('178', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('179', 18, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('180', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('181', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('182', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('183', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('184', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('185', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('186', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('187', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('188', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('189', 19, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('190', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('191', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('192', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('193', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('194', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('195', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('196', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('197', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('198', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('199', 20, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('200', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('201', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('202', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('203', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('204', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('205', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('206', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('207', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('208', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('209', 21, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('210', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('211', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('212', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('213', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('214', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('215', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('216', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('217', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('218', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('219', 22, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('220', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('221', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('222', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('223', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('224', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('225', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('226', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('227', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('228', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('229', 23, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('230', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('231', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('232', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('233', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('234', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('235', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('236', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('237', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('238', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('239', 24, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('240', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('241', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('242', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('243', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('244', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('245', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('246', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('247', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('248', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('249', 25, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('250', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('251', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('252', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('253', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('254', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('255', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('256', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('257', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('258', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('259', 26, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('260', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('261', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('262', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('263', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('264', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('265', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('266', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('267', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('268', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('269', 27, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('270', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('271', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('272', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('273', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('274', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('275', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('276', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('277', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('278', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('279', 28, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('280', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('281', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('282', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('283', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('284', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('285', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('286', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('287', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('288', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('289', 29, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('290', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('291', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('292', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('293', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('294', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('295', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('296', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('297', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('298', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('299', 30, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('300', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('301', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('302', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('303', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('304', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('305', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('306', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('307', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('308', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('309', 31, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('310', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('311', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('312', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('313', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('314', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('315', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('316', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('317', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('318', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('319', 32, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('320', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('321', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('322', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('323', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('324', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('325', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('326', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('327', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('328', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('329', 33, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('330', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('331', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('332', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('333', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('334', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('335', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('336', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('337', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('338', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('339', 34, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('340', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('341', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('342', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('343', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('344', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('345', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('346', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('347', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('348', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('349', 35, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('350', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('351', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('352', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('353', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('354', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('355', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('356', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('357', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('358', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('359', 36, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('360', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('361', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('362', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('363', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('364', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('365', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('366', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('367', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('368', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('369', 37, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('370', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('371', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('372', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('373', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('374', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('375', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('376', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('377', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('378', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('379', 38, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('380', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('381', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('382', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('383', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('384', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('385', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('386', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('387', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('388', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('389', 39, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('390', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('391', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('392', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('393', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('394', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('395', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('396', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('397', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('398', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('399', 40, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('400', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('401', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('402', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('403', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('404', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('405', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('406', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('407', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('408', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('409', 41, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('410', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('411', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('412', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('413', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('414', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('415', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('416', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('417', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('418', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('419', 42, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('420', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('421', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('422', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('423', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('424', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('425', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('426', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('427', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('428', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('429', 43, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('430', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('431', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('432', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('433', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('434', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('435', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('436', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('437', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('438', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('439', 44, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('440', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('441', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('442', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('443', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('444', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('445', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('446', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('447', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('448', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('449', 45, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('450', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('451', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('452', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('453', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('454', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('455', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('456', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('457', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('458', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('459', 46, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('460', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('461', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('462', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('463', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('464', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('465', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('466', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('467', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('468', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('469', 47, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('470', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('471', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('472', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('473', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('474', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('475', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('476', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('477', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('478', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('479', 48, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('480', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('481', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('482', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('483', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('484', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('485', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('486', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('487', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('488', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('489', 49, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('490', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('491', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('492', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('493', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('494', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('495', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('496', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('497', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('498', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('499', 50, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('500', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('501', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('502', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('503', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('504', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('505', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('506', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('507', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('508', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('509', 51, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('510', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('511', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('512', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('513', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('514', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('515', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('516', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('517', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('518', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('519', 52, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('520', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('521', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('522', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('523', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('524', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('525', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('526', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('527', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('528', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('529', 53, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('530', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('531', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('532', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('533', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('534', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('535', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('536', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('537', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('538', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('539', 54, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('540', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('541', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('542', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('543', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('544', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('545', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('546', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('547', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('548', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('549', 55, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('550', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('551', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('552', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('553', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('554', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('555', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('556', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('557', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('558', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('559', 56, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('560', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('561', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('562', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('563', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('564', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('565', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('566', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('567', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('568', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('569', 57, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('570', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('571', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('572', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('573', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('574', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('575', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('576', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('577', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('578', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('579', 58, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('580', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('581', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('582', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('583', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('584', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('585', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('586', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('587', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('588', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('589', 59, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('590', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('591', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('592', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('593', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('594', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('595', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('596', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('597', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('598', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('599', 60, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('600', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('601', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('602', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('603', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('604', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('605', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('606', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('607', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('608', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('609', 61, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('610', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('611', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('612', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('613', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('614', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('615', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('616', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('617', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('618', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('619', 62, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('620', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('621', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('622', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('623', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('624', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('625', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('626', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('627', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('628', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('629', 63, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('630', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('631', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('632', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('633', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('634', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('635', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('636', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('637', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('638', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('639', 64, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('640', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('641', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('642', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('643', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('644', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('645', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('646', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('647', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('648', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('649', 65, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('650', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('651', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('652', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('653', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('654', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('655', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('656', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('657', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('658', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('659', 66, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('660', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('661', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('662', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('663', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('664', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('665', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('666', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('667', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('668', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('669', 67, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('670', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('671', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('672', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('673', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('674', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('675', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('676', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('677', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('678', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('679', 68, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('680', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('681', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('682', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('683', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('684', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('685', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('686', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('687', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('688', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('689', 69, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('690', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('691', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('692', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('693', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('694', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('695', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('696', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('697', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('698', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('699', 70, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('700', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('701', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('702', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('703', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('704', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('705', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('706', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('707', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('708', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('709', 71, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('710', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('711', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('712', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('713', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('714', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('715', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('716', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('717', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('718', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('719', 72, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('720', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('721', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('722', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('723', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('724', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('725', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('726', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('727', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('728', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('729', 73, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('730', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('731', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('732', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('733', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('734', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('735', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('736', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('737', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('738', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('739', 74, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('740', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('741', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('742', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('743', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('744', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('745', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('746', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('747', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('748', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('749', 75, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('750', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('751', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('752', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('753', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('754', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('755', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('756', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('757', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('758', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('759', 76, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('760', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('761', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('762', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('763', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('764', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('765', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('766', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('767', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('768', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('769', 77, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('770', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('771', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('772', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('773', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('774', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('775', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('776', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('777', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('778', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('779', 78, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('780', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('781', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('782', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('783', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('784', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('785', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('786', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('787', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('788', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('789', 79, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('790', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('791', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('792', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('793', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('794', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('795', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('796', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('797', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('798', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('799', 80, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('800', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('801', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('802', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('803', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('804', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('805', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('806', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('807', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('808', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('809', 81, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('810', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('811', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('812', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('813', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('814', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('815', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('816', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('817', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('818', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('819', 82, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('820', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('821', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('822', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('823', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('824', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('825', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('826', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('827', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('828', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('829', 83, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('830', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('831', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('832', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('833', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('834', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('835', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('836', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('837', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('838', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('839', 84, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('840', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('841', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('842', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('843', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('844', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('845', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('846', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('847', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('848', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('849', 85, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('850', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('851', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('852', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('853', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('854', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('855', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('856', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('857', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('858', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('859', 86, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('860', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('861', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('862', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('863', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('864', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('865', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('866', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('867', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('868', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('869', 87, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('870', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('871', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('872', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('873', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('874', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('875', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('876', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('877', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('878', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('879', 88, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('880', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('881', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('882', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('883', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('884', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('885', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('886', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('887', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('888', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('889', 89, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('890', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('891', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('892', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('893', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('894', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('895', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('896', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('897', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('898', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('899', 90, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('900', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('901', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('902', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('903', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('904', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('905', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('906', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('907', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('908', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('909', 91, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('910', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('911', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('912', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('913', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('914', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('915', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('916', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('917', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('918', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('919', 92, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('920', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('921', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('922', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('923', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('924', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('925', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('926', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('927', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('928', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('929', 93, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('930', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('931', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('932', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('933', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('934', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('935', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('936', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('937', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('938', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('939', 94, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('940', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('941', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('942', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('943', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('944', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('945', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('946', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('947', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('948', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('949', 95, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('950', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('951', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('952', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('953', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('954', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('955', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('956', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('957', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('958', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('959', 96, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('960', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('961', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('962', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('963', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('964', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('965', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('966', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('967', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('968', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('969', 97, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('970', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('971', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('972', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('973', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('974', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('975', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('976', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('977', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('978', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('979', 98, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('980', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('981', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('982', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('983', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('984', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('985', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('986', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('987', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('988', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('989', 99, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('990', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('991', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('992', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('993', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('994', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('995', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('996', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('997', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('998', 100, '', '');
INSERT INTO christmas.lottery (ticketID, packetID, sold_by, purchased_by) VALUES ('999', 100, '', '');


DROP TABLE IF EXISTS `christmas`.`race`;
CREATE TABLE IF NOT EXISTS `christmas`.`race`(
	`race` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`race`)
    ) ENGINE = InnoDB;
    
INSERT INTO `christmas`.`race` (`race`) VALUES
(""),
("AFRICAN AMERICAN"),
("BI-RACIAL"),
("CAUCASIAN"),
("HISPANIC/LATINO");



DROP TABLE IF EXISTS `christmas`.`gift_card_types`;

CREATE TABLE IF NOT EXISTS `christmas`.`gift_card_types`(
	`gift_card` VARCHAR(20) NOT NULL,
	PRIMARY KEY(`gift_card`)
) Engine = InnoDB;

INSERT INTO `christmas`.`gift_card_types` (`gift_card`) VALUES
(""),
("AMAZON"),
("TARGET"),
("WALMART");

DROP TABLE IF EXISTS `christmas`.`clothing_types`;

CREATE TABLE IF NOT EXISTS `christmas`.`clothing_types`(
	`typeID` INT NOT NULL AUTO_INCREMENT,
	`clothing_type` VARCHAR(20) NOT NULL,
	PRIMARY KEY(`typeID`)
) ENGINE=InnoDB;

INSERT INTO `christmas`.`clothing_types` (`clothing_type`) VALUES
("Infant"),
("Toddler"),
("Little Kids"),
("Big Kids"),
("Jr Girl"),
("Women"),
("Women Plus"),
("Men");

DROP TABLE IF EXISTS `christmas`.`clothing_sizes`;

CREATE TABLE IF NOT EXISTS `christmas`.`clothing_sizes`(
	`sizeID` INT NOT NULL AUTO_INCREMENT,
	`typeID` INT NOT NULL,
	`size`   VARCHAR(20) NOT NULL,
	PRIMARY KEY `sizeID` (`sizeID`),
	INDEX `typeID` (`typeID`),
	CONSTRAINT fk_size_types
		FOREIGN KEY (`typeID`) REFERENCES `christmas`.`clothing_types` (`typeID`)
) ENGINE = InnoDB;

INSERT INTO `christmas`.`clothing_sizes` (`typeID`, `size`) VALUES 
(1, "NB"),
(1, "0/3M"),
(1, "3/6M"),
(1, "6/9M"),
(1, "9/12M"),
(1, "12/18M"),
(1, "18/24M"),
(2, "2T"),
(2, "3T"),
(2, "4T"),
(2, "5T"),
(2, "6T"),
(3, "4"),
(3, "5"),
(3, "6"),
(3, "6x"),
(3, "7"),
(4, "7/8"),
(4, "10"),
(4, "12"),
(4, "14"),
(4, "16"),
(4, "18/20"),
(5, "XS/0-1"),
(5, "S/3-5"),
(5, "M/7-9"),
(5, "L/11-13"),
(5, "XL/15-17"),
(6, "XS/0-2"),
(6, "S/4-6"),
(6, "M/8-10"),
(6, "L/12-14"),
(6, "XL/16-18"),
(6, "XXL/20"),
(7, "1X/14-16W"),
(7, "2X/18-20W"),
(7, "3X/22-24W"),
(8, "S"),
(8, "M"),
(8, "L"),
(8, "XL"),
(8, "2X"),
(8, "3X");


DROP TABLE IF EXISTS `christmas`.`child`;
 
CREATE TABLE IF NOT EXISTS `christmas`.`child`(
	`childID` INT NOT NULL AUTO_INCREMENT,
    `f_name` VARCHAR(70) NOT NULL,
    `l_name` VARCHAR(70) NOT NULL,
	`sacwisID` VARCHAR(11) DEFAULT '',
    `age` INT NOT NULL,
	`gender` VARCHAR(6) DEFAULT '',
	`race` VARCHAR(20) DEFAULT '',
	`clothing_type` INT DEFAULT NULL,
    `size` VARCHAR(11) DEFAULT NULL,
    `shoe_size` VARCHAR(11) DEFAULT NULL,
    `gift_card` VARCHAR(20) DEFAULT NULL,
	`workerID` INT DEFAULT NULL,
	`donorID` INT DEFAULT NULL,
    `suggestion` VARCHAR(254) DEFAULT "" ,
	PRIMARY KEY(`childID`),
	CONSTRAINT fk_child_gift_card_types
	   FOREIGN KEY (`gift_card`) REFERENCES `christmas`.`gift_card_types` (`gift_card`),
	CONSTRAINT fk_clild_race
		FOREIGN KEY(`race`) REFERENCES `christmas`.`race`(`race`)
) ENGINE = InnoDB;

SET FOREIGN_KEY_CHECKS = 1;