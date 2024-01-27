-- Создание индекса в таблице "courses"
create index idx_course_name on courses(course_name);

-- Сгруппировать студентов по курсам и количеству студентов
select c.course_name, count(cs.student_id) as student_count
from courses_students cs
inner join courses c on cs.course_id = c.id
group by c.course_name;

-- Сгруппировать преподавателей по количеству курсов
select t.first_name, t.last_name, count(c.id) as course_count
from teachers t
left join courses c on t.id = c.teacher_id
group by t.first_name, t.last_name;

-- Вытащить один курс со всеми студентами
select c.course_name, s.first_name, s.last_name
from courses_students cs
inner join courses c on cs.course_id = c.id
inner join students s on cs.student_id = s.id
where c.id = 1;

-- Преподаватель с его курсами
select t.first_name, t.last_name, c.course_name
from teachers t
left join courses c on t.id = c.teacher_id
where t.id = 1;