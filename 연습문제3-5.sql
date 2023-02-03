[연습문제 3-5]
1.사원의 사번, 이름,업무 업무등급을 조회
DECODE함수 사용,CASE~END 사용

SELECT  employee_id EMP_ID, first_name||' ' ||last_name name, job_id,
        DECODE(job_id, 'AD-PRES','A',
                        'ST_MAN','B',
                        'IT_PROG', 'C',
                        'SA_REF','D',
                        'ST_CLERK','E',
                        'X'
     )grade
FROM employees
--WHERE manager_id;
ORDER BY grade; 

2.사원의 사번, 이름, 입사일, 근무년수, 근속상태를 조회
근무년수는 오늘 날짜를 기준으로 점수 표기
현재 근속 상태 조회
SELECT  employee_id, first_name||' ' ||last_name name, hire_date,
        round(months_between(sysdate,hire_date)/12)근속연수,
        

