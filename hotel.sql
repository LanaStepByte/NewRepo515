


Create Database HotelDB
go

use HotelDb
go

create Table Customers (

   Id int primary key identity(1,1),
   FirstName nvarchar(50) not null,
   LastName nvarchar(50) not null,
   Email varchar(100) not null unique,
   PhoneNumber varchar(15) not null check(PhoneNumber like '[0-9]%'),
   PersonalId varchar(20) not null unique check(PersonalId like '[0-9]%' and LEN(PersonalId) = 11),
)

go


create Table Rooms (
   Id int primary key identity(1,1),
   RoomNumber int not null unique,
   RoomType nvarchar(50) not null,
   Price decimal(10, 2) not null check(Price > 0),
   IsAvailable bit not null default 1,
   HotelId int not null foreign key references dbo.Hotel(Id)
)

go 

create table Hotel
(
   Id int primary key identity(1,1),
   Name nvarchar(100) not null,
   Address nvarchar(200) not null,
   PhoneNumber varchar(15) not null check(PhoneNumber like '[0-9]%')

)
go

create table Bookings
(
   Id int primary key identity(1,1),
   CustomerId int not null foreign key references dbo.Customers(Id),
   RoomId int not null foreign key references dbo.Rooms(Id),
   CheckInDate datetime not null,
   CheckOutDate datetime not null,
   TotalPrice decimal(10, 2) not null check(TotalPrice > 0)
)
go 


create table Payments
(
   Id int primary key identity(1,1),
   BookingId int not null foreign key references dbo.Bookings(Id),
   PaymentDate datetime not null,
   Amount decimal(10, 2) not null check(Amount > 0),
   PaymentMethod nvarchar(50) not null
)
go


--///////////////


-- 1. Hotel (სასტუმროები)
INSERT INTO Hotel (Name, Address, PhoneNumber) VALUES
(N'Rooms Hotel Tbilisi', N'კოსტავას ქ. 14, თბილისი', '322200099'),
(N'Paragraph Freedom Square', N'თავისუფლების მოედანი 2, თბილისი', '322990011'),
(N'Sheraton Grand Tbilisi', N'ტაბიძის ქ. 20, თბილისი', '322770088'),
(N'Radisson Blu Iveria', N'ვარდების რევოლუციის მოედანი 1, თბილისი', '322402200'),
(N'Biltmore Hotel Tbilisi', N'შოთა რუსთაველის გამზირი 29, თბილისი', '322727272'),
(N'Kacketi Resort', N'ცენტრალური ქ. 5, ყაზბეგი', '322113355'),
(N'Paragraph Resort & Spa Shekvetili', N'შეკვეთილი, გურია', '322889900'),
(N'Ambassadori Kachreti', N'კაჭრეტი, კახეთი', '322554433'),
(N'Crown Plaza Borjomi', N'მტკვრის ქ. 9, ბორჯომი', '322665544'),
(N'Best Western Batumi', N'მელიქიშვილის ქ. 11, ბათუმი', '422272829');

-- 2. Customers (მომხმარებლები)
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, PersonalId) VALUES
(N'გიორგი', N'ბერიძე', 'giorgi.beridze@example.com', '599112233', '01001012345'),
(N'ნინო', N'მამულაშვილი', 'nino.mamulashvili@example.com', '555223344', '01002023456'),
(N'დავით', N'კაპანაძე', 'davit.kapanadze@example.com', '577334455', '01003034567'),
(N'თამარ', N'გიორგაძე', 'tamar.giorgadze@example.com', '598445566', '01004045678'),
(N'ლევან', N'ფხაკაძე', 'levan.pkhakadze@example.com', '591556677', '01005056789'),
(N'მარიამ', N'ლომიძე', 'mariam.lomidze@example.com', '593667788', '01006067890'),
(N'საბა', N'ჩიქოვანი', 'saba.chikovani@example.com', '599778899', '01007078901'),
(N'ანასტასია', N'გოგოლაძე', 'anastasia.gogoladze@example.com', '555889900', '01008089012'),
(N'ზურა', N'ასათიანი', 'zura.asatiani@example.com', '577990011', '01009090123'),
(N'ეკა', N'ბახტაძე', 'eka.bakhtadze@example.com', '598001122', '01010101234');

-- 3. Rooms (ოთახები)
INSERT INTO Rooms (RoomNumber, RoomType, Price, IsAvailable, HotelId) VALUES
(1099, N'Single', 150.00, 1, 1),
(102, N'Double', 220.00, 1, 1),
(201, N'Suite', 450.00, 0, 2),
(202, N'Deluxe', 350.00, 1, 2),
(301, N'Single', 130.00, 1, 3),
(302, N'Double', 200.00, 0, 4),
(401, N'Suite', 500.00, 1, 5),
(501, N'Double', 280.00, 1, 6),
(601, N'Deluxe', 320.00, 1, 7),
(701, N'Single', 140.00, 0, 8);

