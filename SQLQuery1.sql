

CREATE DATABASE StepDB
Go
Use StepDB
Go

Create Table Students 
(
   Id int primary key	identity(1,1),
   FirstName nvarchar(25) not null,
   LastName nvarchar(50) default('N/A'),  
   Age int  check(Age between 18 and 100),
   Email nvarchar(255) unique,
   StatusIsActive bit default(1)  --0
)
Go

Create Table Teachers 
(
   Id int primary key	identity(1,1),
   FirstName nvarchar(25) not null,
   LastName nvarchar(50) default('N/A'),  
   PhoneNumber varchar(50),
   Email nvarchar(255) unique,
)
Go

Create Table Subjects
(
   Id int primary key identity(1,1),
   Title nvarchar(100) not null,
   AmountOfHours int not null check(AmountOfHours > 0),
)
Go

Create table StudentSubject
(
  Id int primary key identity(1,1), -- PK
  StudentId int not null,
  SubjectId int not null,
  Constraint FK_Student_Subject_StudentId 
        Foreign key(StudentId) 
        references  Students(Id)
        On delete cascade,
  Constraint FK_Student_Subject_SubjectId 
        Foreign key(SubjectId) 
        references  Subjects(Id)
        On delete cascade

)
Go


Create table TeacherSubject
(
  Id int primary key identity(1,1), -- PK
  TeacherId int not null,
  SubjectId int not null,
  Constraint FK_Teacher_Subject_TeacherId
        Foreign key(TeacherId) 
        references  Teachers(Id)
        On delete cascade,
  Constraint FK_Teacher_Subject_SubjectId 
        Foreign key(SubjectId) 
        references  Subjects(Id)
        On delete cascade

)
Go


INSERT INTO Students (FirstName, LastName, Age, Email, StatusIsActive)
VALUES
('Giorgi', 'Beridze', 22, 'giorgi.beridze@gmail.com', 1),
('Nino', 'Kapanadze', 25, 'nino.kapanadze@gmail.com', 1),
('Luka', 'Maisuradze', 19, 'luka.maisuradze@gmail.com', 1),
('Ana', 'Gelashvili', 28, 'ana.gelashvili@gmail.com', 0),
('Saba', 'Chikovani', 21, 'saba.chikovani@gmail.com', 1),
('Mariam', 'Lomidze', 24, 'mariam.lomidze@gmail.com', 1),
('Data', 'Abashidze', 30, 'data.abashidze@gmail.com', 0),
('Salome', 'Japaridze', 23, 'salome.japaridze@gmail.com', 1),
('Nikoloz', 'Tsiklauri', 27, 'nikoloz.tsiklauri@gmail.com', 1),
('Tamar', 'Kobakhidze', 20, 'tamar.kobakhidze@gmail.com', 1),
('Irakli', 'Mchedlishvili', 32, 'irakli.mchedlishvili@gmail.com', 0),
('Elene', 'Gogoladze', 26, 'elene.gogoladze@gmail.com', 1),
('Sandro', 'Kiknadze', 29, 'sandro.kiknadze@gmail.com', 1),
('Ketevan', 'Dolidze', 22, 'ketevan.dolidze@gmail.com', 0),
('Beka', 'Khutsishvili', 35, 'beka.khutsishvili@gmail.com', 1),
('Sofia', 'Rukhadze', 19, 'sofia.rukhadze@gmail.com', 1),
('Giga', 'Natroshvili', 41, 'giga.natroshvili@gmail.com', 0),
('Kristine', 'Kvaratskhelia', 24, 'kristine.kvaratskhelia@gmail.com', 1),
('Levan', 'Sanikidze', 38, 'levan.sanikidze@gmail.com', 1),
('Maia', 'Tsereteli', 31, 'maia.tsereteli@gmail.com', 0);
Go

