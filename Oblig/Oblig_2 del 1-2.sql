
select * from pasienter;

SELECT
 ROW_NUMBER() OVER (ORDER BY fodselsdag) AS nummer,
 fornavn, fodselsdag FROM pasienter
WHERE fodselsdag > '2009-12-31' AND fodselsdag <= '2010-12-31';

SELECT fornavn, etternavn, hoyde FROM pasienter
ORDER BY hoyde DESC;

SELECT * FROM pasienter
WHERE pasient_id IN (1,45,234,379,500);

SELECT DISTINCT sted
FROM personer
WHERE provins = 'NS';

SELECT fornavn, etternavn, fodselsdag
FROM pasienter
WHERE hoyde > '160' AND vekt > '70';

SELECT fornavn, etternavn, allergier
FROM pasienter
WHERE allergier IS NOT NULL
  AND sted = 'Hamilton';
