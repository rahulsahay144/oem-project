CREATE TABLE `login` (
  `uname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `user` (
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `UserId` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `DOB` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `ContactNo` varchar(45) DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `field` (
  `Areaname` varchar(45) DEFAULT NULL,
  `AreaId` varchar(45) DEFAULT NULL,
  `Areades` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `subfield` (
  `SubAreaname` varchar(45) DEFAULT NULL,
  `SubAreaId` varchar(45) DEFAULT NULL,
  `AreaId` varchar(45) DEFAULT NULL,
  `SubAreaDes` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `tech` (
  `Techname` varchar(45) DEFAULT NULL,
  `Techid` varchar(45) DEFAULT NULL,
  `SubFieldid` varchar(45) DEFAULT NULL,
  `SubFielddes` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `subtech` (
  `SubTechname` varchar(45) DEFAULT NULL,
  `SubTechid` varchar(45) DEFAULT NULL,
  `Techid` varchar(45) DEFAULT NULL,
  `Techdes` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `topics` (
  `Areaname` varchar(45) DEFAULT NULL,
  `Aid` varchar(45) DEFAULT NULL,
  `fid` varchar(45) DEFAULT NULL,
  `Sfid` varchar(45) DEFAULT NULL,
  `Tid` varchar(45) DEFAULT NULL,
  `Stid` varchar(45) DEFAULT NULL,
  `Articles` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `product` (
  `uname` varchar(45) DEFAULT NULL,
  `prid` varchar(45) DEFAULT NULL,
  `pname` varchar(45) DEFAULT NULL,
  `pprice` varchar(45) DEFAULT NULL,
  `dpurchase` varchar(45) DEFAULT NULL,
  `warrentydt` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `complaints` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) DEFAULT NULL,
  `productId` varchar(45) DEFAULT NULL,
  `datetime` varchar(45) DEFAULT NULL,
  `des` varchar(5000) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `seuserid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (cid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
