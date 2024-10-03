-- Given the table schemas below, write a query to print the company_code, 
-- founder name, total number of lead managers, total number of senior managers, total number of managers, 
-- and total number of employees. Order your output by ascending company_code.

-- Note:

-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

select a.company_code, a.founder, 
       count(distinct b.lead_manager_code), 
       count(distinct c.senior_manager_code),
       count(distinct d.manager_code),
       count(distinct e.employee_code)
from Company a
left join Lead_Manager b on a.company_code = b.company_code
left join Senior_Manager c on b.lead_manager_code = c.lead_manager_code
left join Manager d on c.senior_manager_code = d.senior_manager_code
left join Employee e on d.manager_code = e.manager_code
group by a.company_code, a.founder
order by a.company_code