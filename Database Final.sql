-- Ronald Cavaliere --
--Database Management Design Project--
--Alan Labouseur--
--May 2, 2017--


				-- MLB American League ALL-STAR SELECTION --

DROP TABLE IF EXISTS People cascade; 
DROP TABLE IF EXISTS PlayersData cascade; 
DROP TABLE IF EXISTS CoachesData cascade; 
DROP TABLE IF EXISTS TeamData cascade;
DROP TABLE IF EXISTS TeamPositionData cascade; 
DROP TABLE IF EXISTS PositionData cascade; 
DROP TABLE IF EXISTS PlayerPositionData cascade; 
DROP TABLE IF EXISTS NumbersData cascade; 
DROP TABLE IF EXISTS HittingData cascade; 
DROP TABLE IF EXISTS FieldingData cascade; 
DROP TABLE IF EXISTS PitchingData cascade;
DROP VIEW IF EXISTS Hitters cascade;
DROP VIEW IF EXISTS Fielders cascade; 
DROP VIEW IF EXISTS Pitchers cascade;


--Table Statements--


--People--


CREATE TABLE People (
  Pid          varchar(10) not null unique,
  LastName     text not null, 
  FirstName    text not null,
  Address      varchar, 
  DateOfBirth  date,
  primary key (Pid)
);


-- TeamData --

 
CREATE TABLE TeamData (
  TeamID            varchar(10) not null,
  TeamName	     text not null,    
  City              text not null,
  State             text not null,
  Division          text not null,
 primary key (TeamID)
);


-- PlayersData --


CREATE TABLE PlayersData (
  Aid        	    varchar(10) not null references People (Pid),
  TeamID	    varchar(10) not null references TeamData (TeamID),
  HeightInches      integer not null, 
  WeightPounds      integer not null,
  Nationality       text not null,
  Experience        integer not null,
 primary key (Aid)
); 


-- CoachesData --


CREATE TABLE CoachesData (
  Cid                     varchar(10) not null references People (Pid),
  TeamID	          varchar(10) not null references TeamData (TeamID),
  CoachPosition           text,
  CoachingExperience      text,
 primary key (Cid)
);       


-- PositionData --


CREATE TABLE PositionData (
  PositionID	    text not null,
  PositionName	    text not null,
 primary key (PositionID)
);


-- TeamPositionData --


CREATE TABLE TeamPositionData (
  TeamID            varchar(10) not null references TeamData (TeamID),
  PositionID	    text not null references PositionData (PositionID),
 primary key (TeamID, PositionID)
);


-- PlayersPositionData --


CREATE TABLE PlayerPositionData (
  Aid         	    varchar(10) not null references PlayersData (Aid),
  PositionID	    text not null references PositionData (PositionID),
 primary key (Aid, PositionID) 
);


-- HittingData --


CREATE TABLE HittingData (
  Aid	            varchar(10) not null references PlayersData (Aid),
  PositionID	    text not null references PositionData (PositionID) check (PositionID = 'H'),
  Homeruns 	    integer,
  BaseHits 	    integer,
  RBIs 	    	    integer,
  AVG 	            varchar(10),
  ExtraBaseHits     integer,
  TotalAtBats       integer,
  TotalHits         integer,
 primary key (Aid, PositionID)
);


-- FieldingData --


CREATE TABLE FieldingData (
  Aid	            varchar(10) not null references PlayersData (Aid),
  PositionID	    text not null references PositionData (PositionID) check (PositionID = 'P' or PositionID = 'C' or PositionID = '1B' or PositionID = '2B' or PositionID = '3B' or PositionID = 'SS' or PositionID = 'LF' or PositionID = 'CF' or PositionID = 'RF'),
  Putouts 	    integer,
  Assists	    integer,
  Errors	    integer,
  FieldingPercentage varchar(10),
 primary key (Aid, PositionID)
);


-- PitchingData --


CREATE TABLE PitchingData (
  Aid	            varchar(10) not null references PlayersData (Aid),
  PositionID	    text not null references PositionData (PositionID) check (PositionID = 'P'),
  Wins 	            integer,
  Losses 	    integer,
  ERA 	            varchar(10),
  BattingAVGAgainst varchar(10),
  Strikeouts        integer,
  Walks             integer,
 primary key (Aid, PositionID)
);


commit;


-- Insert Statements --


-- People --


INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p01', 'Jeter', 'Derek', '475 Atlantic Ave', '7-29-66');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p02', 'Perez', 'Salvador', '37 Walnut Road', '2-15-72');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p03', 'Hosmer', 'Eric', '189 Cherry Lane', '9-26-83');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p04', 'Altuve', 'Jose', '28 Allstar Court', '4-21-89');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p05', 'Machado', 'Manny', '83 Braham Street', '1-30-80');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p06', 'Trout', 'Mike', '3 Jersey Road', '9-17-91');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p07', 'Betts', 'Mookie', '738 North Ave', '12-13-86');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p08', 'Lindor', 'Fransisco', '827 South Lane', '3-22-88');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p09', 'Beltran', 'Carlos', '45 West Road', '10-5-83');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p10', 'Trumbo', 'Mark', '91 East Street', '8-24-84');
  
INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p11', 'Cavaliere', 'Ron', '47 Braham Ave', '11-6-95');
  
INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p12', 'Harris', 'Mark', '39 Soccer Street', '8-19-93');
  
INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p13', 'Nemergut', 'Paul', '90 Frisbee Court', '3-3-88');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p14', 'Colatosti', 'Ron', '27 Oak Street', '6-12-91');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p15', 'Graham', 'Zach', '384 Delafield Road', '8-31-83');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p16', 'Salonia', 'Joe', '782 House Block', '2-17-52');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p17', 'Sale', 'Chris', '38 Pacific Street', '7-19-90');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p18', 'Hamels', 'Cole', '29 Indian Ave', '1-9-87');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p19', 'Cano', 'Robinson', '36 Palace Road', '4-18-85');

INSERT INTO People( Pid, LastName, FirstName, Address, DateOfBirth )
  VALUES          ('p20', 'Girardi', 'Joe', '19 Sunrise Ave', '5-11-49');


-- TeamData --


INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c01','New York Yankees', 'Bronx','New York','American League East');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c02','Boston Red Sox', 'Boston','Massachusetts','American League East');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c03','Cleveland Indians', 'Cleveland','Ohio','American League Central');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c04','Toronto Blue Jays', 'Toronto','Canada','American League East');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c05','Baltimore Orioles', 'Baltimore','Maryland','American League East');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c06','Texas Rangers', 'Arlington','Texas','American League West');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c07','Kansas City Royals', 'Kansas City','Missouri','American League Central');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c08','Los Angeles Angels', 'Anaheim','California','American League West');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c09','Chicago White Sox', 'Chicago','Illinois','American League Central');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c10','Oakland Athletics', 'Oakland','California','American League West');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c11','Houston Astros', 'Houston','Texas','American League West');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c12','Seattle Mariners', 'Seattle','Washington','American League West');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c13','Minnesota Twins', 'Minneapolis','Minnesota','American League Central');

INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c14','Tampa Bay Rays', 'Tampa','Florida','American League East');
  
INSERT INTO TeamData( TeamID, TeamName, City, State, Division )
  VALUES                ('c15','Detroit Tigers', 'Detroit','Michigan','American League Central');

  
-- PlayersData --


INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience)
  VALUES            ('p01', 'c01', '71', '175', 'American', '15');  

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience)
  VALUES            ('p02', 'c07', '74', '215', 'Dominican Republican', '8'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p03', 'c06', '72', '187', 'American', '9'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p04', 'c09', '77', '192', 'Mexican', '5');

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p05', 'c12', '73', '188', 'Korean', '7');  

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p06', 'c05', '75', '168', 'Brazilian', '10'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p07', 'c08', '72', '192', 'American', '6'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p08', 'c12', '72', '183', 'American', '3'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p09', 'c10', '73', '177', 'Cuban', '1'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p10', 'c03', '68', '1215', 'British', '5'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p11', 'c09', '71', '199', 'Spanish', '10'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p13', 'c11', '70', '180', 'American', '2'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p15', 'c06', '75', '210', 'Norwegian', '8'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p17', 'c14', '73', '192', 'Irish', '10'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p18', 'c05', '77', '195', 'Italian', '9'); 

INSERT INTO PlayersData( Aid, TeamID, HeightInches, WeightPounds, Nationality, Experience )
  VALUES            ('p19', 'c06', '69', '168', 'Canadian', '8'); 


-- CoachesData --


INSERT INTO CoachesData( Cid, TeamID, CoachPosition, CoachingExperience )
  VALUES            ('p12', 'c01', 'Head Coach', '25 Years' );

INSERT INTO CoachesData( Cid, TeamID, CoachPosition, CoachingExperience )
  VALUES            ('p14', 'c07', 'Head Coach', '5 Years' );

INSERT INTO CoachesData( Cid, TeamID, CoachPosition, CoachingExperience )
  VALUES           ('p16', 'c13', 'Head Coach', '17 Years' );

INSERT INTO CoachesData( Cid, TeamID, CoachPosition, CoachingExperience )
  VALUES           ('p20', 'c04', 'Head Coach', '9 Years' );


-- PositionData --


INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('H', 'HittingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('P', 'PitchingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('C', 'FieldingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('1B', 'FieldingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('2B', 'FieldingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('3B', 'FieldingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('SS', 'FieldingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('LF', 'FieldingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('CF', 'FieldingData' );

INSERT INTO PositionData(PositionID, PositionName )
  VALUES            ('RF', 'FieldingData' );


-- TeamPositionData --


INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c01', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c02', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', '2B');
  
INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c03', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c04', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c05', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c06', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c07', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c08', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c09', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c10', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c11', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c12', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', 'P');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c13', 'RF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', 'H');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', 'P');
  
INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', 'C');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', '1B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', '2B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', '3B');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', 'SS');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', 'LF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', 'CF');

INSERT INTO TeamPositionData(TeamID, PositionID)
  VALUES                 ('c14', 'RF');


-- PlayerPositionData --


INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p01', 'C');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p01', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p02', '1B');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p02', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p03', '2B');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p03', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p04', '3B');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p04', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p05', 'SS');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p05', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p06', 'LF');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p06', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p07', 'CF');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p07', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p08', 'RF');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p08', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p09', 'LF');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p09', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p10', 'CF');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p10', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p11', 'RF');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p11', 'H');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p13', 'P');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p15', 'P');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p17', 'P');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p18', 'P');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p19', 'C');

INSERT INTO PlayerPositionData(AID, PositionID)
  VALUES                   ('p19', 'H');


-- Hitting Data --


INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p01', 'H', '50', '100', '115', '.350', '20', '500', '300');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p02', 'H', '22', '85', '105', '.400', '13', '450', '250');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p03', 'H', '15', '90', '86', '.300', '20', '400', '180');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p04', 'H', '9', '99', '75', '.250', '15', '427', '150');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p05', 'H', '2', '205', '115', '.405', '23', '475', '265');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p06', 'H', '38', '79', '110', '.292', '29', '432', '203');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p07', 'H', '13', '95', '88', '.305', '35', '435', '186');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p08', 'H', '21', '69', '27', '.200', '5', '315', '87');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p09', 'H', '2', '55', '43', '.300', '10', '300', '99');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p10', 'H', '45', '125', '119', '.315', '33', '445', '204');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p11', 'H', '7', '102', '90', '.290', '9', '379', '147');

INSERT INTO HittingData(Aid, PositionID, Homeruns, BaseHits, RBIs, AVG, ExtraBaseHits, TotalAtBats, TotalHits)
  VALUES                  ('p19', 'H', '18', '64', '172', '.333', '6', '385', '125');

-- Fielding Data --

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p01', 'C',  '50', '45', '5', '.975'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p02', '1B',  '75', '78', '5', '.975'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p03', '2B',  '63', '42', '0', '1.000'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p04', '3B',  '77', '39', '3', '.970'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p05', 'SS',  '95', '74', '4', '.790'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p06', 'LF',  '70', '45', '21', '.735'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p07', 'CF',  '63', '80', '3', '.835'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p08', 'RF',  '129', '32', '1', '.999'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p09', 'LF',  '100', '93', '9', '.900');

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p10', 'CF',  '93', '23', '2', '.969');  

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p11', 'RF',  '74', '63', '7', '.889'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p13', 'P',  '43', '59', '19', '.763'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p15', 'P',  '78', '35', '8', '.910'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p17', 'P',  '94', '68', '1', '.995'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p18', 'P',  '53', '39', '15', '.805'); 

INSERT INTO FieldingData(Aid, PositionID, Putouts, Assists, Errors, FieldingPercentage)
  VALUES                  ('p19', 'C',  '22', '95', '10', '.855'); 

-- PitchingData --

INSERT INTO PitchingData(Aid, PositionID, Wins, Losses, ERA, BattingAvgAgainst, Strikeouts, Walks)
  VALUES                  ('p13', 'P', '10', '2', '2.15', '.195', '101', '15'); 

INSERT INTO PitchingData(Aid, PositionID, Wins, Losses, ERA, BattingAvgAgainst, Strikeouts, Walks)
  VALUES                  ('p15', 'P', '8', '8', '3.25', '.210', '64', '9'); 

INSERT INTO PitchingData(Aid, PositionID, Wins, Losses, ERA, BattingAvgAgainst, Strikeouts, Walks)
  VALUES                  ('p17', 'P', '5', '9', '3.60', '.230', '59', '12'); 

INSERT INTO PitchingData(Aid, PositionID, Wins, Losses, ERA, BattingAvgAgainst, Strikeouts, Walks)
  VALUES                  ('p18', 'P', '7', '3', '3.04', '.215', '62', '7'); 

commit;


--Views--

-- Hitters -- 

CREATE VIEW Hitters AS
select distinct p.pid, p.lastName, p.firstName, pod.positionID, td.TeamName
from PlayersData pd, playerpositiondata ppd, People p, PositionData pod, TeamPositionData tp, TeamData td
where pod.positionId = tp.positionID
	and tp.positionID = ppd.positionID
	and ppd.aid = pd.aid
	and pd.aid = p.pid
	and td.teamID = pd.teamID
	and pod.positionName = 'HittingData'
