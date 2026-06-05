-- SQL code to create table of States

CREATE TABLE States (
    State_ID text PRIMARY KEY NOT NULL ,
    State_Name TEXT
);

-- SQL code to create table of Statewise_Results

CREATE TABLE Statewise_Results (
    State_ID text,
    State_Name TEXT,
    Constituency TEXT,
    Const_No INT,
    Parliament_Constituency TEXT primary key not null,
    Leading_Candidate TEXT,
    Trailing_Candidate TEXT,
    Margin INT,
    Status text,
    foreign key (State_ID) references States(State_ID)
);

-- SQL code to create table of Partywise_Results

CREATE TABLE Partywise_Results (
    Party_ID INT primary key not null,
    Party_Name TEXT,
    Won INT
);

-- SQL code to create table of Constituencywise_Results

CREATE TABLE Constituencywise_Results (
    No_of_Seats INT,
    Parliament_Constituency text,
    Party_ID int,
    Constituency_ID text primary key not null,
    Constituency_Name text,
    Winning_Candidate text,
    Total_Votes INT,
    Margin INT,
    foreign key (Parliament_Constituency) references Statewise_Results(Parliament_Constituency),
    foreign key (Party_ID) references Partywise_Results(Party_ID)
);

-- SQL code to create table of Constituencywise_Details

CREATE TABLE Constituencywise_Details (
    No_of_Seats INT,
    Candidate_Name text,
    Party_Name text,
    EVM_Votes INT,
    Postal_Votes INT,
    Total_Votes INT,
    Percent_of_Votes numeric,
    Constituency_ID text,
    foreign key (Constituency_ID) references Constituencywise_Results(Constituency_ID)
);