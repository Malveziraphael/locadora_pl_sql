
--Address

CREATE SEQUENCE seq_id_raf_city START WITH 1 INCREMENT BY 1;

CREATE TABLE raf_city(
   id_raf_city_pk NUMBER DEFAULT seq_id_raf_city.NEXTVAL NOT NULL
  ,name VARCHAR2(255)
  ,CONSTRAINT pk_raf_city PRIMARY KEY(id_raf_city_pk)
);

INSERT INTO raf_city(name) VALUES('Amsterdam');
INSERT INTO raf_city(name) VALUES('Kingston');
INSERT INTO raf_city(name) VALUES('North Beach');
INSERT INTO raf_city(name) VALUES('Capitou Hill ');

CREATE SEQUENCE seq_id_raf_district START WITH 1 INCREMENT BY 1;

CREATE TABLE raf_district (
   id_raf_city_pk NUMBER DEFAULT seq_id_raf_district.NEXTVAL NOT NULL
  ,id_raf_district_fk NUMBER NOT NULL
  ,name_raf_district VARCHAR2(255)
  ,CONSTRAINT pk_raf_district PRIMARY KEY(id_raf_city_pk , id_raf_district_fk)
);

INSERT INTO raf_district(id_raf_city_fk, name) VALUES(1 ,'Brooklyn');
INSERT INTO raf_district(id_raf_city_fkk, name) VALUES(1 ,'Queens');
INSERT INTO raf_district(id_raf_city_fk, name) VALUES(1 ,'Staten Island');
INSERT INTO raf_district(id_raf_city_fk, name) VALUES(1 ,'Greenwich Village');

ALTER TABLE raf_district ADD CONSTRAINT fk_raf_city_district FOREIGN KEY(id_raf_city_pk) REFERENCES raf_city(id_raf_city_pk);



CREATE SEQUENCE seq_id_raf_street START WITH 1 INCREMENT BY 1;

CREATE TABLE raf_street(
   id_raf_street_pk NUMBER DEFAULT seq_id_raf_street.NEXTVAL NOT NULL
  ,id_raf_city_fk NUMBER NOT NULL
  ,id_raf_district_fk NUMBER NOT NULL
  ,name VARCHAR2(255)
  ,CONSTRAINT pk_raf_street PRIMARY KEY(id_raf_street_pk)
);

ALTER TABLE raf_street ADD CONSTRAINT fk_raf_city_district_street FOREIGN KEY(id_raf_city_fk , id_raf_district_fk)REFERENCES raf_district(id_raf_city_pk , id_raf_district_fk);

INSERT INTO raf_street(id_raf_city_fk, id_raf_district_fk, name) VALUES (1 ,1, 'Street Valkiria');
INSERT INTO raf_street(id_raf_city_fk, id_raf_district_fk, name) VALUES (2 ,1, 'Street Casmuro');
INSERT INTO raf_street(id_raf_city_fk, id_raf_district_fk, name) VALUES (3 ,1, 'Street Golden');
INSERT INTO raf_street(id_raf_city_fk, id_raf_district_fk, name) VALUES (4 ,1, 'Street Nightmare');
INSERT INTO raf_street(id_raf_city_fk, id_raf_district_fk, name) VALUES (1 ,1, 'Street Fisherman');
INSERT INTO raf_street(id_raf_city_fk, id_raf_district_fk, name) VALUES (2 ,1, 'Street Golden');



--End Address



--Employees

CREATE SEQUENCE seq_id_raf_employees START WITH 1 INCREMENT BY 1;

CREATE TABLE raf_employees(
   id_raf_employees_pk NUMBER DEFAULT seq_id_raf_employees.NEXTVAL NOT NULL
  ,contract_employees DATE
  ,name VARCHAR2(255) NOT NULL
  ,age NUMBER NOT NULL
  ,salary NUMBER NOT NULL
  ,id_raf_street_fk NUMBER
  ,CONSTRAINT pk_raf_employees PRIMARY KEY(id_raf_employees_pk)
);

ALTER TABLE raf_employees ADD CONSTRAINT fk_raf_address_employees FOREIGN KEY(id_raf_street_fk) REFERENCES raf_street(id_raf_street_pk);

