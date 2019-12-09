DROP TABLE QUOTEE CASCADE CONSTRAINTS;

CREATE TABLE QUOTEE(
  QuoteeId NUMBER(3),
  FName VARCHAR2(20),
  MName VARCHAR2(20),
  LName VARCHAR2(20),
  Quote VARCHAR2(200),
  CONSTRAINT Quotee_Id PRIMARY KEY (QuoteeId)
);

INSERT INTO Quotee VALUES
(1, 'Mother', NULL, 'Teresa', 'Spread love everywhere you go. Let no one ever come to you without leaving happier.');

INSERT INTO Quotee VALUES
(2, 'Franklin', 'D.', 'Roosevelt', 'When you reach the end of your rope, tie a knot in it and hang on.');

INSERT INTO Quotee VALUES
(3, 'Margaret', NULL, 'Mead', 'Always remember that you are absolutely unique. Just like everyone else.');

INSERT INTO Quotee VALUES
(4, 'Robert', 'Louis', 'Stevenson', 'Don\'t judge each day by the harvest you reap but by the seeds that you plant.');

INSERT INTO Quotee VALUES
(5, 'Eleanor', NULL, 'Roosevelt', 'The future belongs to those who believe in the beauty of their dreams.');
