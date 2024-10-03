-- A median is defined as a number separating the higher half of a data set from the lower half. 
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

with row_table as (
    select *,
           row_number() over(order by LAT_N) as row_1,
           row_number() over(order by LAT_N desc) as row_2
    from STATION)


-- if the data count is even, the median is the average of the middle two numbers
select 
case when (select count(*) from STATION)%2=1 then (select round(LAT_N, 4) from row_table where row_1 = row_2)
else (select round(avg(LAT_N), 4) from row_table where row_1 = row_2-1 or row_1 = row_2+1) end as median_lat
