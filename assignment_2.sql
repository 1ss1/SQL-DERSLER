 -- 1)
/*How many tracks does each album have? 
Your solution should include Album id and its number of tracks sorted from highest to lowest.*/

SELECT AlbumId, count(name) as single_count
FROM tracks
group by AlbumId
order by single_count desc;

-- 2)
/*Find the album title of the tracks. 
Your solution should include track name and its album title.*/

SELECT * FROM tracks;
SELECT * FROM albums;

SELECT tracks.name, albums.Title
FROM tracks 
JOIN albums
ON  albums.AlbumId= tracks.AlbumId;


-- 3)
/*Find the minimum duration of the track in each album. Your solution should include album id, 
album title and duration of the track sorted from highest to lowest.*/

SELECT * FROM tracks;
SELECT * FROM albums;

SELECT tracks.AlbumId, tracks.name as single_name, 
albums.Title, 
min(tracks.Milliseconds) as min_duration
FROM tracks 
JOIN albums
ON  albums.AlbumId= tracks.AlbumId
GROUP by albums.Title
ORDER by tracks.AlbumId DESC;

-- 4)
/*Find the total duration of each album. Your solution should include album id, 
album title and its total duration sorted from highest to lowest.*/

SELECT a.AlbumId, a.Title,  
sum(t.Milliseconds) as sum_duration
FROM tracks t
JOIN albums a
ON  a.AlbumId= t.AlbumId
GROUP by t.AlbumId
ORDER by sum_duration DESC;




-- 5)
/*Based on the previous question, find the albums whose total duration is higher than 70 minutes. 
Your solution should include album title and total duration.*/

SELECT * FROM tracks;
SELECT * FROM albums;

SELECT a.Title,  
sum(t.Milliseconds) as sum_duration
FROM tracks t
JOIN albums a
ON  a.AlbumId= t.AlbumId
GROUP by t.AlbumId
HAVING sum_duration > 4200000
ORDER by sum_duration DESC;
