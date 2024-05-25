create database if not exists Library;

create table publisher (publisher_PublisherName varchar(255) primary key,
					    publisher_PublisherAddress varchar(255) ,
						publisher_PublisherPhone varchar(13));
                           
create table library_branch (library_branch_BranchID tinyint primary key auto_increment,
                             library_branch_BranchName varchar(255),
							 library_branch_BranchAddress varchar(255));
                                    
create table borrower (borrower_CardNo tinyint primary key,
					   borrower_BorrowerName varchar(255),
                       borrower_BorrowerAddress varchar(255),
                       borrower_BorrowerPhone varchar(15));
			
create table book (book_BookID	tinyint primary key,
					book_Title	varchar(255),
                    book_PublisherName varchar(255),
                    foreign key (book_PublisherName) references publisher(publisher_PublisherName) on update cascade on delete cascade);
  
create table book_authors (book_authors_AuthorID tinyint primary key auto_increment,
						   book_authors_BookID tinyint,
                           book_authors_AuthorName varchar(255),
                           foreign key (book_authors_BookID) references book (book_BookID) on update cascade on delete cascade);
                           
create table book_copies (book_copies_CopiesID tinyint primary key auto_increment,
						  book_copies_BookID tinyint,
                          book_copies_BranchID tinyint,
                          book_copies_No_Of_Copies tinyint,
                          foreign key (book_copies_BookID) references book (book_BookID) on update cascade on delete cascade,
                          foreign key (book_copies_BranchID) references library_branch (library_branch_BranchID) on update cascade on delete cascade);
                          
create table book_loans (book_loans_LoansID tinyint primary key auto_increment,
                         book_loans_BookID tinyint,
                         book_loans_BranchID tinyint,
                         book_loans_CardNo tinyint,
                         book_loans_DateOut Date,
                         book_loans_DueDate Date,
                         foreign key (book_loans_BookID) references book (book_BookID) on update cascade on delete cascade,
                         foreign key (book_loans_BranchID) references library_branch (library_branch_BranchID) on update cascade on delete cascade,
                         foreign key (book_loans_CardNo) references borrower (borrower_CardNo) on update cascade on delete cascade);
		
