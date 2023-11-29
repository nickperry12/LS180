/*
CoderPad provides a basic SQL sandbox with the following schema.
You can also use commands like '\dt;' and '\d employees;'

employees                             projects
+---------------+---------+           +---------------+---------+
| id            | int     |<----+  +->| id            | int     |
| first_name    | varchar |     |  |  | title         | varchar |
| last_name     | varchar |     |  |  | start_date    | date    |
| salary        | int     |     |  |  | end_date      | date    |
| department_id | int     |--+  |  |  | budget        | int     |
+---------------+---------+  |  |  |  +---------------+---------+
                             |  |  |
departments                  |  |  |  employees_projects
+---------------+---------+  |  |  |  +---------------+---------+
| id            | int     |<-+  |  +--| project_id    | int     |
| name          | varchar |     +-----| employee_id   | int     |
+---------------+---------+           +---------------+---------+
*/


/* 

1. What tables are we working with? How are they connected? Describe the
relationships between them. How would you draw the ERD? (Or use Coderpad's ERD
to explain cardinality and modality).

-----------------------------------------

In the coderpad database, we have 4 different tables we're working with. We have
a `employees` table, a `departments` table, a `projects` table, and a
`employees_projects` table.

The `departments` and `employees` tables have a 'one-to-many' relationship: an
employees belongs to one department, and a department can have many employees.

The `employees` and `projects` tables have a 'many-to-many' relationship: an
employee can have many projects to complete and a project can have many
employees working on it. Tables with a 'many-to-many' relationship are usually
connected via a JOIN table. In this case, they are joined through the
`employees_projects` table.

-----------------------------------------


2. At the top right, you can view the "databases" tab, which outlines the schema
we're working with. Take some time to read through and describe what we're
working with.

------------------------------------------



3. View each of the tables. → When you're ready, here are some additional
questions. Feel free to make your own questions as you go, based on how the
tables can be linked.

*/

/*

1. Write a SQL statement that returns a table like this:
department  | first_name | last_name 
-------------+------------+-----------
 Engineering | Ian        | Peterson
 Engineering | Mike       | Peterson
 Engineering | Cailin     | Ninson
 Marketing   | John       | Mills
 Reporting   | John       | Smith
 Silly Walks | Ava        | Muffinson

*/

-- Algo

-- Need to select department.name, employee.first_name, and employee.last_name
-- Can use an INNER JOIN as we need matching data from both left and right tables

SELECT d.name AS department, e.first_name, e.last_name
FROM departments AS d
INNER JOIN employees AS e
ON d.id = e.department_id
ORDER BY d.name ASC;

/*

2. Let's format the last table so it's a bit more readable:
Department  |                 Employees                  
-------------+--------------------------------------------
 Engineering | Ian Peterson, Mike Peterson, Cailin Ninson
 Marketing   | John Mills
 Reporting   | John Smith
 Silly Walks | Ava Muffinson

*/

SELECT d.name AS department, string_agg((e.first_name || ' ' || e.last_name), ', ') AS employees
FROM departments AS d
INNER JOIN employees AS e
ON d.id = e.department_id
ORDER BY d.name ASC;

/*

3. Now we want to add any departments that don't have any employees, and 
sort the databy department size, largest department first. Our table will 
look like this:

Department  |                 Employees                  
-------------+--------------------------------------------
 Engineering | Ian Peterson, Mike Peterson, Cailin Ninson
 Marketing   | John Mills
 Silly Walks | Ava Muffinson
 Reporting   | John Smith
 Biz Dev     |

*/

SELECT d.name AS "Department", string_agg(e.first_name || ' ' || e.last_name, ', ') AS "Employees"
FROM departments AS d
LEFT OUTER JOIN employees AS e
ON d.id = e.department_id
GROUP BY d.name
ORDER BY count(e.id) DESC, d.name ASC;