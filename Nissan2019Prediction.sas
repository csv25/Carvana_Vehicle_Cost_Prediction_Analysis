*BAS 220 Homework 3- Carlos Vargas;

*Step 2 Create libname;
libname BAS220 "/home/u63027572/myfolders";

*Step 3: Create SAS table;
proc SQL;
	create table BAS220.Nissan2019 as 
	select *
	from BAS220.vehicles
	where Make = "Nissan" and Year = 2019;
quit;

*x= independent y= dependent;
*Step 4: highway08 and Fuel Cost: Appears to have a negative linear relationship;
proc sgplot data = bas220.Nissan2019;
	scatter x=highway08 y= fuelcost08;
	title "Highway MPG for fuelType1 vs. Annual Fuel Cost for FuelType1";
	reg x=highway08 y= fuelcost08;
run;

*City08 and Fuel Cost: Appears to have a negative linear relationship;
proc sgplot data = bas220.Nissan2019;
	scatter x=city08 y= fuelcost08;
	title "City MPG for fuelType1 vs. Annual Fuel Cost for FuelType1";
	reg x=city08 y= fuelcost08;
run;

*Barrels08 and Fuel Cost: Appears to have a positive linear relationship;
proc sgplot data = bas220.Nissan2019;
	scatter x=barrels08 y= fuelcost08;
	title "Annual Petroleum Consumption in barrels for fuelType1 vs. Annual Fuel Cost for FuelType1";
	reg x=barrels08 y= fuelcost08;
run;

*Fuel Cost and displ: Appears to have a positive linear relationship;
proc sgplot data = bas220.Nissan2019;
	scatter x=displ y= fuelcost08;
	title "Engine Displacement in Liters vs. Annual Fuel Cost for FuelType1 ";
	reg x=displ y= fuelcost08;
run;

*Step 5;
proc corr data = bas220.Nissan2019;
	var fuelcost08 highway08 city08 barrels08 displ;
run;
*
Include the numerical values from the matrix
fuelcost08 and highway have a moderate negative association: -0.71713
fuelcost08 and city08 have a moderate negative association:-0.65016
fuelcost08 and barrels08 have a strong positive association:0.89719
fuelcost08 and displ have a strong positive association:0.76444;

*Step 6 Run a regression procedure;
*model dependent = independent;
ods graphics on; 
proc reg data=bas220.Nissan2019;
  model fuelcost08 = displ;
run; 

* Step 6: 
1. There is a linear relationship between X and Y
2. There is equal variance of errors
3. There is independence of errors in the graph. 
4. There seems to be an S pattern(bad);

*Step 7: The data does not seem to meet the assumptions required for
linear regression. I did he 4 tests and I know for sure that 1 of them
does not pass the tests.
1. Passes linearity
2. Passes Homoscedasticity
3. Passes Independence
4. Does not pass Normality
it fails the regression procedure.;
