-- comp9311 19T3 Project 1
--
-- MyMyUNSW Solutions


-- Q1:
create or replace view Q1(courseid, code)
as
select distinct courses.id,subjects.code
from courses,subjects, staff_roles,course_staff
where subjects.code like 'LAWS%' and 
courses.subject = subjects.id and 
course_staff.course=courses.id and
course_staff.role=staff_roles.id and
staff_roles.name='Course Tutor'
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q2:
create or replace view Q2(unswid,name,class_num)
as
select distinct buildings.unswid,buildings.name,count(class_types.name)
from buildings,class_types,classes,rooms
where class_types.name='Lecture' and
class_types.id=classes.ctype and
classes.room=rooms.id and
rooms.building=buildings.id
group by buildings.unswid,buildings.name
having count(class_types.name)>0
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q3:
create or replace view Q3(classid, course, room)
as 
select distinct classes.id,classes.course,classes.room
from classes,course_enrolments,facilities,people,students,room_facilities
where facilities.description='Television monitor' and
facilities.id=room_facilities.facility and
room_facilities.room=classes.room and
classes.course=course_enrolments.course and
course_enrolments.student=students.id and
students.id = people.id and
people.name='Craig Conlon'
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q4:
create or replace view Q4(unswid, name)
as
(select distinct people.unswid,people.name
from course_enrolments,courses,people,students,subjects
where students.stype='local' and
people.id=students.id and
course_enrolments.student=students.id and
course_enrolments.grade='CR' and
course_enrolments.course=courses.id and
courses.subject=subjects.id and
subjects.code='COMP9311')
intersect
(select distinct people.unswid,people.name
from course_enrolments,courses,people,students,subjects
where students.stype='local' and
people.id=students.id and
course_enrolments.student=students.id and
course_enrolments.grade='CR' and
course_enrolments.course=courses.id and
courses.subject=subjects.id and
subjects.code='COMP9021')
--... SQL statements, possibly using other views/functions defined by you ...
;

--Q5:
create or replace view Q5(num_student)
as
select count(*)
from course_enrolments
where avg(course_enrolments.mark)>(
select avg(*)
from
(select avg(course_enrolments.mark)
from course_enrolments
group by course_enrolments.student
having avg(course_enrolments.mark)>0))
group by course_enrolments.student
having avg(course_enrolments.mark)>0
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q6:
create or replace view Q6(semester, max_num_student)
as
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q7:
create or replace view Q7(course, avgmark, semester)
as
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q8: 
create or replace view Q8(num)
as
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q9:
create or replace view Q9(unswid, name)
as
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q10:
create or replace view Q10(unswid, longname, num, rank)
as
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q11:
create or replace view Q11(unswid, name)
as
--... SQL statements, possibly using other views/functions defined by you ...
;

-- Q12:
create or replace view Q12(unswid, name, program, academic_standing)
as
--... SQL statements, possibly using other views/functions defined by you ...
;
