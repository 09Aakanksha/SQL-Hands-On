/*  A crime has taken place and the detective needs your help.
 The detective gave you the crime scene report, 
 but you somehow lost it. You vaguely remember that the
  crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ 
  and that it took place in ​SQL City​. Start by retrieving 
  the corresponding crime scene report from the police
   department’s database. */

  SELECT description
  FROM crime_scene_report
  where date = 20180115 and city = 'SQL City' and type = 'murder';


/* description
Security footage shows that there were 2 witnesses.
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave". */

select id, name from person 
 where address_street_name = 'Northwestern Dr' 
 order by address_number DESC limit 1; 

 /* First Witness 
 id	    name
14887	Morty Schapiro */



select id, name from person
 where address_street_name = 'Franklin Ave' 
 and name like 'Annabel%'

 /* Second Witness

 id	      name
16371	Annabel Miller
*/

/* Selecting interview transcripting*/

select transcript from interview where person_id in (14887, 16371)


/* I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag.
 The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
I saw the murder happen, and I recognized the killer from my gym when
 I was working out last week on January the 9th. */


select person.name
from get_fit_now_member
join person on get_fit_now_member.person_id = person.id
join drivers_license on person.license_id = drivers_license.id
where get_fit_now_member.membership_status ='gold'
and get_fit_now_member.id like '48Z%'
and drivers_license.plate_number like '%H42W%';

--Murderer is Jeremy Bowers

/* There is the murderer and the site confirms it:
-- Congrats, you found the murderer! But wait, there's more... 
If you think you're up for a challenge, try querying the interview 
transcript of the murderer to find the real villian behind this crime. 
If you feel especially confident in your SQL skills, try to complete this final 
step with no more than 2 queries. 
Use this same INSERT statement to check your answer.*/

select transcript from interview 
join person on person.id = interview.person_id 
where name = 'Jeremy Bowers'

/*I was hired by a woman with a lot of money. 
I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S. 
I know that she attended the SQL Symphony Concert 3 times in December 2017. 

-- Let's do it in one query
select name from person*/

select name from person
join facebook_event_checkin
on person.id=facebook_event_checkin.person_id
join drivers_license on  person.license_id = drivers_license.id
where Height between 65 and 67
and Date like '201712%'
and car_make = 'Tesla'
and car_model = 'Model S'
and Hair_color='red'
and gender= 'female'
group by person.id having count(*)=3; 

--Miranda Priestly

--Congrats, you found the brains behind the murder! 
--Everyone in SQL City hails you as the greatest SQL detective of all time.
-- Time to break out the champagne!


