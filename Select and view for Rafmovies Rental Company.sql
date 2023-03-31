
--Check address synchronization
SELECT
      city.name
     ,district.name
     ,street.name
FROM raf_city city
LEFT JOIN raf_district district
  ON city.id_raf_city_pk = district.id_raf_city_pk
LEFT JOIN raf_street street
  ON district.id_raf_city_pk = street.id_raf_city_fk;

--End Check address synchronization



--Check addres Employees
SELECT * FROM raf_employees;
SELECT * FROM raf_city;
SELECT * FROM raf_district;
SELECT * FROM raf_street;

SELECT
      emp.name
     ,emp.age
     ,TRIM(To_Char(emp.salary, 'l99g999d99')) AS salary
     ,str.name AS name_street
     ,dis.name AS name_district
     ,cit.name AS name_city
FROM raf_employees emp
JOIN raf_street str
  ON emp.id_raf_street_fk = str.id_raf_street_pk
JOIN raf_district dis
  ON str.id_raf_city_fk = dis.id_raf_city_pk
JOIN raf_city cit
  ON dis.id_raf_city_pk = cit.id_raf_city_pk;
--End Check addres Employees



--Check addres Clients
SELECT * FROM raf_client;
SELECT * FROM raf_city;
SELECT * FROM raf_district;
SELECT * FROM raf_street;

SELECT
      cli.name
     ,cli.age
     ,cli.cpf_uk
     ,str.name AS name_street
     ,dis.name AS name_district
     ,cit.name AS name_city
FROM raf_client cli
JOIN raf_street str
  ON cli.id_raf_street_fk = str.id_raf_street_pk
JOIN raf_district dis
  ON str.id_raf_city_fk = dis.id_raf_city_pk
JOIN raf_city cit
  ON dis.id_raf_city_pk = cit.id_raf_city_pk
WHERE cli.age >= 24;
--End Check addres Employees



--Rented items

SELECT * FROM raf_requests;
SELECT * FROM raf_movies;
SELECT * FROM raf_genres;

CREATE OR REPLACE VIEW vw_raf_requests_movies(id_movies,name_movies,first_genres,second_genres) AS
SELECT
      req.id_raf_movies_fk AS id_movies
     ,mov.name AS name_movies
     ,gen.name_uk AS first_genres
     ,genr.name_uk AS second_genres
FROM raf_requests req
LEFT JOIN raf_movies mov
  ON req.id_raf_movies_fk = mov.id_raf_movies_pk
LEFT JOIN raf_genres gen
  ON mov.id_raf_genres_fk = gen.id_raf_genres_pk
LEFT JOIN raf_genres genr
  ON mov.id_raf_genres_others_fk = genr.id_raf_genres_pk;

SELECT * FROM vw_raf_requests_movies;

SELECT name_raf_movies FROM vw_raf_requests_movies;

--End Rented items



--Best customers
SELECT * FROM raf_client;
SELECT * FROM raf_requests;
SELECT * FROM raf_movies;

CREATE OR REPLACE VIEW vw_best_customers(name_client,amount_spent) AS
SELECT
      cli.name AS name_client
     ,TRIM(TO_CHAR(SUM(mov.cost), 'l99g999d99')) AS amount_spent
FROM raf_client cli
JOIN raf_requests req
  ON cli.id_raf_client_pk = req.id_raf_client_fk
JOIN raf_movies mov
  ON req.id_raf_movies_fk = mov.id_raf_movies_pk
GROUP BY cli.name
ORDER BY amount_spent;

SELECT * FROM vw_best_customers;

--End best customers



--Best Employees
SELECT * FROM raf_employees;
SELECT * FROM raf_requests;
SELECT * FROM raf_movies;

CREATE OR REPLACE VIEW vw_best_employees(name_employees,value_sold) AS
SELECT
      emp.name AS name_employees
     ,TRIM(TO_CHAR(SUM(mov.cost), 'l99g999d99')) AS value_sold
FROM raf_employees emp
JOIN raf_requests req
  ON emp.id_raf_employees_pk = req.id_raf_employees_fk
JOIN raf_movies mov
  ON req.id_raf_movies_fk = mov.id_raf_movies_pk
GROUP BY emp.name_raf_employees
ORDER BY value_sold;

SELECT * FROM vw_best_employees;
--End best employees;



--Bigger age
SELECT * FROM raf_client;

CREATE OR REPLACE VIEW vw_bigger_age(name_client,age_client) AS
SELECT
      name AS name_client
     ,age AS age_client
FROM raf_client
WHERE age >= 18;

SELECT * FROM vw_bigger_age;
--End bigger age



--Arrival and late

CREATE SEQUENCE seq_raf_arrival START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE TABLE raf_arrival(
   id_raf_arrival_pk NUMBER DEFAULT seq_raf_arrival.NEXTVAL NOT NULL
  ,id_raf_client_fk NUMBER
  ,id_raf_movies_fk NUMBER
  ,date_update DATE
  ,CONSTRAINT pk_raf_arrival PRIMARY KEY(id_raf_arrival_pk)
);

SELECT * FROM raf_arrival;

ALTER TABLE raf_arrival ADD CONSTRAINT fk_raf_arrival_client FOREIGN KEY(id_raf_client_fk) REFERENCES raf_client(id_raf_client_pk);
ALTER TABLE raf_arrival ADD CONSTRAINT fk_raf_arrival_movies FOREIGN KEY(id_raf_movies_fk) REFERENCES raf_movies(id_raf_movies_pk);

INSERT INTO raf_arrival(id_raf_client_fk,id_raf_movies_fk,delivery)VALUES(1, 5, SYSDATE);

--End arrival and late



--Merge with Update

SELECT * FROM raf_requests;
SELECT * FROM raf_client;
SELECT * FROM raf_movies;
SELECT * FROM raf_arrival;

MERGE INTO raf_arrival arr
USING(
     SELECT id_raf_requests_pk,id_raf_client_fk, id_raf_movies_fk
     FROM raf_requests
)req
ON (arr.id_raf_arrival_pk = req.id_raf_requests_pk)
WHEN MATCHED THEN --Find
    UPDATE SET delivery_raf_arrival = NULL
WHEN NOT MATCHED THEN --not find
    INSERT(id_raf_client_fk, id_raf_movies_fk, date_update)VALUES(req.id_raf_requests_client_fk, req.id_raf_requests_movies_fk,SYSDATE);

--End Merge with Update



