/* Write your PL/SQL query statement below */
SELECT *
FROM Users
WHERE REGEXP_LIKE(mail,'^[[:alpha:]]+[[:alnum:]|_|.|-]*@leetcode[.]com$')