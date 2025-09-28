# The journey date and booking date must be in the future, and the booking date should be earlier than the journey date.
ALTER TABLE tickets
ADD CONSTRAINT chk_dates 
CHECK (
    journey_date > CURRENT_DATE
    AND booking_date < journey_date
);