USE hotel_db;

SET sql_notes = 0;     

drop table if exists dataMissing;

create table dataMissing
(
    emp_id INT not null,
    message varchar(255) not null,
    primary key(emp_id)
    
);

drop trigger if exists missing_data;

DELIMITER //

CREATE TRIGGER missing_data
BEFORE insert on EMPLOYEES
for each row
BEGIN
    IF new.emp_contact_number IS null THEN
        INSERT INTO dataMissing values(new.emp_id,concat('Hey ',new.emp_first_name,' please update your no'));
    else if new.emp_designation IS null then
        INSERT INTO dataMissing values(new.emp_id,concat('Hey ',new.emp_first_name,' please update designation'));
    else if new.emp_email_address IS null then
        INSERT INTO dataMissing values(new.emp_id,concat('Hey ',new.emp_first_name,' please update Mail Address'));
    else if new.emp_last_name IS null then
        INSERT INTO dataMissing values(new.emp_id,concat('Hey ',new.emp_first_name,' please update last name'));
    end if;
    end if;
    end if;
    end if;
END //

DELIMITER ;


select * from datamissing;