INSERT INTO Teachers (FirstName, LastName, PhoneNumber, Email)
VALUES
('Giorgi', 'Beridze', '599111111', 'giorgi.beridze@gmail.com'),
('Nino', 'Kapanadze', '599111112', 'nino.kapanadze@gmail.com'),
('Luka', 'Maisuradze', '599111113', 'luka.maisuradze@gmail.com'),
('Ana', 'Gelashvili', '599111114', 'ana.gelashvili@gmail.com'),
('Saba', 'Chikovani', '599111115', 'saba.chikovani@gmail.com'),
('Mariam', 'Lomidze', '599111116', 'mariam.lomidze@gmail.com'),
('Data', 'Abashidze', '599111117', 'data.abashidze@gmail.com'),
('Salome', 'Japaridze', '599111118', 'salome.japaridze@gmail.com'),
('Nikoloz', 'Tsiklauri', '599111119', 'nikoloz.tsiklauri@gmail.com'),
('Tamar', 'Kobakhidze', '599111120', 'tamar.kobakhidze@gmail.com'),
('Irakli', 'Mchedlishvili', '599111121', 'irakli.mchedlishvili@gmail.com'),
('Elene', 'Gogoladze', '599111122', 'elene.gogoladze@gmail.com'),
('Sandro', 'Kiknadze', '599111123', 'sandro.kiknadze@gmail.com'),
('Ketevan', 'Dolidze', '599111124', 'ketevan.dolidze@gmail.com'),
('Beka', 'Khutsishvili', '599111125', 'beka.khutsishvili@gmail.com'),
('Sofia', 'Rukhadze', '599111126', 'sofia.rukhadze@gmail.com'),
('Giga', 'Natroshvili', '599111127', 'giga.natroshvili@gmail.com'),
('Kristine', 'Kvaratskhelia', '599111128', 'kristine.kvaratskhelia@gmail.com'),
('Levan', 'Sanikidze', '599111129', 'levan.sanikidze@gmail.com'),
('Maia', 'Tsereteli', '599111130', 'maia.tsereteli@gmail.com');
Go

INSERT INTO Subjects (Title, AmountOfHours)
VALUES
('Mathematics', 60),
('English', 45),
('Programming', 90),
('Database Systems', 60),
('Computer Networks', 45);

GO


insert into StudentSubject(StudentId, SubjectId)
values
(1,1),
(2,1),
(3,1),
(4,1),
(5,2),
(6,2),
(7,2),
(8,2),
(9,3),
(10,3),
(11,3),
(12,3),
(13,4),
(14,4),
(15,4),
(16,4)
Go

insert into TeacherSubject(TeacherId, SubjectId)
values
(1,1),
(2,1),
(3,1),
(4,1),
(5,2),
(6,2),
(7,2),
(8,2),
(9,3),
(10,3),
(11,3),
(12,3),
(13,4),
(14,4),
(15,4),
(16,4)
Go

/*
დაასელექტეთ 5 სტუდენტი რომლის ასაკი მეტია 20 ზე
დაასელექტეთ ის საგნები რომლის საათების ხანგძლივობა მეტია 20 საათზე.
დაასელექტეთ ის მასწავლებლები რომლებსაც არ აქვთ შევსებული ტელეფონის ნომერი.
*/


Select Top(5) * from Students as s where s.Age > 20

Select FirstName + ' ' + LastName as FullName from Students as s

Select * from Subjects sub where sub.AmountOfHours between 20 and 50

Select * From Teachers t where t.id = 1
Select * from Teachers t where t.PhoneNumber =''


Select * from Students order by  Age desc 

--JOIN 

--student + subject

select * from Students
Select * from Subjects

Select * From StudentSubject st_Subj
Join Students st on st_Subj.StudentId = st.Id
Join Subjects sub on st_Subj.SubjectId = sub.Id


Select st.Id, st.FirstName + ' ' + st.LastName as FullName, sub.Title
From StudentSubject st_Subj
Inner Join Students st on st_Subj.StudentId = st.Id
Inner Join Subjects sub on st_Subj.SubjectId = sub.Id


-- Join --  Inner Join  -- 
-- Left Join
-- Right Join
-- Full Join 