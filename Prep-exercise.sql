CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`CategoryID`)
);

CREATE TABLE `ingredients` (
  `IngredientID` int NOT NULL AUTO_INCREMENT,
  `IngredientName` varchar(255) NOT NULL,
  PRIMARY KEY (`IngredientID`)
);

CREATE TABLE `quantities` (
  `QuantityID` int NOT NULL AUTO_INCREMENT,
  `QuantityValue` float DEFAULT NULL,
  PRIMARY KEY (`QuantityID`)
);

CREATE TABLE `recipecategories` (
  `RecipeID` int NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`RecipeID`,`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `recipecategories_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `recipes` (`RecipeID`),
  CONSTRAINT `recipecategories_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`)
);

CREATE TABLE `recipeingredients` (
  `RecipeID` int NOT NULL,
  `IngredientID` int NOT NULL,
  `QuantityID` int DEFAULT NULL,
  `UnitID` int DEFAULT NULL,
  PRIMARY KEY (`RecipeID`,`IngredientID`),
  KEY `IngredientID` (`IngredientID`),
  KEY `recipeingredients_FK` (`QuantityID`),
  KEY `recipeingredients_FK_1` (`UnitID`),
  CONSTRAINT `recipeingredients_FK` FOREIGN KEY (`QuantityID`) REFERENCES `quantities` (`QuantityID`),
  CONSTRAINT `recipeingredients_FK_1` FOREIGN KEY (`UnitID`) REFERENCES `units` (`UnitID`),
  CONSTRAINT `recipeingredients_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `recipes` (`RecipeID`),
  CONSTRAINT `recipeingredients_ibfk_2` FOREIGN KEY (`IngredientID`) REFERENCES `ingredients` (`IngredientID`)
);

CREATE TABLE `recipes` (
  `RecipeID` int NOT NULL AUTO_INCREMENT,
  `RecipeName` varchar(255) NOT NULL,
  PRIMARY KEY (`RecipeID`)
);

CREATE TABLE `recipesteps` (
  `RecipeID` int NOT NULL,
  `StepID` int NOT NULL,
  `StepOrder` int DEFAULT NULL,
  PRIMARY KEY (`RecipeID`,`StepID`),
  KEY `StepID` (`StepID`),
  CONSTRAINT `recipesteps_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `recipes` (`RecipeID`),
  CONSTRAINT `recipesteps_ibfk_2` FOREIGN KEY (`StepID`) REFERENCES `steps` (`StepID`)
);

CREATE TABLE `steps` (
  `StepID` int NOT NULL AUTO_INCREMENT,
  `StepDescription` text NOT NULL,
  PRIMARY KEY (`StepID`)
);

CREATE TABLE `units` (
  `UnitID` int NOT NULL AUTO_INCREMENT,
  `UnitName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UnitID`)
);   
