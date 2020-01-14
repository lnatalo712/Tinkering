-- Create a new database called 'Tinkering'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
  SELECT name
    FROM sys.databases
    WHERE name = N'Tinkering'
)
CREATE DATABASE Tinkering
GO

-- Create a new table called 'Quotee' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('Tinkering.dbo.Quotee', 'U') IS NOT NULL
DROP TABLE Tinkering.dbo.Quotee
GO
-- Create the table in the specified schema
CREATE TABLE Tinkering.dbo.Quotee
(
  QuoteeId INT NOT NULL PRIMARY KEY, -- primary key column
  FullName [NVARCHAR](50),
  Quote [NVARCHAR](200)
);
GO

-- Insert rows into table 'Quotee'
INSERT INTO Tinkering.dbo.Quotee
   ([QuoteeId], [FullName], [Quote])
VALUES
  (0, 'Mother Teresa', 'Spread love everywhere you go. Let no one ever come to you without leaving happier.'),
  (1, 'Franklin D. Roosevelt', 'When you reach the end of your rope, tie a knot in it and hang on.'),
  (2, 'Margaret Mead', 'Always remember that you are absolutely unique. Just like everyone else.'),
  (3, 'Robert Louis Stevenson', 'Don''t judge each day by the harvest you reap but by the seeds that you plant.'),
  (4, 'Eleanor Roosevelt', 'The future belongs to those who believe in the beauty of their dreams.'),
  (5, 'Benjamin Franklin', 'Tell me and I forget. Teach me and I remember. Involve me and I learn.'),
  (6, 'Helen Keller', 'The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.'),
  (7, 'Aristotle', 'It is during our darkest moments that we must focus to see the light.'),
  (8, 'Anne Frank', 'Whoever is happy will make others happy too.'),
  (9, 'Ralph Waldo Emerson', 'Do not go where the path may lead, go instead where there is no path and leave a trail.'),
  (10, 'Maya Angelou', 'You will face many defeats in life, but never let yourself be defeated.'),
  (11, 'Nelson Mandela', 'The greatest glory in living lies not in never falling, but in rising every time we fall.'),
  (12, 'Abraham Lincoln', 'In the end, it''s not the years in your life that count. It''s the life in your years.'),
  (13, 'Babe Ruth', 'Never let the fear of striking out keep you from playing the game.'),
  (14, 'Thomas A. Edison', 'Many of life''s failures are people who did not realize how close they were to success when they gave up.'),
  (15, 'Dr. Seuss', 'You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.'),
  (16, 'Oscar Wilde', 'Life is never fair, and perhaps it is a good thing for most of us that it is not.'),
  (17, 'Tony Robbins', 'The only impossible journey is the one you never begin.'),
  (18, 'Dalai Lama', 'The purpose of our lives is to be happy.'),
  (19, 'John Lennon', 'Life is what happens when you''re busy making other plans.')
GO
-- Query the total count of quotees
SELECT COUNT(*) as QuoteeCount FROM Tinkering.dbo.Quotee;
-- Query all quotee information
SELECT *
FROM Tinkering.dbo.Quotee
GO
