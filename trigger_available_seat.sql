# In the bus details, the available seats should initially be equal to the total seats, and then they should decrement as bookings are made.
ALTER TABLE bus_details 
ADD COLUMN available_seat int;
 delimiter $$ 
 Create trigger trg_available_seat  before  insert on bus_details
 for each row
 Begin
      Set New.available_seat=New.TotalSeats;
      
End$$
   delimiter ;
   
insert into bus_details(BusName,Contact,TotalCost,TotalSeats, PaymentDetail, AdvancePayment, Journey) 
values('ExpressLine','7850578886',6738,46,'UPI',2681,'2025-07-12');

 delimiter $$ 
 Create trigger trg_decrement_seat  after  insert on tickets
 for each row
 Begin
      update bus_details 
      Set available_seat=available_seat-1
      where id=New.id;
      
End$$
   delimiter ;  

insert into bus_details(BusName,Contact,TotalCost,TotalSeats, PaymentDetail, AdvancePayment, Journey) 
values('ExpressLine','7850578886',6738,45,'UPI',2681,'2025-07-12');
