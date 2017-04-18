﻿--Ronald Cavaliere--
--Alan Labouseur--
--4/18/17--
--Lab # 10--
--
-- The table of courses.
--
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select * 
from courses
order by num ASC;


--
-- Courses/Prerequisites
--
create table Prerequisites  (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites
order by courseNum DESC;

-- 1) Function	PreReqsFor(courseNum) - Returns the immediate prerequisites for the passed-in	course number.	
create function PreReqsFor(int, REFCURSOR) returns refcursor as $$
declare
   courseNumIn int    := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select courseNum, preReqNum
      from   prerequisites, courses
      where  courseNumIn = courseNum
	and  num = preReqNum;
   return resultset;
end;
$$ 
language plpgsql;

select PreReqsFor(499, 'results');
Fetch all from results;


-- 2) Function IsPreReqFor(courseNum) - Returns the courses for which the passed-in course number is an immediate pre-requisite.--

create function IsPreReqFor(int, REFCURSOR) returns refcursor as $$
declare
   PreReqNumIn int       := $1;
   resultset REFCURSOR   := $2;
begin
   open resultset for 
      select PreReqNum, CourseNum
      from   courses, prerequisites
      where  CourseNum = PreReqNum
	and  num = courseNum;
   return resultset;
end;
$$ 
language plpgsql;

select IsPreReqFor(120, 'results');
Fetch all from results;