# phone no 10 digit or numeric
Alter Table tickets
ADD constraint Chk_Contact
check (Contact REGEXP '^[0-9]{10}$');