CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE Recipes (
    RecipeID INT PRIMARY KEY AUTO_INCREMENT,
    RecipeName VARCHAR(255) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES categories (CategoryID)
);

CREATE TABLE RecipeCategories (
    RecipeID INT,
    CategoryID INT,
    PRIMARY KEY (RecipeID, CategoryID),
    FOREIGN KEY (RecipeID) REFERENCES recipes (RecipeID),
    FOREIGN KEY (CategoryID) REFERENCES categories (CategoryID)
);

CREATE TABLE Ingredients (
    IngredientID INT PRIMARY KEY AUTO_INCREMENT,
    IngredientName VARCHAR(255) NOT NULL
);

CREATE TABLE RecipeIngredients (
    RecipeID INT,
    IngredientID INT,
    PRIMARY KEY (RecipeID, IngredientID),
    FOREIGN KEY (RecipeID) REFERENCES recipes (RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES ingredients (IngredientID)
);

CREATE TABLE RecipeSteps (
    RecipeID INT,
    StepID INT,
    StepOrder INT,
    PRIMARY KEY (RecipeID, StepID),
    FOREIGN KEY (RecipeID) REFERENCES recipes (RecipeID),
    FOREIGN KEY (StepID) REFERENCES steps (StepID)
);

CREATE TABLE Steps (
    StepID INT PRIMARY KEY AUTO_INCREMENT,
    StepDescription TEXT NOT NULL
);
