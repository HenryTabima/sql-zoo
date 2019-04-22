--? 1. List the teachers who have NULL for their department.
SELECT name
FROM teacher
WHERE dept is null;

--? 2. Note the INNER JOIN misses the teachers with no department AND the departments with no teacher.
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
  ON (teacher.dept=dept.id);

--? 3. Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
FROM teacher left JOIN dept ON (teacher.dept = dept.id);

--? 4. Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
FROM teacher right JOIN dept ON (teacher.dept = dept.id);

--? 5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name AND mobile number OR '07986 444 2266'
SELECT name, coalesce(mobile, '07986 444 2266')
FROM teacher;

--? 6. Use the COALESCE function AND a LEFT JOIN to print the teacher name AND department name. Use the string 'None' WHERE there is no department.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher left JOIN dept ON teacher.dept = dept.id;

--? 7. Use COUNT to show the number of teachers AND the number of mobile phones.
SELECT COUNT(name), COUNT(mobile)
FROM teacher;

--? 8. Use COUNT AND GROUP BY dept.name to show each department AND the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name, COUNT(teacher.name)
FROM teacher right JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

--? 9. Use CASE to show the name of each teacher followed BY 'Sci' if the teacher is IN dept 1 OR 2 AND 'Art' otherwise.
SELECT name,
  CASE
WHEN dept IN (1, 2) THEN 'Sci'
ELSE 'Art' END
FROM teacher;


--? 10. Use CASE to show the name of each teacher followed BY 'Sci' if the teacher is IN dept 1 OR 2, show 'Art' if the teacher's dept is 3 AND 'None' otherwise.
SELECT name,
  CASE
WHEN dept IN (1, 2) THEN 'Sci'
WHEN dept = 3 THEN 'Art'
ELSE 'None' END
FROM teacher;