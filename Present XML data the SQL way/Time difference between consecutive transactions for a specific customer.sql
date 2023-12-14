SELECT
  rental_id,
  customer_id,
  TO_CHAR(rental_date, 'YYYY-MM-DD HH24:MI:SS') AS rental_date,
  rental_date - LAG(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) AS time_since_previous_rental
FROM rental
WHERE customer_id IN (1, 2)
ORDER BY 2, 3;