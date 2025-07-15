/* SCRIPT FOR CREATING AND INSERTING DATA */
create table call_start_logs
(
phone_number varchar(10),
start_time datetime
);
insert into call_start_logs values
('PN1','2022-01-01 10:20:00'),('PN1','2022-01-01 16:25:00'),('PN2','2022-01-01 12:30:00')
,('PN3','2022-01-02 10:00:00'),('PN3','2022-01-02 12:30:00'),('PN3','2022-01-03 09:20:00')
create table call_end_logs
(
phone_number varchar(10),
end_time datetime
);
insert into call_end_logs values
('PN1','2022-01-01 10:45:00'),('PN1','2022-01-01 17:05:00'),('PN2','2022-01-01 12:55:00')
,('PN3','2022-01-02 10:20:00'),('PN3','2022-01-02 12:50:00'),('PN3','2022-01-03 09:40:00');

/*QUESTION: 
Write a query to get start time and end time of each call from below 2 tables. 
Also create a column of call duration in minutes. Please do take into account that there will be 
multiple calls from one phone number and each entry in start table has a corresponding entry in end table.*/
--ANSWER :
SELECT A.phone_number, A.start_time, B.end_time, DATEDIFF(MINUTE, start_time, end_time) AS duration
FROM 
(SELECT *, ROW_NUMBER() OVER(PARTITION BY phone_number ORDER BY start_time) as rn FROM call_start_logs) A
INNER JOIN
(SELECT *, ROW_NUMBER() OVER(PARTITION BY phone_number ORDER BY end_time) as rn FROM call_end_logs)B
ON A.phone_number = B.phone_number AND A.rn = B.rn
