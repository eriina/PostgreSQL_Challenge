-- Table: public.department_employees

-- DROP TABLE public.department_employees;

CREATE TABLE public.department_employees
(
    employee_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    department_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    from_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    to_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT department_no FOREIGN KEY (department_no)
        REFERENCES public.departments (department_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "employees.employee_no" FOREIGN KEY (employee_no)
        REFERENCES public.employees (employee_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.department_employees
    OWNER to postgres;

-- Index: fki_department_no

-- DROP INDEX public.fki_department_no;

CREATE INDEX fki_department_no
    ON public.department_employees USING btree
    (department_no COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- Index: fki_employees.employee_no

-- DROP INDEX public."fki_employees.employee_no";

CREATE INDEX "fki_employees.employee_no"
    ON public.department_employees USING btree
    (employee_no COLLATE pg_catalog."default")
    TABLESPACE pg_default;


-- Table: public.department_manager

-- DROP TABLE public.department_manager;

CREATE TABLE public.department_manager
(
    department_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    employee_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    from_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    to_date character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT department_no FOREIGN KEY (department_no)
        REFERENCES public.departments (department_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT employee_no FOREIGN KEY (employee_no)
        REFERENCES public.employees (employee_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.department_manager
    OWNER to postgres;

-- Index: fki_department_no1

-- DROP INDEX public.fki_department_no1;

CREATE INDEX fki_department_no1
    ON public.department_manager USING btree
    (department_no COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- Index: fki_employee_no

-- DROP INDEX public.fki_employee_no;

CREATE INDEX fki_employee_no
    ON public.department_manager USING btree
    (employee_no COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- Table: public.departments

-- DROP TABLE public.departments;

CREATE TABLE public.departments
(
    department_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    department_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT department_no PRIMARY KEY (department_no)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;

-- Table: public.employees

-- DROP TABLE public.employees;

CREATE TABLE public.employees
(
    employee_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    birth_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    gender character varying(30) COLLATE pg_catalog."default" NOT NULL,
    hire_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT employee_no PRIMARY KEY (employee_no)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.employees
    OWNER to postgres;
COMMENT ON CONSTRAINT employee_no ON public.employees
    IS 'primary_key';

-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    employee_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    salary integer NOT NULL,
    from_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    to_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT employee_no FOREIGN KEY (employee_no)
        REFERENCES public.employees (employee_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;

-- Index: fki_employee_no1

-- DROP INDEX public.fki_employee_no1;

CREATE INDEX fki_employee_no1
    ON public.salaries USING btree
    (employee_no COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- Table: public.titles

-- DROP TABLE public.titles;

CREATE TABLE public.titles
(
    employee_no character varying(30) COLLATE pg_catalog."default" NOT NULL,
    title character varying(30) COLLATE pg_catalog."default" NOT NULL,
    from_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    to_date character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT employee_no FOREIGN KEY (employee_no)
        REFERENCES public.employees (employee_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.titles
    OWNER to postgres;

-- Index: fki_employee_no2

-- DROP INDEX public.fki_employee_no2;

CREATE INDEX fki_employee_no2
    ON public.titles USING btree
    (employee_no COLLATE pg_catalog."default")
    TABLESPACE pg_default;

