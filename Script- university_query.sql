-- Contare quanti iscritti ci sono stati ogni anno (la data di iscrizione sulla tabella students � enrolment_date)
select count(id), year(enrolment-date) 
from `students`
group by year(enrolment-date);

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select *
from `students` s
inner join `degrees` d 
on s.degree_id = d.id 
where d.name = 'Corso di laurea di Economia';

-- Selezionare tutti i corsi in cui insegna Fulvio Amato

select t.name, t.surname, c.name
from courses c 
inner join course_teacher ct 
on ct.course_id = c.id 
inner join teachers t 
on ct.teacher_id = t.id 
where t.name = 'Fulvio' and t.surname ='Amato';

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

select *
from students s 
inner join `degrees` d 
on s.degree_id = d.id 
inner join departments d2
on d.department_id = d2.id 
order by s.surname, s.name;
-- Contare quanti corsi di laurea ci sono per ogni dipartimento e mostrare nome dipartimento e numero di corsi

select d2.name, count(d.department_id)
from `degrees`d
inner join departments d2
on d.department_id = d2.id 
group by d2.id;