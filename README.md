```
oemdbindia.chbpmehmpc1o.ap-south-1.rds.amazonaws.com

CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1


INSERT INTO `oem`.`login`
(`idlogin`,
`uname`,
`password`,
`role`)
VALUES
(1,admin, admin,0);

```

