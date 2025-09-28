#create function update_revenue()

delimiter $$ 
Create trigger trg_calculate_revenue After insert on tickets 
for each row
Begin 
If exists (select * from revenue  where BusName=new.BusName and Journey=new.Journey) then 
Update  revenue
set revenue=revenue+new.price 
where BusName=new.BusName and Journey=new.Journey;
else
    insert into revenue values(new.BusName,new.Journey,new.price);
End if;
      End$$
   delimiter ;   

insert into tickets values(1,'Seema','TID001','ExpressLine',300,'offline','17-07-2025','7850578886','2025-07-19');

select * from  revenue;

select * from  tickets;

insert into tickets values(1,'Seema','TID001','ExpressLine',300,'offline','17-07-2025','7850578886','2025-07-12');

insert into bus_details values('ExpressLine','7850578886',6738,46,'UPI',2681,21,'2025-07-12');
