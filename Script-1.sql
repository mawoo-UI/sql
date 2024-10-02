SELECT * 
FROM TAB;

SELECT * FROM LOCATIONS l ;

SELECT * 
FROM EMPLOYEES e;

SELECT * FROM DEPARTMENTS d ;

SELECT 

--사번, 성,상사의 사번, 상사의 성
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.MANAGER_ID,E2.LAST_NAME 
FROM EMPLOYEES e 
LEFT JOIN EMPLOYEES e2 ON E.MANAGER_ID = E2.EMPLOYEE_ID 
ORDER BY 1;