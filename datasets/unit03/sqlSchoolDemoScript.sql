DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS teachers;

CREATE TABLE teachers (
	teacher_id INTEGER PRIMARY KEY,
	teacher_name TEXT NOT NULL,
	room TEXT CHECK (length(room) = 3)
);

CREATE TABLE courses (
	course_id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	teacher_id 	INTEGER NOT NULL ,
	FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id)
);

INSERT INTO teachers (teacher_id, teacher_name, room) VALUES
	(1234, 'Nebraska Big Shoes Jefferson', '676'),
	(1235, 'John Wordle', '454');