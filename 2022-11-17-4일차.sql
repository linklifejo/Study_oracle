-- 2��. �������� ��ȸ ����
/*

-- 2.1 SELECT ����
SELECT �÷�1, �÷�2
FROM ���̺��;

SELECT employee_id, first_name, department_id
FROM employees;

SELECT *
FROM employees;

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = 100;


[2-1]���� King�� ����� ������ ��ȸ�Ͻÿ�
-- last_name �� king���� Ȯ���ϸ� �ȴ�.

SELECT employee_id ���, last_name ��, department_id �μ� 
FROM employees
WHERE last_name = 'King';


[���� 2-14] �Ի����� 2001�� 1�� 1�� ������ ����� ����(=���,�̸�,�Ի���,...)

SELECT *
FROM employees;
WHERE hire_date <'01-JAN-04'; -- ������ ORA-01858����:���ڰ� �־�� �ϴ� ��ġ�� ���ڰ� �߰ߵ�

-- ���� ��¥ ����ϱ�

SELECT SYSDATE
FROM DUAL;

SELECT *
FROM employees
WHERE hire_date <'04/01/01';


