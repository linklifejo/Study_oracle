[�������� 3-2]
1. ��� ���̺��� �̸��� A�� �����ϴ� ��� ����� �̸��� �̸��� ���̸� ��ȸ
SELECT employee_id ,first_name, LENGTH(first_name)name_length
FROM employees
WHERE first_name LIKE 'A%'
ORDER BY 1;

2.80���� �μ����� �̸��� �޿��� ��ȸ(�޿��� 15�� ���̷� ���ʿ� $��ȣ�� ä���� ���·�)
SELECT employee_id ,first_name, LPAD(salary,15,'$')salary
FROM employees
WHERE department_id = 80;

3.60�� �μ�, 80�� �μ�, 100�� �μ��� �Ҽӵ� ����� ���, �̸�, ��ȭ��ȣ, ��ȭ��ȣ�� ������ȣ ��ȸ
(������ȣ �÷��� Local Number,
SELECT employee_id ,first_name, phone_number, 
        SUBSTR(phone_number,1,INSTR(phone_number,'.')-1) "Local Number",
        SUBSTR(phone_number,INSTR(phone_number,'.')+1) "Extra Number"
FROM employees
WHERE department_id IN (60,80,100)
ORDER BY 1;






