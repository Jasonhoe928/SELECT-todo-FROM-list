DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE USER michael WITH PASSWORD 'stonebreaker';
CREATE DATABASE todo_app;
create table tasks (
	id SERIAL not null primary key,
	title VARCHAR(255) not null,
	description text null,
	created_at timestamp without time zone not null default current_timestamp,
	updated_at timestamp without time zone null,
	completed boolean not null default false
ALTER TABLE tasks
DROP COLUMN completed;
ALTER TABLE tasks
ADD COLUMN completed_at timestamp without time zone null default null;
ALTER TABLE tasks
ALTER COLUMN updated_at set not null, 
ALTER COLUMN updated_at set default current_timestamp;

INSERT INTO tasks (title, description) VALUES ('Study SQL', 'Complete this exercise');

INSERT INTO tasks (title, description) VALUES ('Study PostgresSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description) VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake 1%';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;