CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT p.child AS name
  FROM parents AS p
  JOIN dogs AS d ON p.parent = d.name
  ORDER BY d.height DESC;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT SELECT d.name, s.size
  FROM dogs AS d
  JOIN sizes AS s ON d.height > s.min AND d.height <= s.max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT SELECT p1.child AS sibling1, p2.child AS sibling2, s1.size
  FROM parents AS p1
  JOIN parents AS p2 ON p1.parent = p2.parent AND p1.child < p2.child
  JOIN size_of_dogs AS s1 ON p1.child = s1.name
  JOIN size_of_dogs AS s2 ON p2.child = s2.name AND s1.size = s2.size;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 
    'The two siblings, ' || sibling1 || ' and ' || sibling2 || ', have the same size: ' || size AS sentence
  FROM siblings;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) AS height_range
  FROM dogs
  GROUP BY fur
  HAVING MIN(height) >= 0.7 * AVG(height)
     AND MAX(height) <= 1.3 * AVG(height);

