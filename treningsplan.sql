SELECT *
FROM ovelse
WHERE varighet > 90
AND NOT repetsjoner = 15
ORDER BY varighet DESC;

