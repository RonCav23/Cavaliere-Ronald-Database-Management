--Ronald Cavaliere--
--Lab #8--
--4/28/2017--
--SQL Statements--

Drop table if exists PeopleData, ActorData, DirectorData, MovieActors, MovieDirectors, Moviedata;

Create Table PeopleData (
			pid		integer not null,
			firstName 	text not null,
			lastName	text not null,
			spouseName	text,
			address		varchar,
	primary key (pid)
			);

Create Table ActorData (
			pid			integer not null references People(pid),
			DOB			date,
			SAGAnniversaryDate	date, 
			heightInches		integer,
			weightLBS		integer, 
			hairColor		text,
			eyeColor		text,
			favoriteColor		text,
	primary key (pid)
			);

Create Table DirectorData (
			pid 			integer not null references People(pid),
			filmSchoolAttended	text,
			DGAnniversaryDate	date,
			favoriteLensMaker	text,
	primary key (pid)
			);

Create Table MovieData (
			mid			integer not null,
			movieTitle		text not null,
			releaseDate		date,
			totalSalesUSD		numeric,
			USDomesticBoxOfficeUSD	numeric,
			foreignBoxOfficeUSD	numeric,
			DVDBlueRaySalesUSD	numeric,
	primary key (mid)
			);

Create table MovieActor (
			pid			integer not null references People(pid),
			mid			integer not null references Movie(mid),
	primary key (pid, mid)
			);

Create table MovieDirectors (
			pid			integer not null references People(pid),
			mid			integer not null references Movie(mid),
	primary key (pid,mid)
			);

--Insert Statements:  PeopleData Table--

Insert into peopledata (pid, firstName, lastName, SpouseName, address)
	    values (1001, 'Mark',   'Wahlberg', 'Isabella',   '708 Harvard Ln, Boston, MA, 67382');

Insert into peopledata (pid, firstName, lastName, SpouseName, address)
	    values (1002, 'Ben',   'Affleck', 'Jennifer',   '189 Smith St, Berkely, CA, 90374');

Insert into peopledata (pid, firstName, lastName, SpouseName, address)
	    values (1003, 'Mel',   'Gibson', 'Taylor',   '4 Braveheart Ave, Southampton, NY, 11846');

Insert into peopledata (pid, firstName, lastName, SpouseName, address)
	    values (1004, 'Ron',   'Cavaliere', 'Nina',    '47 Serene Ave, Amityville, NY, 18940');

Insert into peopledata (pid, firstName, lastName, SpouseName, address)
	    values (1005, 'Daniel',   'Craig',  'Olivia',   '837 Casino Royale Court, Badass, TX, 27836');

Insert into peopledata (pid, firstName, lastName, SpouseName, address)
	    values (1006, 'Sean', 'Connery', 'Meghan', '47 Connery St, Hall of Fame, Fl, 00090');

--Insert Statements: ActorData Table--

Insert into actordata (pid, DOB, SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1001, '2-15-1975',  '11-10-2016', 68, 175, 'brown', 'brown', 'blue' );

Insert into actordata (pid, DOB, SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1002, '12-8-1983', '6-30-2005', 71, 215, 'brown', 'brown', 'purple' );

Insert into actordata (pid, DOB, SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1003, '1-21-1958', '2-5-1996', 74, 195, 'brown', 'blue', 'black' );

Insert into actordata (pid, DOB, SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1004, '10-6-1995', '7-23-2015', 78, 225, 'blonde', 'blue', 'red' );	    

Insert into actordata (pid, DOB, SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1005, '3-10-1940', '9-19-1985', 63, 168, 'black','red', 'black' );

--Insert Statements: DirectorData table--

Insert into directordata (pid, filmSchoolAttended, DGAnniversaryDate, favoriteLensMaker)
	    values    (1001, 'Julliard','4-23-2001','Olympus');

Insert into directordata (pid, filmSchoolAttended, DGAnniversaryDate, favoriteLensMaker)
	    values    (1002, 'VCU','8-15-1995', 'Zeiss');

Insert into directordata (pid, filmSchoolAttended, DGAnniversaryDate, favoriteLensMaker)
	    values    (1003, 'Gibson Home School','1-1-1992','TMels');

Insert into directordata (pid, filmSchoolAttended, DGAnniversaryDate, favoriteLensMaker)
	    values    (1006, 'Connery School of Film','2-2-1968','Cavalieres Lenses');

--Insert Statements: MovieData table--

Insert into moviedata (mid, movieTitle, releaseDate, totalSalesUSD, USDomesticBoxOfficeUSD, foreignBoxOfficeUSD, DVDBlueRaySalesUSD)
	    values(1,  'Life as a database manager', '11-06-2005', 178203890948, 773647829, 378901000, 56378400);

Insert into moviedata (mid, movieTitle, releaseDate,  totalSalesUSD, USDomesticBoxOfficeUSD, foreignBoxOfficeUSD, DVDBlueRaySalesUSD)
	    values(2,  'Alans Life', '2-22-1997', 178393098498930, 277849485739, 37375985904673, 838385933);

Insert into moviedata (mid, movieTitle, releaseDate,  totalSalesUSD, USDomesticBoxOfficeUSD, foreignBoxOfficeUSD, DVDBlueRaySalesUSD)
	    values(3,  'Titanic', '2-21-1997',  20000, 283000, 7035662, 72849);

Insert into moviedata (mid, movieTitle, releaseDate,  totalSalesUSD, USDomesticBoxOfficeUSD, foreignBoxOfficeUSD, DVDBlueRaySalesUSD)
	    values(4,  'Programming is Life', '7-17-2012', 367458000000, 38358000000, 2738500000, 2748200000);

--Insert Statements: movieActors--

Insert into movieActors (pid, mid)
	    values      (1001, 1);

Insert into movieActors (pid, mid)
	    values      (1001, 3);

Insert into movieActors (pid, mid)
	    values      (1002, 2);

Insert into movieActors (pid, mid)
	    values      (1003, 4);

Insert into movieActors (pid, mid)
	    values      (1004, 1);

Insert into movieActors (pid, mid)
	    values      (1004, 4);

Insert into movieActors (pid, mid)
	    values      (1005, 2);

--movieDirectors--

Insert into movieDirectors (pid, mid)
	    values         (1002, 4);

Insert into movieDirectors (pid, mid)
	    values         (1006, 2);

Insert into movieDirectors (pid, mid)
	    values         (1006, 1);

Insert into movieDirectors (pid, mid)
	    values         (1007, 3);

Insert into movieDirectors (pid, mid)
	    values         (1007, 3);

--Which directors has actor “Sean Connery” worked with?--

select distinct p_directordata.*
from peopledata p_actors, peopledata p_directors, moviedata m, movieDirectors md, movieActors ma
where m.mid = md.mid
 and md.pid = p_directordata.pid 
 and ma.pid = p_actordata.pid 
 and ma.mid = m.mid
 and p_actors.firstName = 'Sean'
 and p_actors.lastName = 'Connery'
;