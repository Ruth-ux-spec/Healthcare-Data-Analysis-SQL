select *
from [Health care dataset kodex]



select *
into Health_data
from [Health care dataset kodex]

select*
from Health_data


--- Check null values

----Before doing my main analysis, I checked for missing values using IS NULL with OR conditions
select*
from Health_data
where Name is null
or Age is null
or Billing_Amount is null
or Blood_Type is null

---The query ran successfully and returned zero rows — meaning no patient has a missing Name, Age, Billing_Amount, or Blood_Type.
--This confirms my dataset has no NULL values in these key columns




--I used the CONVERT function. It changes the format or type of data. In this case, 
--it converts the text dates into real date values.”


UPDATE Health_data
SET Date_of_Admission = convert(Date,Date_of_Admission, 103);

select*
from Health_data



UPDATE Health_data
SET Discharge_Date = convert(Date,Discharge_Date, 103);
select*
from Health_data

---By converting the column to a proper date type, I can now perform date operations such
--as sorting, filtering, grouping by year or month, and calculating differences between dates.



-- ROUND(Billing_Amount, 2) takes the existing long decimal values and rounds each one to 2 decimal places. 

UPDATE Health_data
SET Billing_Amount = ROUND(Billing_Amount, 2)
--The 2 means we want to keep only 2 decimal places.
--We needed to round Billing_Amount because the values in the raw data had very long floating-point decimals

select*
from Health_data
