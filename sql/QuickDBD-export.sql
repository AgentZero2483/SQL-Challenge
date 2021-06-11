-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

-- Table documentation comment 2
CREATE TABLE "departments" (
    "dept_no" int   NOT NULL,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    "dept_name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_departments_dept_name" UNIQUE (
        "dept_name"
    )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" int   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" int   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title" int   NOT NULL,
    "birth_date" int   NOT NULL,
    "first_name" VARCHAR(32)   NOT NULL,
    "last_name" VARCHAR(32)   NOT NULL,
    "sex" VARCHAR(10)   NOT NULL,
    "hire_date" int   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- CustomerID int FK >- Customer.CustomerID
-- OrderStatusID int FK >- os.OrderStatusID
CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

-- Table documentation comment 1 (try the PDF/RTF export)
CREATE TABLE "titles" (
    "title_id" int   NOT NULL,
    "title" VARCHAR(32)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

