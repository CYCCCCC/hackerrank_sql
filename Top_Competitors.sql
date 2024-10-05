-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
-- Order your output in descending order by the total number of challenges in which the hacker earned a full score.
-- If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

select a.hacker_id, d.name
from Submissions a
left join Challenges b on a.challenge_id = b.challenge_id
left join Difficulty c on b.difficulty_level = c.difficulty_level
left join Hackers d on a.hacker_id = d.hacker_id
where a.score = c.score
group by a.hacker_id, d.name
having count(*) > 1
order by count(*) desc, a.hacker_id;
