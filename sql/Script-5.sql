SELECT * FROM crime_scene_report csr 
LIMIT 20;

SELECT * FROM crime_scene_report csr 
WHERE date = 20180115
AND type = 'murder'
AND city = 'SQL City';

--Security footage shows that there were 2 witnesses. 
--The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- we need to find the witnesses
SELECT * FROM person p
WHERE address_street_name LIKE "Northwestern%"
ORDER BY address_number DESC
LIMIT 1;
--subquery to get an id of a first witness
SELECT *FROM interview i 
WHERE i.person_id = (
SELECT id FROM person p
WHERE address_street_name LIKE "Northwestern%"
ORDER BY address_number DESC
LIMIT 1);


--I heard a gunshot and then saw a man run out. 
--He had a "Get Fit Now Gym" bag. 
--The membership number on the bag started with "48Z". 
--Only gold members have those bags. 
--The man got into a car with a plate that included "H42W".

SELECT * FROM get_fit_now_member gfnm 
WHERE id LIKE '48Z%'
AND membership_status  = 'gold';

SELECT * FROM drivers_license dl 
WHERE plate_number LIKE '%H42W%';

SELECT * FROM person p
JOIN drivers_license dl 
ON p.license_id =dl.id 
WHERE plate_number LIKE '%H42W%';

SELECT * FROM interview i 
WHERE i.person_id = (
SELECT p.id  FROM person p
JOIN drivers_license dl 
ON p.license_id = dl.id 
JOIN get_fit_now_member gfnm 
ON p.id = gfnm.person_id 
WHERE dl.plate_number LIKE '%H42W%'
AND gfnm.id LIKE '48Z%'
AND membership_status = 'gold'
);

--I was hired by a woman with a lot of money. 
--I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
--She has red hair and she drives a Tesla Model S. 
--I know that she attended the SQL Symphony Concert 3 times in December 2017.

--Second witness named Annabel, lives somewhere on "Franklin Ave".

SELECT * FROM person p 
WHERE name LIKE 'Annabel%'
AND address_street_name = 'Franklin Ave';

SELECT * FROM interview i 
WHERE i.person_id = (
SELECT id FROM person p 
WHERE name LIKE 'Annabel%'
AND address_street_name = 'Franklin Ave'
);

--I saw the murder happen, 
--and I recognized the killer from my gym 
--when I was working out last week on January the 9th.

SELECT * FROM facebook_event_checkin fec
WHERE event_name LIKE '%Symphony%'
AND date BETWEEN 20171201 AND 20171231;

SELECT person_id , COUNT(person_id)
FROM facebook_event_checkin fec 
WHERE event_name LIKE '%Symphony%'
AND date BETWEEN 20171201 AND 20171231
GROUP BY person_id 
HAVING COUNT(person_id) = 3;

SELECT * FROM person p 
JOIN facebook_event_checkin fec 
ON fec.person_id = p.id 
JOIN drivers_license dl 
ON dl.id = p.license_id 
WHERE event_name LIKE '%Symphony%'
AND date BETWEEN 20171201 AND 20171231
GROUP BY person_id 
HAVING COUNT(person_id) = 3;


SELECT * FROM drivers_license dl
WHERE hair_color = 'red'
AND car_make LIKE '%Tesla%'
AND height BETWEEN 65 AND 67;














