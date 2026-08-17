CREATE TABLE child(
    childID INT() PRIMARY KEY NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    dob DATE() NOT NULL,
    sex VARCHAR(1) NOT NULL,
    race VARCHAR(30),
    active TINYINT(1) DEFAULT 1,
);

create table items(
    itemsID INT() AUTO_INCREMENT PRIMARY KEY,
    childID INT() NOT NULL,
    age INT() NOT NULL,
    pants VARCHAR(12) DEFAULT "NONE",
    pantsopt VARCHAR(20) DEFAULT "NONE",
    shirt VARCHAR(12) DEFAULT "NONE",
    shirtopt VARCHAR(20) DEFAULT "NONE",
    shoes VARCHAR(12) DEFAULT "NONE",
    shoesopt VARCHAR(20) DEFAULT "NONE",
    coat VARCHAR(12) DEFAULT "NONE",
    coatopt VARCHAR(20) DEFAULT "NONE",
    suggestion VARCHAR(255) DEFAULT "NONE",
    worker INT() NOT NULL,
    adopter VARCHAR(50) DEFAULT "NONE",
    gift_name VARCHAR(20) DEFAULT "NONE",
);

create table lottery(
    ticketID INT(4) PRIMARY KEY NOT NULL,
    packet INT(4) NOT NULL,
    seller INT() NOT NULL,
    purchaser VARCHAR(30) NOT NULL
);

create table donors(
    donorID INT() PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(2),
    zip VARCHAR(5),
    contact_name VARCHAR(50),
    phone VARCHAR(30),
    phone2 VARCHAR(30),
    email VARCHAR(75),
    active TINYINT(1) DEFAULT 1,
);

create table donations(
    donationID INT() PRIMARY KEY AUTO_INCREMENT,
    donorID INT() NOT NULL,
    pickup_date DATE(),
    status VARCHAR(50),
    toydrive TINYINT(1) DEFAULT 0,
    notes VARCHAR(255),
    total_tags INT(3) DEFAULT 0,
    kid_tags_0_to_11 INT(3) DEFAULT 0,
    kid_tags_twelve_12_over INT(3) DEFAULT 0,
    total_stockings INT(3) DEFAULT 0,
    infant_boy INT (3) DEFAULT 0,
    infant_girl INT (3) DEFAULT 0,
    toddler_boy INT (3) DEFAULT 0,
    toddler_girl INT (3) DEFAULT 0,
    boy_6_to_10 INT (3) DEFAULT 0,
    boy_11_to_14 INT (3) DEFAULT 0,
    boy_15_to_18 INT (3) DEFAULT 0,
    girl_6_to_10 INT (3) DEFAULT 0,
    girl_11_to_14 INT (3) DEFAULT 0,
    girl_15_to_18 INT (3) DEFAULT 0,
    pickup_assigned_to INT(),
    active TINYINT(1) DEFAULT 1
);
