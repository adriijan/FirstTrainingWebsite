CREATE DATABASE mujweb COLLATE utf8_czech_ci;

CREATE Table stranka (
	id VARCHAR(100) PRIMARY KEY,
	titulek TEXT,
	menu TEXT,
	obsah TEXT,
	poradi INT
);

INSERT INTO stranka set 
	id = "uvod",
	titulek = "Homepage",
	menu = "Home",
	obsah = "...",
	poradi = 1;

INSERT INTO stranka set 
	id = "omne",
	titulek = "About me",
	menu = "About me",
	obsah = "...",
	poradi = 2;

UPDATE stranka SET menu = "About&nbspme" WHERE id = "omne";
	
INSERT INTO stranka set 
	id = "galerie",
	titulek = "Gallery",
	menu = "Gallery",
	obsah = "...",
	poradi = 3;

INSERT INTO stranka set 
	id = "blog",
	titulek = "Blog",
	menu = "Blog",
	obsah = "...",
	poradi = 4;

INSERT INTO stranka set 
	id = "reference",
	titulek = "Reference",
	menu = "Reference",
	obsah = "...",
	poradi = 5;

INSERT INTO stranka set 
	id = "kontakt",
	titulek = "Contact",
	menu = "Contact",
	obsah = "...",
	poradi = 6;

INSERT INTO stranka set 
	id = "404",
	titulek = "Page Not Found",
	menu = "",
	obsah = "...",
	poradi = 7;

-- testovací stránka
INSERT INTO stranka set 
	id = "test",
	titulek = "Testovací stránka",
	menu = "Test",
	obsah = "...",
	poradi = 8;