-- 1. Create a list of all transactions that took place on January 15, 2024, sorted by sale amount from
-- highest to lowest.

select id,
transaction_date,
sale_amount
from store_sales
where transaction_date = '2024-01-15'
order by sale_amount desc;

-- 2. Which transactions had a sale amount greater than $500? Display the transaction date, store ID,
-- product number, and sale amount.

select transaction_date,
store_id,
prod_num,
sale_amount
from store_sales
where sale_amount >500
order by sale_amount desc;

-- 3. Find all products whose product number begins with the prefix 105250. What category do they
-- belong to?

-- Aggregation

-- 4. What is the total sales revenue across all transactions? What is the average transaction amount?

select round(sum(sale_amount), 2) as totalRevenue,
round(avg(sale_amount), 2) as avgTranAmount,
count(*) as totalTran
from store_sales;

-- 5. How many transactions were recorded for each product category? Which category has the most
-- transactions?

-- 6. Which store generated the highest total revenue? Which generated the lowest?

select store_id, -- highest
round(sum(sale_amount), 2) as totalRev
from store_sales
group by store_id
order by totalRev desc
limit 1;


select store_id, -- lowest
round(sum(sale_amount), 2) as totalRev
from store_sales
group by store_id
order by totalRev asc
limit 1;


-- 7. What is the total revenue for each category, sorted from highest to lowest?

-- 8. Which stores had total revenue above $50,000? (Hint: you'll need HAVING.)
select store_id,
round(sum(sale_amount), 2) as totalRev
from store_sales
group by store_id
having totalRev > 50000
order by totalRev desc;
-- Joins

-- 9. Find all sales records where the category is either "Textbooks" or "Technology & Accessories."

-- 10. List all transactions where the sale amount was between $100 and $200, and the category was
-- "Textbooks."

-- 11. Write a query that displays each store's total sales along with the city and state where that store is
-- located.

-- 12. For each sale, display the transaction date, sale amount, city, state, and the name of the store
-- manager responsible for that state.

-- 13. Write a query that shows total sales by region. Which region generates the most revenue?

-- 14. For states that have a preferred shipper listed in Shipper_List, show the total sales alongside the
-- preferred shipper and volume discount.

-- 15. Are there any states with sales data that do not appear in Shipper_List?

-- 16. Display total revenue by regional director.

-- Subqueries

-- 17. Using a subquery, find all transactions from stores located in Texas.

-- 18. Which stores had total sales above the average store revenue? (Hint: use a subquery to calculate the
-- average first.)

-- 19. Find the top 5 highest-grossing stores, then use that result to look up their city and state from
-- Store_Locations.

-- 20. Write a query using a subquery to find all sales records from stores managed by the Northeast
-- region's store managers