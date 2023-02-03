--�������� 2-1

--1. ����� 200�� ����� �̸��� �μ���ȣ ��ȸ
SELECT employee_id ,first_name ||' '||last_name full_name
FROM employees
WHERE employee_id = 200;

-- 2. �޿��� 3000~15000 ���̿� ���Ե��� �ʴ� ����� ���, �̸�, �޿����� ��ȸ
SELECT employee_id ,first_name ||' '||last_name full_name, salary
FROM employees
WHERE NOT salary BETWEEN 3000 AND 15000;
--WHERE salary < 3000 
--or salary < 15000;  �̷��� �ص� �ȴ�

--3. �μ���ȣ 30~60�� �Ҽӵ� ����� ���, �̸�, �μ���ȣ, �޿� ��ȸ,�̸��� �������� ����
SELECT employee_id ,department_id, salary
FROM employees
WHERE department_id =30
OR department_id =60 -- in�� �Ἥdepartment_id IN(30,60)
ORDER BY first_name;

--4.�޿���3000~15000 �̸鼭 �μ���ȣ 30 �Ǵ� 60�� �Ҽӵ� ����� ���, �̸�, �޿� ��ȸ
SELECT employee_id ,first_name ||' '||last_name name, salary "Monthly Salary"
FROM employees
WHERE salary BETWEEN 3000 AND 15000
AND department_id IN (30,60) -- in�� �Ἥdepartment_id IN(30,60)
ORDER BY first_name;

--5. �Ҽӵ� �μ���ȣ�� ���� ����� ��� �̸� ����id ��ȸ
SELECT employee_id ,first_name,job_id
FROM employees
WHERE department_id IS NUll;

--6.Ŀ�̼��� �޴� ����� ���, �̸�,�޿� ,Ŀ�̼��� ��ȸ, Ŀ�̼� ���� ������ ����
SELECT employee_id ,first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NUll
ORDER BY  commission_pct DESC;

--7. �̸��� ���� Z�� ���Ե� ����� ����� �̸��� ��ȸ
SELECT employee_id ,first_name
FROM employees
WHERE first_name LIKE '%z%';