-- Julia asked her students to create some coding challenges. 
-- Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
-- Sort your results by the total number of challenges in descending order. 
-- If more than one student created the same number of challenges, then sort the result by hacker_id. 
-- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, 
-- then exclude those students from the result.

with dup_cnt as (
    select cnt_challenge, count(*) as dup_cnt
    from (
        select a.hacker_id, name, count(*) as cnt_challenge
        from Hackers a
        left join Challenges b on a.hacker_id = b.hacker_id
        group by a.hacker_id, name) a
    group by cnt_challenge
)

select a.hacker_id, name, count(*) as cnt_challenge
from Hackers a
left join Challenges b on a.hacker_id = b.hacker_id
group by a.hacker_id, name
-- exclude duplicated count
having cnt_challenge not in (
    select cnt_challenge
    from dup_cnt
    where dup_cnt > 1
)
-- keep the max count of challenges
or cnt_challenge = (
    select max(cnt_challenge) 
    from dup_cnt
)
order by cnt_challenge desc, a.hacker_id;