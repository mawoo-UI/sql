-- 102번 학과 학생이면서 4학년이거나 1학년
SELECT
	DEPTNO ,STUDNO , NAME ,GRADE
FROM
	STUDENT s
WHERE
	DEPTNO = 102
	AND GRADE IN(1,4);
--	AND (GRADE = 4
--	OR GRADE = 1);
CREATE TABLE STUD_HEAVY AS
SELECT *
FROM STUDENT 
WHERE WEIGHT >= 70 AND GRADE  ='1';

DROP TABLE STUD_101;
CREATE TABLE STUD_101 AS
SELECT *
FROM STUDENT 
WHERE DEPTNO = 101 AND GRADE  ='1';

SELECT  * FROM TAB;

SELECT STUDNO, NAME, NULL 
FROM STUD_HEAVY
UNION
SELECT STUDNO, NAME, GRADE
FROM STUD_101;

--UNION, UNION ALL(행을늘리려고씀) 을 활용하여 학번 이름 조회 (대상 테이블 :STUD_HEAVY , STUD_101)

SELECT DISTINCT STUDNO,NAME
 FROM (
SELECT STUDNO ,NAME 
FROM STUD_HEAVY
MINUS
SELECT STUDNO, NAME 
FROM STUD_101
);



--학생 테이블에서 이름순으로 정렬/ 이름, 학년, 전화번호 조회

SELECT NAME ,GRADE ,TEL 
FROM STUDENT S
ORDER BY NAME DESC;

--학생 테이블에서 학년을 내림차순으로정렬/ 이름, 학년, 전화번호 조회
SELECT NAME ,GRADE ,TEL 
FROM STUDENT S
ORDER BY GRADE DESC;

--학생 테이블에서 학년을 내림차순으로 정렬, 같은학년일경우 이름으로 정렬
--이름, 학년, 전화번호 조회
SELECT NAME ,GRADE ,TEL 
FROM STUDENT S
ORDER BY GRADE DESC, NAME ;

SELECT STUDNO , NAME 
FROM STUDENT s 
ORDER BY PROFNO DESC;

SELECT AVG(SAL)
FROM PROFESSOR;

--함수
--학생의 이름, 아이디를 조회, 단 아이디의 첫 글자는 대문자로, 소문자, 모든 글자 대문자로
SELECT NAME, USERID, INITCAP(USERID), UPPER(USERID), LOWER(USERID) 
FROM STUDENT;

--부서의 이름을 조회하고 이름의 길이와,바이트 갯수를 조회
SELECT DNAME , LENGTH (DNAME), LENGTHB(DNAME) 
FROM DEPARTMENT;


--1학년 학생들의 생년월일,태어난 달을 조회(주민번호를 통해서)
SELECT STUDNO ,IDNUM ,SUBSTR(IDNUM, 1,6), SUBSTR(IDNUM,3 ,2) 
FROM STUDENT
WHERE GRANTDE = '1' ;

SELECT BIRTHDATE  ,TEL 
FROM STUDENT;
--학생의 전화번호 조회
-- 단 마지막 네글자 *로 변경

SELECT TEL, SUBSTR(TEL, 1 ,INSTR(TEL, '-')) || '****' TEL 
FROM STUDENT;
--WHERE ROWNUM =1;


--부서 테이블에서 부서이름 조회, 부서이름 내의 '과 ' 글자의 위치를 탐색
SELECT DNAME, INSTR(DNAME,'과', -3,1)
FROM DEPARTMENT;


--교수의 직급의 왼쪽에 + 기호를 추가하여 10글자로,아이디의 오른쪽에 *를 추가하여 12글자로 조회
SELECT "POSITION" ,USERID ,LPAD("POSITION" , 10 ,'+'),RPAD(USERID, 12, '*') 
FROM PROFESSOR;


SELECT 'xyxxyyyyxy', LTRIM('xyxxyyyyxy', 'X'),RTRIM('xyxxyyyyxy', 'Y')
FPOM DUAL;

--부서 테이블에서 부서이름의 마지막 '과' 글자를 제거
SELECT DNAME, RTRIM(DNAME,'과') 
FROM DEPARTMENT;

--교수 테이블에서 일급계산(1달은 22일 가정)
--일급 각각, 소수점 첫째 자리에서, 소수점 셋째 자리에서 반올림, 십의 자리로 반올림
--일급 각각, 소수점 첫째 자리에서, 소수점 셋째 자리에서 절삭

SELECT SAL, SAL /22 A
,ROUND(SAL /22)B,
ROUND(SAL /22,2) C,
ROUND(SAL /22,-1) C_1,
TRUNC(SAL /22) D,
TRUNC(SAL /22,2) E
FROM PROFESSOR;

--교수번호 9908교수님의 입사일, 입사 30일후 , 입사 60일후의 날짜를 조회
SELECT HIREDATE ,HIREDATE +30, HIREDATE +60
FROM PROFESSOR
WHERE PROFNO = 9908;

--현재 날짜 조회
SELECT SYSDATE FROM DUAL;


SELECT ROUND(MONTHS_BETWEEN(SYSDATE, '97/04/29'))FROM DUAL;


--입사한지 120개월된 교수들을 조회/ 교수번호, 입사일,입사일+ 6개월후,입사일 부터 현재까지의 개월계산

SELECT 
PROFNO, 
HIREDATE,
ADD_MONTHS(HIREDATE, 6) A, 
MONTHS_BETWEEN(SYSDATE, HIREDATE)B 
FROM  PROFESSOR
WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) <320 ;

--오늘이 속한 달의 마지막 날짜 , 다가오는 일요일을 조회

SELECT 
	SYSDATE, 
	LAST_DAY(SYSDATE), 
	NEXT_DAY(SYSDATE, 7) 
FROM DUAL;

--오늘을 조회, 반올림, 절삭처리
SELECT 
SYSDATE -4/24, 
	ROUND(SYSDATE-4/24),
	TRUNC(SYSDATE-4/24) 
FROM DUAL;

--오늘을 반올림, 날짜, 월, 연으로 시, 분 반올림
SELECT 
	ROUND(SYSDATE, 'DD') DAY,
	ROUND(SYSDATE, 'MM') MONTH, 
	ROUND(SYSDATE, 'YY') YEAR,
	ROUND(SYSDATE, 'HH') HOUR,
	ROUND(SYSDATE, 'MI') MINUTE
FROM DUAL;

--4학년 학생 조회
SELECT  *
FROM STUDENT
WHERE GRADE =4;

