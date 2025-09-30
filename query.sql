SELECT
  f.flight_no,
  f.departure_airport,
  f.arrival_airport,
  a.airport_name->>'ru' as departure_airport_name,
  to_char(f.actual_arrival, 'YYYY-MM-DD HH24:MI:SSTZH:TZM') as actual_arrival
FROM flights as f
JOIN airports_data as a
    ON a.airport_code = f.departure_airport
WHERE status = 'Arrived'
ORDER BY f.actual_arrival DESC
LIMIT 20;
