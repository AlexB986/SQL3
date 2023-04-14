create TABLE city
(
    city_id   BIGSERIAL   NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);
create TABLE emplovee
(
    id          BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    gender      VARCHAR(6)  NOT NULL,
    age         INT         NOT NULL

);
INSERT INTO city(city_name)
VALUES ('Varchawa');
INSERT INTO city(city_name)
VALUES ('Vena');
INSERT INTO city(city_name)
VALUES ('Barnaul');
INSERT INTO city(city_name)
VALUES ('Kirov');

INSERT INTO emplovee(first_name, last_name, gender, age)
VALUES ('Alex', 'Morph', 'm', 30);
INSERT INTO emplovee(first_name, last_name, gender, age)
VALUES ('Lisa', 'Simpson', 'w', 29);
INSERT INTO emplovee(first_name, last_name, gender, age)
VALUES ('Eric', 'Cartman', 'm', 11);
INSERT INTO emplovee(first_name, last_name, gender, age)
VALUES ('Tiest', 'Fiesto', 'm', 25);
INSERT INTO emplovee(first_name, last_name, gender, age)
VALUES ('Anna', 'Smith', 'w', 50);

ALTER TABLE emplovee  ADD employee_id INT  NULL ;

ALTER TABLE emplovee  ADD FOREIGN KEY (employee_id)REFERENCES city(city_id);

UPDATE  emplovee SET employee_id = 1 WHERE id =1;
UPDATE  emplovee SET employee_id = 2 WHERE id =2;
UPDATE  emplovee SET employee_id = 3 WHERE id =3;
UPDATE  emplovee SET employee_id = 2 WHERE id =4;

SELECT emplovee.first_name,emplovee.last_name, city.city_name
FROM emplovee
         JOIN  city ON employee_id = city_id;

SELECT emplovee.first_name,emplovee.last_name, city.city_name
FROM city
         RIGHT JOIN  emplovee ON employee_id = city_id;

SELECT*FROM city
                FULL OUTER JOIN emplovee
                                ON city.city_id = emplovee.employee_id;

SELECT emplovee.first_name,city.city_name
FROM emplovee
         CROSS JOIN city;
---
SELECT*FROM city
                FULL OUTER JOIN emplovee
                                ON city.city_id = emplovee.employee_id
WHERE emplovee.employee_id==
ORDER BY city_name;