-- 4. Bookings (ჯავშნები)
INSERT INTO Bookings (CustomerId, RoomId, CheckInDate, CheckOutDate, TotalPrice) VALUES
(1, 1, '2026-07-01', '2026-07-05', 600.00),
(2, 3, '2026-07-10', '2026-07-15', 2250.00),
(3, 2, '2026-08-01', '2026-08-04', 660.00),
(4, 4, '2026-08-05', '2026-08-10', 1750.00),
(5, 5, '2026-08-12', '2026-08-15', 390.00),
(6, 6, '2026-09-01', '2026-09-07', 1200.00),
(7, 7, '2026-09-10', '2026-09-12', 1000.00),
(8, 8, '2026-09-15', '2026-09-20', 1400.00),
(9, 9, '2026-10-01', '2026-10-04', 960.00),
(10, 10, '2026-10-05', '2026-10-08', 420.00);

-- 5. Payments (გადახდები)
INSERT INTO Payments (BookingId, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2026-07-01 10:30:00', 600.00, N'Credit Card'),
(2, '2026-07-10 11:15:00', 2250.00, N'Bank Transfer'),
(3, '2026-08-01 14:00:00', 660.00, N'Credit Card'),
(4, '2026-08-05 09:45:00', 1750.00, N'Cash'),
(5, '2026-08-12 16:20:00', 390.00, N'Credit Card'),
(6, '2026-09-01 12:00:00', 1200.00, N'Bank Transfer'),
(7, '2026-09-10 15:30:00', 1000.00, N'Credit Card'),
(8, '2026-09-15 13:10:00', 1400.00, N'Cash'),
(9, '2026-10-01 11:00:00', 960.00, N'Credit Card'),
(10, '2026-10-05 10:00:00', 420.00, N'Bank Transfer');








---- ////////////////////////






select count(*) as TotalBookings, FirstName, LastName, r.RoomNumber as Room, h.Name as Hotel from Bookings b
join Customers c on b.CustomerId = c.Id
join Rooms r on b.RoomId = r.Id
join Hotel h on r.HotelId = h.Id
group by FirstName, LastName, r.RoomNumber, h.Name




--	რომელ სასტუმროს აქვს ყველაზე მეტი დაჯავშნა? 

select top(1) count(*), h.Name as Hotel from Bookings b
join Rooms r on b.RoomId = r.Id
join Hotel h on r.HotelId = h.Id
Group by h.Name
order by count(*) desc


--•	რომელი ნომრები არასდროს დაჯავშნილა?
select * from Rooms r
left join Bookings b on r.Id = b.RoomId
where b.RoomId is null



--•	თითოეული მომხმარებლის მიერ დახარჯული თანხა. 
select sum(p.Amount) as TotalSpent, c.FirstName, c.LastName from Bookings
join Customers c on Bookings.CustomerId = c.Id
join Payments p on Bookings.Id = p.BookingId
group by c.FirstName, c.LastName



--•	ყველაზე ძვირადღირებული დაჯავშნა. 
select max(p.Amount) as MaxSpentfrom from Bookings
join Customers c on Bookings.CustomerId = c.Id
join Payments p on Bookings.Id = p.BookingId


--•	სასტუმროები, რომლებსაც კონკრეტულ პერიოდში ჯავშანი არ ჰქონიათ.

select * from Hotel h
join Rooms r on h.Id = r.HotelId
join Bookings b on r.Id = b.RoomId
where b.CheckInDate not between '2026-07-01' and '2026-08-30' and b.CheckOutDate not between '2026-07-01' and '2026-07-20'




--select Len(c.FirstName)from Customers c


-- function 
create function GetFullName1
(
  @FirstName nvarchar(50),
  @LastName nvarchar(50)
)
returns nvarchar(101)
as
begin
     return @FirstName + ' ' + @LastName
end




select dbo.GetFullName1(c.FirstName, c.LastName) as FullName from Customers c




create function ConvertPn1
(
   @PN varchar(11)
)
returns varchar(12)
as 
begin
   return '-' + @PN
end



select dbo.ConvertPn1(c.PersonalId) as ConvertedPersonalId from Customers c







create procedure sp_GetHighAmountBookings
(
   @Amount int
)
as
begin
   select b.Id, c.FirstName, c.LastName, p.Amount from Bookings b
   join Customers c on b.CustomerId = c.Id
   join Payments p on b.Id = p.BookingId
   where p.Amount > @Amount
end




exec sp_GetHighAmountBookings 1000



create view vw_SelectFullAmontBookings
as  
select b.Id, c.FirstName, c.LastName, p.Amount from Bookings b
   join Customers c on b.CustomerId = c.Id
   join Payments p on b.Id = p.BookingId
   where p.Amount > 50




 select * from vw_SelectFullAmontBookings


-- procedure
-- view


