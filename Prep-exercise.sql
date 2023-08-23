CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `IngredientName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `recipe_categories` (
  `RecipeID` int NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`RecipeID`,`CategoryID`),
  CONSTRAINT `recipe_categories_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `recipes` (`id`),
  CONSTRAINT `recipe_categories_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`id`)
);

CREATE TABLE `recipe_ingredients` (
  `RecipeID` int NOT NULL,
  `IngredientID` int NOT NULL,
  `QuantityValue` float DEFAULT NULL,
  `UnitName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RecipeID`,`IngredientID`),
  CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `recipes` (`id`),
  CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`IngredientID`) REFERENCES `ingredients` (`id`)
);

CREATE TABLE `recipe_steps` (
  `RecipeID` int NOT NULL,
  `StepID` int NOT NULL,
  `StepOrder` int DEFAULT NULL,
  PRIMARY KEY (`RecipeID`,`StepID`),
  CONSTRAINT `recipe_steps_ibfk_1` FOREIGN KEY (`RecipeID`) REFERENCES `recipes` (`id`),
  CONSTRAINT `recipe_steps_ibfk_2` FOREIGN KEY (`StepID`) REFERENCES `steps` (`StepID`)
);

CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `RecipeName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `steps` (
  `StepID` int NOT NULL AUTO_INCREMENT,
  `StepDescription` text NOT NULL,
  PRIMARY KEY (`StepID`)
);
