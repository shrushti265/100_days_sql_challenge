CREATE TABLE cinema (
    seat_id INT PRIMARY KEY,
    free int
);
delete from cinema;
INSERT INTO cinema (seat_id, free) VALUES (1, 1);
INSERT INTO cinema (seat_id, free) VALUES (2, 0);
INSERT INTO cinema (seat_id, free) VALUES (3, 1);
INSERT INTO cinema (seat_id, free) VALUES (4, 1);
INSERT INTO cinema (seat_id, free) VALUES (5, 1);
INSERT INTO cinema (seat_id, free) VALUES (6, 0);
INSERT INTO cinema (seat_id, free) VALUES (7, 1);
INSERT INTO cinema (seat_id, free) VALUES (8, 1);
INSERT INTO cinema (seat_id, free) VALUES (9, 0);
INSERT INTO cinema (seat_id, free) VALUES (10, 1);
INSERT INTO cinema (seat_id, free) VALUES (11, 0);
INSERT INTO cinema (seat_id, free) VALUES (12, 1);
INSERT INTO cinema (seat_id, free) VALUES (13, 0);
INSERT INTO cinema (seat_id, free) VALUES (14, 1);
INSERT INTO cinema (seat_id, free) VALUES (15, 1);
INSERT INTO cinema (seat_id, free) VALUES (16, 0);
INSERT INTO cinema (seat_id, free) VALUES (17, 1);
INSERT INTO cinema (seat_id, free) VALUES (18, 1);
INSERT INTO cinema (seat_id, free) VALUES (19, 1);
INSERT INTO cinema (seat_id, free) VALUES (20, 1);

with cte as (
select * 
,row_number() over(order by seat_id) as rn
,seat_id - row_number() over(order by seat_id) as grp
from cinema
where free = 1
)
select * from (
select * 
, count(*) over(partition by grp) as cnt
from cte
) as a
where cnt > 1;


-- method 2
select * from(
select *
,lag(free, 1) over(order by seat_id ) as prev_free
,lead(free, 1) over(order by seat_id ) as next_free
from cinema) as A
where free=1 and (prev_free = 1 or next_free = 1)



