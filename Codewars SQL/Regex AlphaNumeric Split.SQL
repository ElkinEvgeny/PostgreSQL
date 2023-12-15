SELECT
  project,
  REGEXP_REPLACE(address, '[[:digit:]]', '', 'g') as letters,
  REGEXP_REPLACE(address, '[[:alpha:]]', '', 'g') as numbers
FROM repositories;