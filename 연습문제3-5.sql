[�������� 3-5]
1.����� ���, �̸�,���� ��������� ��ȸ
DECODE�Լ� ���,CASE~END ���

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

2.����� ���, �̸�, �Ի���, �ٹ����, �ټӻ��¸� ��ȸ
�ٹ������ ���� ��¥�� �������� ���� ǥ��
���� �ټ� ���� ��ȸ
SELECT  employee_id, first_name||' ' ||last_name name, hire_date,
        round(months_between(sysdate,hire_date)/12)�ټӿ���,
        