INSERT INTO raf_employees(
   contract_employees
  ,name
  ,age
  ,salary
  ,id_raf_street_fk
)
VALUES(
   SYSDATE -90
  ,'Jean Armando Lucas'
  ,24
  ,1320
  ,6
);

INSERT INTO raf_employees(
   contract_employees
  ,name
  ,age
  ,salary
  ,id_raf_street_fk
)
VALUES(
   SYSDATE -50
  ,'David Moreira Carvalho'
  ,19
  ,1260
  ,3
);

INSERT INTO raf_employees(
   contract_employees
  ,name
  ,age
  ,salary
  ,id_raf_street_fk
)
VALUES(
   SYSDATE -50
  ,'Leticia Oliveira dos Santos'
  ,18
  ,1260
  ,1
);


SELECT * FROM raf_employees;

--End Employees



--Client

CREATE SEQUENCE seq_raf_client_id START WITH 1 INCREMENT BY 1;

CREATE TABLE raf_client(
   id_raf_client_pk NUMBER DEFAULT seq_raf_client_id.NEXTVAL NOT NULL
  ,registry_client DATE
  ,name VARCHAR2(255)
  ,age NUMBER
  ,cpf_uk NUMBER
  ,id_raf_street_fk NUMBER
  ,CONSTRAINT pk_raf_client PRIMARY KEY(id_raf_client_pk)
);

ALTER TABLE raf_client ADD CONSTRAINT fk_raf_address_client FOREIGN KEY(id_raf_street_fk) REFERENCES raf_street(id_raf_street_pk);
ALTER TABLE raf_client ADD CONSTRAINT uk_raf_cpf_client UNIQUE(cpf_raf_client_uk);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 678
  ,'Daniel Sandro Sitruz'
  ,22
  ,67666788566
  ,6
);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 322
  ,'Oliver Limeira'
  ,29
  ,57796788599
  ,2
);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 200
  ,'Julia Gomes Aline'
  ,33
  ,87456788544
  ,3
);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 45
  ,'Pedro Rafael'
  ,35
  ,97456799544
  ,1
);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 470
  ,'Otávio Gonzallo '
  ,19
  ,97356722546
  ,4
);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 10
  ,'Jhulia Martinez '
  ,17
  ,87353722546
  ,3
);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 1000
  ,'Andrey Campus '
  ,44
  ,98543722547
  ,6
);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 16
  ,'Marcus Thors '
  ,21
  ,78543722547
  ,5
);

INSERT INTO raf_client(
   registry_raf_client
  ,name
  ,age
  ,cpf_uk
  ,id_raf_street_fk
)
VALUES(
   SYSDATE - 3
  ,'Leandro Santos '
  ,24
  ,98543722547
  ,NULL
);

SELECT * FROM raf_client;


--End Client;



--Genres

CREATE SEQUENCE seq_raf_genres START WITH 1 INCREMENT BY 1;

CREATE TABLE raf_genres(
   id_raf_genres_pk NUMBER DEFAULT seq_raf_genres.NEXTVAL NOT NULL
  ,name_uk VARCHAR2(255)
  ,CONSTRAINT pk_raf_genres PRIMARY KEY(id_raf_genres_pk)
);

ALTER TABLE raf_genres ADD CONSTRAINT uk_raf_name_genres UNIQUE(name_raf_genres_uk);