insert into publisher values ('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
('Viking', '375 Hudson Street, New York, NY 10014',	'212-366-2000'),
('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
('Chilton Books','Not Available','Not Available'),
('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','-8466'),
('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),
('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','-12006'),
('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
('Chalto & Windus',	'375 Hudson Street, New York, NY 10014','212-366-2000'),
('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
('W.W. Norton','W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');

insert into library_branch (library_branch_BranchName, library_branch_BranchAddress) values ('Sharpstown','32 Corner Road'),('Central','491 3rd Street'),
('Saline','40 State Street'),('Ann Arbor','101 South University');

insert into borrower values (100,'Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
(101,'Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
(102,'Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
(103,'Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
(104,'Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
(105,'Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
(106,'Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
(107,'Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');

insert into book values (1,'The Name of the Wind','DAW Books'),
(2,'It','Viking'),
(3,'The Green Mile','Signet Books'),
(4,'Dune','Chilton Books'),
(5,'The Hobbit','George Allen & Unwin'),
(6,'Eragon','Alfred A. Knopf'),
(7,'A Wise Mans Fear','DAW Books'),
(8,'Harry Potter and the Philosophers Stone','Bloomsbury'),
(9,'Hard Boiled Wonderland and The End of the World','Shinchosa'),
(10,'The Giving Tree','Harper and Row'),
(11,'The Hitchhikers Guide to the Galaxy','Pan Books'),
(12,'Brave New World','Chalto & Windus'),
(13,'The Princess Bride','Harcourt Brace Jovanovich'),
(14,'Fight Club','W.W. Norton'),
(15,'Holes','Scholastic'),
(16,'Harry Potter and the Chamber of Secrets','Bloomsbury'),
(17,'Harry Potter and the Prisoner of Azkaban','Bloomsbury'),
(18,'The Fellowship of the Ring','George Allen & Unwin'),
(19,'A Game of Thrones','Bantam'),
(20,'The Lost Tribe','Picador USA');

insert into book_authors(book_authors_BookID, book_authors_AuthorName) values (1,'Patrick Rothfuss'),
(2,'Stephen King'),
(3,'Stephen King'),
(4,'Frank Herbert'),
(5,'J.R.R. Tolkien'),
(6,'Christopher Paolini'),
(7,'Patrick Rothfuss'),
(8,'J.K. Rowling'),
(9,'Haruki Murakami'),
(10,'Shel Silverstein'),
(11,'Douglas Adams'),
(12,'Aldous Huxley'),
(13,'William Goldman'),
(14,'Chuck Palahniuk'),
(15,'Louis Sachar'),
(16,'J.K. Rowling'),
(17,'J.K. Rowling'),
(18,'J.R.R. Tolkien'),
(19,'George R.R. Martin'),
(20,'Mark Lee');

insert into book_copies (book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies) values (1,1,5),
(2,1,5),
(3,1,5),
(4,1,5),
(5,1,5),
(6,1,5),
(7,1,5),
(8,1,5),
(9,1,5),
(10,1,5),
(11,1,5),
(12,1,5),
(13,1,5),
(14,1,5),
(15,1,5),
(16,1,5),
(17,1,5),
(18,1,5),
(19,1,5),
(20,1,5),
(1,2,5),
(2,2,5),
(3,2,5),
(4,2,5),
(5,2,5),
(6,2,5),
(7,2,5),
(8,2,5),
(9,2,5),
(10,2,5),
(11,2,5),
(12,2,5),
(13,2,5),
(14,2,5),
(15,2,5),
(16,2,5),
(17,2,5),
(18,2,5),
(19,2,5),
(20,2,5),
(1,3,5),
(2,3,5),
(3,3,5),
(4,3,5),
(5,3,5),
(6,3,5),
(7,3,5),
(8,3,5),
(9,3,5),
(10,3,5),
(11,3,5),
(12,3,5),
(13,3,5),
(14,3,5),
(15,3,5),
(1,3,5),
(17,3,5),
(18,3,5),
(19,3,5),
(20,3,5),
(1,4,5),
(2,4,5),
(3,4,5),
(4,4,5),
(5,4,5),
(6,4,5),
(7,4,5),
(8,4,5),
(9,4,5),
(10,4,5),
(11,4,5),
(12,4,5),
(13,4,5),
(14,4,5),
(15,4,5),
(16,4,5),
(17,4,5),
(18,4,5),
(19,4,5),
(20,4,5);

insert into book_loans (book_loans_BookID, book_loans_BranchID,book_loans_CardNo,book_loans_DateOut,book_loans_DueDate) values (1,1,100,'2018-01-01','2018-02-02'),
(2,1,100,'2018-01-02','2018-02-03'),
(3,1,100,'2018-01-03','2018-02-04'),
(4,1,100,'2018-01-04','2018-02-05'),
(5,1,102,'2018-01-05','2018-02-06'),
(6,1,102,'2018-01-06','2018-02-07'),
(7,1,102,'2018-01-07','2018-02-08'),
(8,1,102,'2018-01-08','2018-02-09'),
(9,1,102,'2018-01-09','2018-02-10'),
(11,1,102,'2018-01-10','2018-02-11'),
(12,2,105,'2018-01-11','2018-02-12'),
(10,2,105,'2018-01-12','2018-02-13'),
(20,2,105,'2018-01-13','2018-02-14'),
(18,2,105,'2018-01-14','2018-02-15'),
(19,2,105,'2018-01-15','2018-02-16'),
(19,2,100,'2018-01-16','2018-02-17'),
(11,2,106,'2018-01-17','2018-02-18'),
(1,2,106,'2018-01-18','2018-02-19'),
(2,2,100,'2018-01-19','2018-02-20'),
(3,2,100,'2018-01-20','2018-02-21'),
(5,2,105,'2018-01-21','2018-02-22'),
(4,3,103,'2018-01-22','2018-02-23'),
(7,3,102,'2018-01-23','2018-02-24'),
(17,3,102,'2018-01-24','2018-02-25'),
(16,3,104,'2018-01-25','2018-02-26'),
(15,3,104,'2018-01-26','2018-02-27'),
(15,3,107,'2018-01-27','2018-02-28'),
(14,3,104,'2018-01-28','2018-03-01'),
(13,3,107,'2018-01-29','2018-03-02'),
(13,3,102,'2018-01-30','2018-03-03'),
(19,3,102,'2018-01-31','2018-03-04'),
(20,4,103,'2018-02-01','2018-03-05'),
(1,4,102,'2018-02-02','2018-03-06'),
(3,4,107,'2018-02-03','2018-03-07'),
(18,4,107,'2018-02-04','2018-03-08'),
(12,4,102,'2018-02-05','2018-03-09'),
(11,4,103,'2018-02-06','2018-03-10'),
(9,4,103,'2018-02-07','2018-03-11'),
(7,4,107,'2018-02-08','2018-03-12'),
(4,4,103,'2018-02-09','2018-03-13'),
(1,4,103,'2018-02-10','2018-03-14'),
(20,4,103,'2018-02-11','2018-03-15'),
(1,4,102,'2018-02-12','2018-03-16'),
(3,4,107,'2018-02-13','2018-03-17'),
(18,4,107,'2018-02-14','2018-03-18'),
(12,4,102,'2018-02-15','2018-03-19'),
(11,4,103,'2018-02-16','2018-03-20'),
(9,4,103,'2018-02-17','2018-03-21'),
(7,4,107,'2018-02-18','2018-03-22'),
(4,4,103,'2018-02-19','2018-03-23'),
(1,4,103,'2018-02-20','2018-03-24');

select * from book;
select * from book_loans;
select * from book_copies;
select * from book_authors;
select * from borrower;
select * from library_branch;
select * from publisher;

-- 1 
select library_branch_BranchName,book_Title,book_copies_No_Of_Copies 
from (select bc.*,b.book_Title,lb.library_branch_BranchName  from book_copies bc
left join book b
on b.book_BookID=bc.book_copies_BookID
left join library_branch lb
on bc.book_copies_BranchID=lb.library_branch_BranchID) as new 
where library_branch_BranchName='Sharpstown' and book_Title='The Lost Tribe';

-- 2
select book_Title,library_branch_BranchName,book_copies_No_Of_Copies
from (select bc.*,b.book_Title,lb.library_branch_BranchName  from book_copies bc
left join book b
on b.book_BookID=bc.book_copies_BookID
left join library_branch lb
on bc.book_copies_BranchID=lb.library_branch_BranchID) as new 
where book_Title='The Lost Tribe';

-- 3
select * from (select b.borrower_CardNo,borrower_BorrowerName,book_loans_BookID
from borrower b
left join book_loans bl
on b.borrower_CardNo=bl.book_loans_CardNo) as new where book_loans_BookID is null;

-- 4
select * from 
(select bl.book_loans_DueDate,library_branch_BranchName,book_Title,borrower_BorrowerName,borrower_BorrowerAddress
from book_loans bl
left join book b 
on b.book_BookID=bl.book_loans_BookID
left join borrower bo
on bo.borrower_CardNo=bl.book_loans_CardNo
left join library_branch lb
on lb.library_branch_BranchID=bl.book_loans_BranchID) as new
where library_branch_BranchName='Sharpstown' and book_loans_DueDate='2018-03-02';

-- 5 
select library_branch_BranchName,count(library_branch_BranchName) as Total_No_Of_Books_Loaned from
(select library_branch_BranchName
from book_loans bl
left join library_branch lb
on lb.library_branch_BranchID=bl.book_loans_BranchID) as new group by library_branch_BranchName;

-- 6
with cte as 
(select borrower_BorrowerName,borrower_BorrowerAddress
from book_loans bl
left join book b 
on b.book_BookID=bl.book_loans_BookID
left join borrower bo
on bo.borrower_CardNo=bl.book_loans_CardNo)
select borrower_BorrowerName,borrower_BorrowerAddress,count(*) as No_of_books_borrowed from cte group by borrower_BorrowerName,borrower_BorrowerAddress;

-- 7
with cte as 
(select book_authors_AuthorName,library_branch_BranchName,book_Title,book_copies_No_Of_Copies
from book_copies bc
left join library_branch lb
on bc.book_copies_BranchID=lb.library_branch_BranchID
left join book b
on b.book_BookID=bc.book_copies_BookID
left join book_authors ba
on ba.book_authors_BookID=b.book_BookID)
select * from cte 
where book_authors_AuthorName='Stephen King' and library_branch_BranchName='Central';
