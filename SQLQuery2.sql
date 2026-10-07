



Select s.FirstName, s.LastName, sub.Title from Students s
left join StudentSubject ss on s.Id =ss.StudentId
left join Subjects sub on ss.SubjectId = sub.Id
where sub.Title = 'Programming' 



Select t.FirstName + ' ' + t.LastName as FullName, sub.Title, sub.AmountOfHours from Teachers t
join TeacherSubject ts on t.Id = ts.TeacherId
join Subjects sub on ts.SubjectId = sub.Id









Select sub.Title, s.FirstName + ' ' + s.LastName as FullName from Subjects sub
join StudentSubject ss on sub.Id = ss.SubjectId
join Students s on ss.StudentId = s.Id



select COUNT(*), sub.Title from Students s
join StudentSubject ss on s.Id = ss.StudentId
join Subjects sub on ss.SubjectId = sub.Id
join TeacherSubject ts on sub.Id = ts.SubjectId
join Teachers t on ts.TeacherId = t.Id
GROUP BY sub.Title 




Create table Faculty 
(
  Id int primary key identity(1,1),
  Name nvarchar(100) not null,
)

insert into Faculty (Name) 
values ('Engineering'),
	   ('Science'),
	   ('Arts'),
	   ('Business')


alter table students
add FacultyId int 
constraint FK_Students_FacultyId

foreign key references Faculty(Id)
on delete cascade



update Students	
set FacultyId = 4
where id between 16 and 20



select s.FirstName, f.Name   from Students s
join Faculty f on s.FacultyId = f.Id





create table StudentProfile
(
  Id int primary key identity(1,1),
  Address nvarchar(200) not null,
  StudentId int not null
  constraint FK_StudentProfile_StudentId foreign key references Students(Id)
)

insert into StudentProfile (Address, StudentId)
values ('123 Main St', 1),
	   ('456 Oak Ave', 2),
	   ('789 Pine Rd', 3),
	   ('101 Maple Dr', 4),
	   ('202 Birch Ln', 5)





select s.FirstName, sp.Address from Students s
join StudentProfile sp on s.Id = sp.StudentId




--M:M
--1:M
--1:1