order by pid ASC;

Select * 
from Hitters;

-- Fielders --

CREATE VIEW Fielders AS
select distinct p.pid, p.lastName, p.firstName, pod.positionID, td.TeamName
from PlayersData pd, playerpositiondata ppd, People p, PositionData pod, TeamPositionData tp, TeamData td
where pod.positionId = tp.positionID
	and tp.positionID = ppd.positionID
	and ppd.aid = pd.aid
	and pd.aid = p.pid
	and td.TeamID = pd.TeamID
	and (pod.positionName = 'FieldingData'
	OR pod.positionName = 'PitchingData')
order by pid ASC;

Select *
from Fielders;

-- Pitchers --

CREATE VIEW Pitchers AS
select distinct p.pid, p.lastName, p.firstName, pod.positionID, td.TeamName
from PlayersData pd, playerpositiondata ppd, People p, PositionData pod, TeamPositionData tp, TeamData td
where pod.positionId = tp.positionID
	and tp.positionID = ppd.positionID
	and ppd.aid = pd.aid
	and pd.aid = p.pid
	and td.TeamID = pd.TeamID
	and pod.positionName = 'PitchingData'
order by pid ASC;

Select *
from Pitchers;
commit;


----Stored Procedures---

		
-- Stored precedure: Hitting Data -- 
create or replace function HittingData(text, text,REFCURSOR) returns refcursor as $$
declare
   PlayerLastName   		text       := $1;
   PlayerFirstName  		text       := $2;
   answerset           	REFCURSOR  := $3;
begin
   open answerset for 
      select distinct p.lastname,p.firstname, td.TeamName, hd.*
      from HittingData hd, people p, TeamData td, PLayersData pd
      where hd.aid = p.pid
           and p.lastName LIKE LastName
           and p.firstName LIKE FirstName
           and hd.aid = pd.aid
           and pd.aid = p.pid
           and pd.TeamID = td.TeamID
       order by Homeruns Desc;
    return answerset;
end;
$$ 
language plpgsql;

select HittingData('L%', 'J%','answers');
fetch all from answers;

-- Stored Procedure: Positions --

create or replace function Get_Position_Player(text,REFCURSOR) returns refcursor as $$
declare
   Position     	  text       :=  $1;
   answerset   	          REFCURSOR   := $2;
begin
   open answerset for 
      select distinct fd.aid, p.lastName, p.firstName, fd.positionID, td.TeamName
      from FieldingData fd, People p, TeamData td, PlayersData pd
      where fd.aid = pd.aid
         and pd.aid = p.pid
         and td.teamID = pd.teamID
         and fd.positionID = Position
       order by aid ASC;
    return answerset;
end;
$$ 
language plpgsql;

select Get_Position_Player('C', 'answers2');
fetch all from answers2;


-- Get Players by Team --
create or replace function Get_Player_by_Team(text,REFCURSOR) returns refcursor as $$
declare
   TeamNameInt       	text       :=  $1;
   answerset            REFCURSOR  :=  $2;
begin
   open answerset for 
      select distinct pd.aid, p.lastName, p.firstName
      from People p, TeamData td, PlayersData pd
      where pd.teamID = td.teamID
	and p.pid = pd.aid 
        and td.teamName Like TeamNameInt
      order by aid ASC;
   return answerset;
end;
$$ 
language plpgsql;

select Get_Player_by_Team('Baltimore Orioles', 'answers3');
Fetch all from answers3;


		----Reports----
		
-- Report: Top Franchise --
select distinct p.pid, p.lastName, p.firstName, td.TeamName, td.Division, pd.heightInches, pd.weightPounds
from PlayersData pd, TeamData td, People p
where p.pid = pd.aid
     and td.TeamID = pd.TeamID
     and td.TeamName IN (select distinct td.TeamName
                            from TeamData td
                            where  td.TeamName IN ('New York Yankees', 'Oakland Athletics', 'Boston Red Sox', 'Toronto BLue Jays', 'Baltimore Orioles')
                        )
Order by td.TeamName;

-- Report: 5+ Years of Experience --
select p.*, td.TeamName, pd.Experience
from people p, PlayersData pd, TeamData td
where pid = aid
   and td.TeamID = pd.TeamID
   and pd.Experience  >  5;

commit;

	-- Roles --
-- MLB Back Office --
create role MLB_Back_Office;
grant select, insert, update
on all tables in schema public
to MLB_Back_Office;

-- American League -- 
create role American_League_Administration;
grant select, insert, update 
on all tables in schema public
to American_League_Administration;

-- MLB Coaches -- 
create role MLB_Coaches;
grant select
on all tables in schema public
to MLB_Coaches;

-- MLB Players --
create role MLB_Players;
grant select
on all tables in schema public
to MLB_Players;
