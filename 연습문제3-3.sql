[�������� 3-3]
1.��� 30�� �μ����� ���,����, �޿� ,�ٹ������� ��ȸ MONTHS_BETWEEN(DATE1,DATE2)
�ٹ� �������� ���� ��¥�� �������� ��¥ �Լ��� ���

SELECT employee_id EMP_ID, first_name||' ' ||last_name, TO_CHAR (salary,'$99,999,999'), MONTHS_BETWEEN(sysdate,hire_date)"�ٹ� ������",
       ROUND(MONTHS_BETWEEN(sysdate,hire_date)/12)"�ټ� ���"
FROM employees
WHERE department_id = 30
ORDER BY employee_id; 

2.�޿��� 12000�޷� �̻��� ����� ��� ,����, �޿� ��ȸ
�޿������� ,�� �޿��� õ���� ����

SELECT employee_id EMP_ID, first_name||' ' ||last_name name, TO_CHAR (salary,'$99,999,999')
FROM employees
WHERE salary >= 12000
ORDER BY salary;

3.2005�� ������ �Ի��� ������� ���, ����, �Ի���, ���� ���� ����(�Ի糯¥) ��ȸ

SELECT employee_id ���, first_name||' ' ||last_name ����, hire_date �Ի���, TO_CHAR(hire_date, 'DAY')"���� ���� ����"
FROM employees
WHERE TO_CHAR(hire_date,'YYYY') < 2005;
--WHERE TO_CHAR(hire_date,'YYYY-MM-DD') < '2005-01-01';--2004/12/31������ ����





