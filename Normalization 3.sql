--Ronald Cavaliere--
--Database Management--
--Alan Labouseur--
--04/11/2017--
--Normalization 3--

drop table if exists PeopleData, Playersdata, HCoachData, ACoachData, CoachesData, ACoachTeamData, RosterData, TeamsData, ZipCodeData;

create table PeopleData (
	PeopleID integer not null,
	ZipCode integer not null,
	FirstName text not null,
	LastName text not null,
	Address varchar,
	phoneNumber integer not null,
	primary key (peopleID)
);

create table PlayersData (
	PlayerID integer not null,
	primary key (playerID),
);

create table HCoachData (
	HCoachID integer not null,
	primary key (HCoachID),
);

create table ACoachData (
	ACoachID integer not null,
	primary key (ACoachID),
);

create table CoachesData (
	CoachID integer not null,
	Experience numeric,
	primary key (CoachID),
);

create table ACoachTeamData (
	TeamID integer not null,
	ACoachID integer not null,
	primary key (TeamID,ACoachID)
);

create table RosterData (
	PlayerID integer not null,
	TeamID integer not null,
	primary key (PlayerID,TeamID)
);

create table TeamsData (
	TeamID integer not null,
	HCoachID integer not null,
	Age is ageGroups,
	primary key(teamID)
);

create table ZipCodeData (
	ZipCode integer is not null,
	primary key (ZipCode)
);

create type ageGroups (
	Age numeric,
	'under 10',
	'10 through 14',
	'over 14'
);