INSERT INTO raf_genres(name_uk)VALUES('Action');
INSERT INTO raf_genres(name_uk)VALUES('Adventure');
INSERT INTO raf_genres(name_uk)VALUES('Art cinema');
INSERT INTO raf_genres(name_uk)VALUES('Chanchada');
INSERT INTO raf_genres(name_uk)VALUES('Comedy');
INSERT INTO raf_genres(name_uk)VALUES('Ation comedy');
INSERT INTO raf_genres(name_uk)VALUES('Horror comedy');
INSERT INTO raf_genres(name_uk)VALUES('Dramatic comedy');
INSERT INTO raf_genres(name_uk)VALUES('Romantic comedy');
INSERT INTO raf_genres(name_uk)VALUES('Dance');
INSERT INTO raf_genres(name_uk)VALUES('Documentary');
INSERT INTO raf_genres(name_uk)VALUES('Docufiction');
INSERT INTO raf_genres(name_uk)VALUES('Drama');
INSERT INTO raf_genres(name_uk)VALUES('Espionage');
INSERT INTO raf_genres(name_uk)VALUES('Western');
INSERT INTO raf_genres(name_uk)VALUES('Fantasy');
INSERT INTO raf_genres(name_uk)VALUES('Science fantasy');
INSERT INTO raf_genres(name_uk)VALUES('Science fiction');
INSERT INTO raf_genres(name_uk)VALUES('Movies with gimmicks');
INSERT INTO raf_genres(name_uk)VALUES('War movies');
INSERT INTO raf_genres(name_uk)VALUES('Mystery');
INSERT INTO raf_genres(name_uk)VALUES('Musical');
INSERT INTO raf_genres(name_uk)VALUES('Cop movie');
INSERT INTO raf_genres(name_uk)VALUES('Romance');
INSERT INTO raf_genres(name_uk)VALUES('Horror');
INSERT INTO raf_genres(name_uk)VALUES('Thriller');
INSERT INTO raf_genres(name_uk)VALUES('Animation');

SELECT * FROM raf_genres;
--End Genres


--Movies

CREATE SEQUENCE seq_raf_movies START WITH 1 INCREMENT BY 1;


CREATE TABLE raf_movies(
   id_raf_movies_pk NUMBER DEFAULT seq_raf_movies.NEXTVAL NOT NULL
  ,id_raf_genres_fk NUMBER NOT NULL
  ,id_raf_genres_others_fk NUMBER
  ,name VARCHAR2(255)
  ,age NUMBER
  ,cost NUMBER NOT NULL
  ,stock NUMBER
  ,CONSTRAINT pk_raf_movies PRIMARY KEY(id_raf_movies_pk)
);


ALTER TABLE raf_movies ADD CONSTRAINT fk_raf_genres_movies FOREIGN KEY(id_raf_genres_fk) REFERENCES raf_genres(id_raf_genres_pk);
ALTER TABLE raf_movies ADD CONSTRAINT fk_raf_genres_movies_others FOREIGN KEY(id_raf_genres_others_fk) REFERENCES raf_genres(id_raf_genres_pk);


INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(1, 20, 'John Wick 3', 2019, 34.90, 5);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(1, 16, 'Black Panther', 2018, 39.90, 3);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(2, 18, 'Back to the future', 1985, 9.90, 3);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(2, 16, 'Shrek 2', 2004, 29.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(3, NULL, 'City of Dreams' , 2001, 19.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(3, NULL, 'Hugo Cabret is invention', 2011, 9.90, 7);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(4, 9, 'Babylon river', NULL , 29.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(4, 9, 'The Erotic Cangaceiras', NULL , 29.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(5, 9, 'Bananas', 1971, 39.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(5, 6, 'Ace Ventura, Pet Detective', 1994, 29.90, 3);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(6, 18, 'Free Guy - Taking Control', 2021, 29.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(6, 16, 'Thor Love and Thunder' , 2022, 49.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(7, 9, 'Fresh', 2022, 15.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(7, NULL, 'Scream', 2022, 29.90, 5);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(8, 1, 'The Boys 1 SEASON', 2019, 49.90, 3);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(8, NULL, 'Suits', 2011, 69.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(9, NULL, 'THE PRINCESS BRIDE', 1987, 29.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(9, NULL, 'TO ALL THE BOYS I VE LOVED BEFORE ', 2018, 29.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(10, NULL, 'UNDER THE LIGHT OF FAME', 2018, 19.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(10, NULL, 'STEP SISTERS', 2016, 29.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(11, NULL, 'Navalny', 2022, 25.90, 3);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(11, 22, 'Quincy', 2018, 29.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(12, 13, 'Close-up', 2018, 23.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(12, 13, 'Ana', 1982, 10, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(13, 20, 'Honor brothers', 2022, 33, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(13, 27, 'Up - High Adventures', 2009, 29.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(14, 26, 'The English Spy', 2020, 15.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(14, 18, 'Black Widow', 2021, 39.90, 3);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(15, NULL, 'Return of the Legend', 2021, 29.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(15, 13, 'Once upon a Time in the West', 1968, 45.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(16, NULL, 'Edward Scissorhands', 1990, 19.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(16, 1, 'Harry Potter and the Prisoner of Azkaban', 2004, 49.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(17, 2, 'Strange world', 2022, 19.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(17, 1, 'Doctor Strange', 2016, 29.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(18, 25, 'Not! Do not look!', 2022, 35.99, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(18, NULL, 'Parallel worlds', 2019, 10.90, 4);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(19, NULL, '13 Ghosts',1960 ,7.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(19, NULL, 'House on Haunted Hill' ,1959 ,5.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(20, 1, 'The Hurt Locker ', 2008, 9.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(20, 1, 'Top Gun: Maverick', 2022 , 19.90, 3);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(21, 26, 'The Pale Blue Eye', 2022 , 29.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(21, 26, 'The crow', 2012, 9.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(22, 27, 'Sing 2', 2021, 15.90,1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(22, 24, 'Love sublime love', 2021, 22.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(23, 1, 'Bad Boys Forever', 2020, 52.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(23, 16, 'Bright' , 2017, 35.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(24, NULL, 'La La Land', 2016 , 9.90, 2);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(24, NULL, 'Titanic', 1997 , 49.90, 1);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(25, 18, 'ALIEN', 1979 , 8.90, 3);
INSERT INTO raf_movies(id_raf_genres_fk, id_raf_genres_others_fk, name, age, cost, stock)VALUES(25, 2, 'IT', 2017 , 18.90, 1);

SELECT * FROM raf_movies;

--End Movies



--Requests

CREATE SEQUENCE seq_raf_requests START WITH 1 INCREMENT BY 1;

CREATE TABLE raf_requests(
   id_raf_requests_pk NUMBER DEFAULT seq_raf_requests.NEXTVAL NOT NULL
  ,id_raf_movies_fk NUMBER NOT NULL
  ,date_insert DATE
  ,back_date DATE
  ,id_raf_client_fk NUMBER NOT NULL
  ,id_raf_employees_fk NUMBER NOT NULL
  ,CONSTRAINT pk_raf_requests PRIMARY KEY(id_raf_requests_pk)
);


ALTER TABLE raf_requests ADD CONSTRAINT fk_id_raf_requests_movies FOREIGN KEY(id_raf_movies_fk) REFERENCES raf_movies(id_raf_movies_pk);
ALTER TABLE raf_requests ADD CONSTRAINT fk_id_raf_requests_client FOREIGN KEY(id_raf_client_fk) REFERENCES raf_client(id_raf_client_pk);
ALTER TABLE raf_requests ADD CONSTRAINT fk_id_raf_requests_employees FOREIGN KEY(id_raf_employees_fkk) REFERENCES raf_employees(id_raf_employees_pk);


INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(5,SYSDATE -4 , null, 1, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(2,SYSDATE -3 , null, 2, 2);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(7,SYSDATE -2 , null, 1, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(1,SYSDATE -2 , null, 3, 2);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(9,SYSDATE -1 , null, 4, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(20,SYSDATE , null, 3, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(41,SYSDATE -7, null, 3, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(44,SYSDATE  -4, null, 24, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(6,SYSDATE -5, null, 2, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(7,SYSDATE -4, null, 4, 3);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(22,SYSDATE -6, null, 1, 3);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(33 ,SYSDATE -10, null, 24, 3);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(31,SYSDATE -2, null, 4, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(25,SYSDATE -4, null, 24, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(50,SYSDATE , null, 5, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(11,SYSDATE -2, null, 1, 2);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(17,SYSDATE -3, null, 4, 3);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(29,SYSDATE -2, null, 23, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(9,SYSDATE , null, 5, 2);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(14,SYSDATE -3, null, 23, 1);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(14,SYSDATE -6, null, 4, 3);
INSERT INTO raf_requests(id_raf_movies_fk, date_insert, back_date, id_raf_client_fk, id_raf_employees_fk) VALUES(15,SYSDATE, null, 4, 3);


SELECT * FROM raf_requests;




--End Requests;

