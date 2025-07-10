/* SCRIPT FOR CREATING TABLE AND INSERTING DATA */
create table temp_purchases(
	user_id int,
	product_id int,
	quantity int,
	purchase_date datetime
);

insert into temp_purchases values(536, 3223, 6, '01/11/2022 12:33:44');
insert into temp_purchases values(827, 3585, 35, '02/20/2022 14:05:26');
insert into temp_purchases values(536, 3223, 5, '03/02/2022 09:33:28');
insert into temp_purchases values(536, 1435, 10, '03/02/2022 08:40:00');
insert into temp_purchases values(827, 2452, 45, '04/09/2022 00:00:00');

/*QUESTION: 
Assume you are given the table below containing information on user purchases. 
Write a query to obtain the number of users who purchased the same product on two or more different days. 
Output the number of unique users.*/
--ANSWER:
SELECT COUNT(1) AS unique_users FROM (
SELECT user_id, product_id, count(distinct CAST(purchase_date AS DATE)) as cnt
FROM temp_purchases
group by user_id, product_id) SQ
WHERE SQ.cnt > 1
