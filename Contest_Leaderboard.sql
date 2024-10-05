-- You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
-- The total score of a hacker is the sum of their maximum scores for all of the challenges. 
-- Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
-- If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
-- Exclude all hackers with a total score of  from your result.

select a.hacker_id, name, sum(max_score) as total_score
from (
    select hacker_id, challenge_id, max(score) as max_score
    from Submissions
    group by hacker_id, challenge_id
) a
left join Hackers b on a.hacker_id = b.hacker_id
group by a.hacker_id, name
having total_score > 0
order by total_score desc, a.hacker_id;

