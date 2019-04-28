DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
  id serial NOT NULL PRIMARY KEY,
  title character varying (255) NOT NULL,
  description text,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone,
  completed boolean
);

ALTER TABLE tasks 
DROP completed;

ALTER TABLE tasks 
ADD completed_at timestamp DEFAULT NULL;

ALTER TABLE tasks 
DROP updated_at;

ALTER TABLE tasks 
ADD updated_at timestamp NOT NULL DEFAULT now();

INSERT INTO tasks 
VALUES (default, 'Study SQL', 'Complete this exercise', default, default, default);

INSERT INTO tasks (title, description) 
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title 
FROM tasks 
WHERE completed_at IS NULL;

UPDATE tasks 
SET completed_at=now() 
WHERE title='Study SQL';

SELECT title, description 
FROM tasks 
WHERE completed_at IS NULL;

SELECT * 
FROM tasks 
ORDER BY created_at DESC;

INSERT INTO tasks (title, description) 
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) 
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description) 
VALUES ('third mistake', 'another test entry');

SELECT title 
FROM tasks 
WHERE title LIKE '%mistake%';

DELETE 
FROM tasks 
WHERE title LIKE '%mistake 1%';

SELECT title, description 
FROM tasks 
WHERE title LIKE '%mistake%';

DELETE 
FROM tasks 
WHERE title 
LIKE '%mistake%';

SELECT * 
FROM tasks 
ORDER BY title ASC;