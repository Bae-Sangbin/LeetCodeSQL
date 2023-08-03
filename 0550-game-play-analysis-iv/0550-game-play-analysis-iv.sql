/* Write your PL/SQL query statement below */
select
nvl(round(count(*)/max(totcnt),2),0) as fraction
from
(
select player_id,count(distinct player_id) over() as totcnt
,row_number() over(partition by player_id order by event_date) as rnum
,player_id-lead(player_id,1) over(order by player_id,event_date) as idcnt
,lead(event_date,1) over(order by player_id,event_date) - event_date as dtcnt
from
(
select * from Activity
)
)
where idcnt=0 and dtcnt=1 and rnum=1;