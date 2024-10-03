-- Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

-- Root: If node is root node.
-- Leaf: If node is leaf node.
-- Inner: If node is neither root nor leaf node.

select N,
       (case when P is null then 'Root'
             when N in (select distinct P from BST where P is not null) then 'Inner'
             else 'Leaf' end) as node_type
from BST
order by N;