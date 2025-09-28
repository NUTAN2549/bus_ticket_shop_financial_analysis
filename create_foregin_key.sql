# create  foregin key and fix referential intrigity and delete records
with delete_table as (select s.customerId
from bus_ticket_booking_data as s
left join  ticket_shop.busdetail2 as b
on s.Busname=b.Busname
and s.journy=b.journy
where b.Busname is null)
delete from bus_ticket_booking_data
where customerId in (select * from delete_table
) ;

select * from revenue;

Alter Table bus_ticket_booking_data
Add constraint fk_on_b
foreign key (BusName,Journey)
references ticket_shop.busdetail2 (BusName,Journey);
 