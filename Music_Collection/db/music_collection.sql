DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  --first_name VARCHAR(255),
  name VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT8 REFERENCES artists(id)
);

--You have been asked to create an app that will allow a music collector to manage their collection of CDs/records.

--In their console they would like to be able to:

--Create and Save Artists
--Create and Save Albums
--List All Artists/Albums
--List all the albums they have by an artist
--Show the artist any album belongs to
--Every artist should have a name, and each album should have a name/title, genre and artist ID.
