-- 3. Create a new script named lastname_sales_analysis.sql and save it to Capstone_1. Include a
-- comment to the top of your script to document which sales territory you are analyzing, then add
-- comments to break out each area of your analysis.
use sample_sales;
select * from management;
select * from store_locations

-- "I am working with Miami Vue who operates out of the northeast region, specifically they are assigned to the new jersey region as shown in the management table"

-- 4. The sales manager for your assigned territory wants to know:

-- A) What is total revenue overall for sales in the assigned territory, plus the start date and end date
-- that tell you what period the data covers?
;select 
sum(s.sale_amount) as Total,
min(s.transaction_date) as "Start",
max(s.transaction_date) as "End",
count(*) as transactionCount
from store_sales as s
join store_locations as l on s.store_id = l.storeid
where l.state = 'New Jersey'; -- I think its fine really 
-- B) What is the month by month revenue breakdown for the sales territory?
; select 
date_format(s.transaction_date, '%Y-%m') as `month`,
sum(s.sale_amount) as revenue,
count(*) as transactionAmount,
round(avg(s.sale_amount), 2) as avgTranSize
from store_sales as s
join store_locations as l 
on  s.store_id = l.storeid -- greatest of all time at making a table plural for no reason and then wasting 2 minutes
where l.state = 'new jersey'
group by `month`
order by `month`;

--  Provide a comparison of total revenue for the specific sales territory and the region it belongs to. -- why didn't I make this one thing 

-- C) What is the number of transactions per month and average transaction size by product category
-- for the sales territory?

-- D) Can you provide a ranking of in-store sales performance by each store in the sales territory, or a
-- ranking of online sales performance by state within an online sales territory?

-- E) What is your recommendation for where to focus sales attention in the next quarter?