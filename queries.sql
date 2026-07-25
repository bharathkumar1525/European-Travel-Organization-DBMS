SELECT * FROM COUNTRIES;

SELECT * FROM CUSTOMERS;


SELECT * FROM TOUR_PACKAGES;

--WHERE
SELECT * FROM TOUR_PACKAGES
WHERE package_price > 50000;

--ORDER_BY

SELECT * FROM HOTELS
ORDER BY hotel_rating DESC;

--COUNT
SELECT COUNT(*) AS TOTAL_CUSTOMERS
FROM CUSTOMERS;

--SUM
SELECT SUM(payment_amount) AS TOTAL_REVENUE
FROM PAYMENTS;

--AVG
SELECT AVG(package_price) AS AVERAGE_PRICE
FROM TOUR_PACKAGES;

--MAX
SELECT MAX(package_price) AS HIGHEST_PRICE
FROM TOUR_PACKAGES;
--MIN
SELECT MIN(package_price) AS LOWEST_PRICE
FROM TOUR_PACKAGES;

--INNER_JOIN
SELECT c.customer_name,
       tp.package_name,
       b.booking_status
FROM CUSTOMERS c
JOIN BOOKINGS b
ON c.customer_id = b.customer_id
JOIN TOUR_PACKAGES tp
ON b.package_id = tp.package_id;

GROUP_BY
SELECT booking_status,
       COUNT(*) AS TOTAL
FROM BOOKINGS
GROUP BY booking_status;

--HAVING
SELECT booking_status,
       COUNT(*) AS TOTAL
FROM BOOKINGS
GROUP BY booking_status
HAVING COUNT(*) >= 1;

--Multi-table_JOIN
SELECT c.customer_name,
       tp.package_name,
       p.payment_amount
FROM CUSTOMERS c
JOIN BOOKINGS b
ON c.customer_id=b.customer_id
JOIN TOUR_PACKAGES tp
ON b.package_id=tp.package_id
JOIN PAYMENTS p
ON b.booking_id=p.booking_id;