Create TABLE colleges(
id INTEGER PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
create TABLE students(
id INTEGER PRIMARY KEY,
name VARCHAR(50) NOT NULL,
collegeId INTEGER,
FOREIGN KEY (collegeId) REFERENCES colleges(id)
  );
create TABLE rankings(
studentId INTEGER,
ranking INTEGER NOT NULL,
year INTEGER NOT NULL,
FOREIGN KEY (studentId) REFERENCES students(id)
);
-- INSERT INTO colleges (id, name) VALUES
-- (1, 'College A'),
-- (2, 'College B'),
-- (3, 'College C');

-- INSERT INTO students (id, name, collegeId) VALUES
-- (1, 'Student 1', 1),
-- (2, 'Student 2', 1),
-- (3, 'Student 3', 2),
-- (4, 'Student 4', 2),
-- (5, 'Student 5', 3),
-- (6, 'Student 6', 3);

-- INSERT INTO rankings (studentId, ranking, year) VALUES
-- (1, 1, 2015),
-- (2, 2, 2015),
-- (3, 3, 2015),
-- (4, 4, 2015),
-- (5, 5, 2015),
-- (6, 1, 2016);

SELECT c.name as college_name, min(r.ranking) as best_ranking, count(s.id) as number_of_students
FROM colleges c
JOIN students s ON c.id = s.collegeId
JOIN rankings r ON s.id = r.studentId
WHERE r.year = 2015 and r.ranking in between 1 and 3
GROUP BY c.name
having count(*) >= 1;