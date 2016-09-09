INSERT INTO `cupcakeshop`.`user` (`username`, `password`, `balance`) VALUES ('Christian', 'Olsen', '1000');
INSERT INTO `cupcakeshop`.`user` (`username`, `password`, `balance`) VALUES ('Bjørn', 'Kristiansen', '1001');

INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Chocolate', '5');
INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Vanilla', '5');
INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Nutmeg', '5');
INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Pistacio', '6');
INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Almond', '7');

INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Chocolate', '5');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Blueberry', '5');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Raspberry', '5');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Crispy', '6');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Strawberry', '6');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Rum/Raisin', '7');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Orange', '8');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Lemon', '8');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Blue cheese', '9');

INSERT INTO `cupcakeshop`.`cupcake` (`cupcakeName`, `idTopping`, `idBottom`) VALUES ('ChoccoNut', '3', '1');
