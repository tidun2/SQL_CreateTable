CREATE DATABASE FOOD_DB;
USE FOOD_DB;
-- user info
CREATE TABLE Users(
    ID INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    pass VARCHAR(50) NOT NULL,
    type_login VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE States(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state_name VARCHAR(50) NOT NULL
);
CREATE TABLE Cities(
    ID INT NOT NULL AUTO_INCREMENT,
    City_Name VARCHAR(50) NOT NULL,
    id_State INT,
    PRIMARY KEY(ID),
    FOREIGN KEY (id_State) REFERENCES States(ID)
);
CREATE TABLE Countries(
    ID INT NOT NULL AUTO_INCREMENT,
    Country_Name VARCHAR(255) NOT NULL,
    id_city INT,
    PRIMARY KEY(ID),
    FOREIGN KEY (id_city) REFERENCES Cities(ID)
);
CREATE TABLE DetailUsers(
    id_user INT,
    id_state INT NOT NULL,
    id_city INT NOT NULL,
    id_country INT NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    phone_number TINYINT,
    email VARCHAR(50),
    FOREIGN KEY (id_user) REFERENCES Users(ID),
    FOREIGN KEY (id_state) REFERENCES States(ID),
    FOREIGN KEY (id_city) REFERENCES Cities(ID),
    FOREIGN KEY (id_country) REFERENCES Countries(ID)
);
-- End of user info

-- Restaurant
CREATE TABLE Restaurants(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(255) NOT NULL,
    url_image VARCHAR(255),
    res_address VARCHAR(255)
);
CREATE TABLE Categories(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    url_image VARCHAR(255)
);
CREATE TABLE Reviews(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    id_restaurant INT,
    comments VARCHAR(255),
    rating TINYINT,
    FOREIGN KEY (id_user) REFERENCES Users(ID),
    FOREIGN KEY (id_restaurant) REFERENCES Restaurants(ID)
);
CREATE TABLE Promo(
    ID INT NOT NULL AUTO_INCREMENT,
    detail VARCHAR(50) NOT NULL,
    discount VARCHAR(255),
    expired_date DATETIME,
    PRIMARY KEY (ID)
);

-- End of Restaurant

-- Menu
CREATE TABLE Menu(
    ID INT NOT NULL AUTO_INCREMENT,
    id_category INT,
    id_promo INT,
    id_restaurant INT,
    url_image VARCHAR(255),
    menu_name VARCHAR(255) NOT NULL,
    rating TINYINT,
    price INT NOT NULL,
    describes VARCHAR(255),
    PRIMARY KEY (ID),
    FOREIGN KEY (id_promo) REFERENCES Promo(ID),
    FOREIGN KEY (id_category) REFERENCES Categories(ID),
    FOREIGN KEY (id_restaurant) REFERENCES Restaurants(ID)
);
CREATE TABLE SubMenu(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    submenu_name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    id_restaurant INT,
    FOREIGN KEY (id_restaurant) REFERENCES Restaurants(ID)
);

CREATE TABLE MenuDetails(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_menu INT NOT NULL,
    id_submenu INT NOT NULL,
    FOREIGN KEY (id_menu) REFERENCES Menu(ID),
    FOREIGN KEY (id_submenu) REFERENCES SubMenu(ID)
);

-- End of Menu
-- Order
CREATE TABLE StTus(
    ID INT NOT NULL AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE Orders(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    id_status INT NOT NULL,
    id_user INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES Users(ID),
    FOREIGN KEY (id_status) REFERENCES StTus(ID)
);

CREATE TABLE OrderDetails(
    id_order INT NOT NULL,
    id_menu INT NOT NULL,
    id_status INT NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL,
    FOREIGN KEY (id_order) REFERENCES Orders(ID),
    FOREIGN KEY (id_menu) REFERENCES Menu(ID),
    FOREIGN KEY (id_status) REFERENCES StTus(ID)
);
-- End of Order