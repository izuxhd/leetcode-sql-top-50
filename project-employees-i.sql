select P.project_id,
 round(sum(experience_years)/count(experience_years) ,2) average_years
   from
    Project P join  Employee E 
    on  P.employee_id=E.employee_id
     group by project_id