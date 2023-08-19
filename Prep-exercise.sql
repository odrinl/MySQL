CREATE TABLE categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE ingredients (
    IngredientID INT PRIMARY KEY AUTO_INCREMENT,
    IngredientName VARCHAR(255) NOT NULL
);

CREATE TABLE recipeingredients (
    RecipeID INT,
    IngredientID INT,
    PRIMARY KEY (RecipeID, IngredientID),
    FOREIGN KEY (RecipeID) REFERENCES recipes (RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES ingredients (IngredientID)
);

CREATE TABLE recipes (
    RecipeID INT PRIMARY KEY AUTO_INCREMENT,
    RecipeName VARCHAR(255) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES categories (CategoryID)
);

CREATE TABLE recipesteps (
    RecipeID INT,
    StepID INT,
    StepOrder INT,
    PRIMARY KEY (RecipeID, StepID),
    FOREIGN KEY (RecipeID) REFERENCES recipes (RecipeID),
    FOREIGN KEY (StepID) REFERENCES steps (StepID)
);

CREATE TABLE steps (
    StepID INT PRIMARY KEY AUTO_INCREMENT,
    StepDescription TEXT NOT NULL
);
