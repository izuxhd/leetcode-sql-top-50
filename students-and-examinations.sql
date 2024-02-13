SELECT 
    a.student_id,
    a.student_name,
    b.subject_name,
    COUNT( E.subject_name) 
           as attended_exams
FROM 
    Students as  a
JOIN  
 Subjects as b  Left Join 
    Examinations as E ON a.student_id = E.student_id and  b.subject_name=E.subject_name
GROUP BY 
    a.student_id, 
   
    b.subject_name 
    order by a.student_id,b.subject_name

