Select d_name as "Department", e_name as "Employee", salary 
from ( Select d.name as d_name, e.name as e_name, e.salary,
dense_rank() over(partition by e.departmentid order by e.salary desc) as rnk
from Employee e
inner join Department d
on d.id = e. departmentId)
where rnk <= 3