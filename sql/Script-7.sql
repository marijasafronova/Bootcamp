SELECT * FROM tracks t;

SELECT * FROM playlist_track pt ;

SELECT * FROM invoice_items ii ;

--first task
SELECT * FROM tracks t
WHERE EXISTS (
		SELECT '1' FROM playlist_track pt
		WHERE pt.TrackId = t.TrackId
		)
ORDER BY Name ASC;

--second task
SELECT * FROM tracks t
WHERE EXISTS (
		SELECT '1' FROM invoice_items ii 
		WHERE ii.TrackId = t.TrackId);



