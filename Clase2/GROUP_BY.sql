-- GRUPO BY

-- Cantidad de empleados por departamento

SELECT 
    department_id,
    count(1) cant_empleados
FROM hr.employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

SELECT 
    department_id,
    count(1) cant_empleados,
    sum(salary) planilla
FROM hr.employees
WHERE department_id IS NOT NULL
GROUP BY department_id;


SELECT 
    department_id,
    count(1) cant_empleados
FROM hr.employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING count(1) > 10;

select extract(month from sysdate) from dual;

SELECT 
    department_id,
    sum(case when extract(month from hire_date)=1 then 1 else 0 end) Enero,
    sum(case when extract(month from hire_date)=2 then 1 else 0 end) Febrero,
    sum(case when extract(month from hire_date)=3 then 1 else 0 end) Marzo,
    sum(case when extract(month from hire_date)=4 then 1 else 0 end) Abril,
    sum(case when extract(month from hire_date)=5 then 1 else 0 end) Mayo,
    sum(case when extract(month from hire_date)=6 then 1 else 0 end) Junio,
    sum(case when extract(month from hire_date)=7 then 1 else 0 end) Julio,
    sum(case when extract(month from hire_date)=8 then 1 else 0 end) Agosto,
    sum(case when extract(month from hire_date)=9 then 1 else 0 end) Setiembre,
    sum(case when extract(month from hire_date)=10 then 1 else 0 end) Octubre,
    sum(case when extract(month from hire_date)=11 then 1 else 0 end) Noviembre,
    sum(case when extract(month from hire_date)=12 then 1 else 0 end) diciembre,
    count(1) total
FROM hr.employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

select * 
from hr.employees;


-- Empleado que tiene el menor salario, mostrar los empates.

select department_id, min(salary) salario_minimo
from hr.employees
where department_id is not null
group by department_id;


select e.*
from hr.employees e 
join ( select department_id, min(salary) salario_minimo
        from hr.employees
        where department_id is not null
        group by department_id ) t
on e.department_id = t.department_id and e.salary = t.salario_minimo
order by e.department_id;


select e.*
from hr.employees e 
where (e.department_id, e.salary) in ( select department_id, min(salary) salario_minimo
        from hr.employees
        where department_id is not null
        group by department_id )
order by e.department_id;


-- Recaudado por curso

select count( distinct cur_id) cursos_con_alumnos 
from educa.matricula;

select p.cur_id, sum(p.pag_importe) recaudado
from educa.pago p
group by p.cur_id;

select * from educa.matricula;
select * from educa.pago;

/*
Se necesita saber cu�ntos empleados han ingreso por a�o en cada departamento. 
Esquemas: RECURSOS

Soluci�n:
1.- Grupo: A�o
2.- Subgrupo: Departamento
*/

select * from hr.employees;

select 
    extract(year from e.hire_date) anio,
    e.department_id,
    count(1) cant_empleados
from hr.employees e
group by extract(year from e.hire_date), e.department_id
order by 1, 2;





