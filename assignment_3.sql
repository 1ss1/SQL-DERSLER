--Questions:

--Single-Row Subqueries:

--Write a query to find the maximum duration among the tracks. Your query should include TrackId, Name, Milliseconds.
SELECT TrackId, name, Milliseconds 
FROM tracks
WHERE Milliseconds  in(SELECT max(Milliseconds) from tracks);

--Write a query to find the minimum duration among the tracks. Your query should include TrackId, Name, Milliseconds.
SELECT TrackId, name, Milliseconds 
FROM tracks
WHERE Milliseconds  in(SELECT min(Milliseconds) from tracks);

--Write a query to find the tracks whose bytes are higher than the average of the bytes of all tracks. Your query should include TrackId, Name, Bytes, general average and should be ordered by Bytes from highest to lowest. General average is the average of all tracks. General average should repeat in every row. (Hint: You need to use two subqueries)

SELECT TrackId, name, Bytes 
FROM tracks
WHERE Bytes >(SELECT avg(Bytes) from tracks)
ORDER by Bytes DESC;

   --Multiple-Row Subqueries:

--Write a query that returns the customers whose sales representatives are Jane Peacock and Margaret Park. Your query should include CustomerID, First Name and Last Name of the customers.

SELECT CustomerId, FirstName, LastName
FROM customers
WHERE SupportRepId in (SELECT EmployeeId
                    FROM employees
                    WHERE FirstName='Jane' or FirstName='Margaret');


--Rewrite the subquery above using the JOIN.
SELECT c.CustomerId, c.FirstName, c.LastName
FROM employees e
JOIN customers c
ON e.EmployeeId = c.SupportRepId
WHERE e.FirstName= 'Jane' or e.FirstName='Margaret';



  /*  DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements

Create a table inside the chinook database. This table tracks the employees’ courses inside the organization. Your table should have the followings features:

               Name of the table: courses
               Columns:
                    CourseId (Primary Key)
                    CourseName (Cannot be null)
                    EmployeeId (Foreign Key - Refers to EmployeeId of employees table ) 
                    CoursePrice*/

   CREATE TABLE IF NOT EXISTS courses(
               CourseId INTEGER,
               CourseName NOT NULL,
               EmployeeId  INTEGER,
               PRIMARY KEY (CourseId),
               FOREIGN KEY EmployeeId REFERENCES employees(EmployeeId)
               );


     /* 2. Insert at least 5 rows into the courses table. Your EmployeeId should contain the values of the EmployeeId column on the employees table. You’re free to choose any values for other columns (CourseId, CourseName, CoursePrice)*/

   INSERT INTO courses VALUES (12, 'math', 8);
   INSERT INTO courses VALUES (13, 'physics', 7);
   INSERT INTO courses VALUES (14, 'chemistry', 6);
   INSERT INTO courses VALUES (15, 'biology', 5);
   INSERT INTO courses VALUES (16, 'English', 4);



--Delete the last row of your courses table.
delete from courses where EmployeeId=3;

--Add a new column to your courses table named StartDate. The new column cannot be null.

ALTER TABLE courses
ADD COLUMN StartDate NOT NULL;

--Delete the CoursePrice column.

ALTER TABLE courses
DROP COLUMN CoursePrice;

--Delete the courses table. */

DROP TABLE courses;
