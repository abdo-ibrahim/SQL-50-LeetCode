-- Write a solution to find the ids of products that are both low fat and recyclable.


SELECT name 
FROM Customer 
WHERE referee_id IS NULL OR referee_id != 2;
