*** SFO Passengers

import delimited "/Users/alxfayhe/Desktop/MonthlyPassengerData_200507_to_201412.csv"

encode operatingairline, gen(operatingairline1)
encode operatingairlineiatacode, gen(operatingairlineiatacode1)
encode publishedairline, gen(publishedairline1)
encode publishedairlineiatacode, gen(publishedairlineiatacode1)
encode geosummary, gen(geosummary1)
encode georegion, gen(georegion1)
encode activitytypecode, gen(activitytypecode1)
encode pricecategorycode, gen(pricecategorycode1)
encode terminal, gen(terminal1)
encode boardingarea, gen(boardingarea1)

save SFO_Passengers.dta

sort operatingairline1
**** assuming plot passengercount
by operatingairline1 activityperiod: egen monthly_enplaned=sum(passengercount) if activitytypecode1==2&geosummary1==1
by operatingairline1 activityperiod, sort: gen nvals = _n ==1
by operatingairline1: egen avg_monthly_enplaned=mean(monthly_enplaned)

tab avg_monthly_enplaned if nvals==1
tab operatingairline1 if avg_monthly_enplaned>120000&avg_monthly_enplaned!=., nol

by operatingairline1 activityperiod: egen monthly_enplaned_int=sum(passengercount) if activitytypecode1==2&geosummary1==2
by operatingairline1: egen avg_monthly_enplaned_int=mean(monthly_enplaned_int)

tab avg_monthly_enplaned_int if nvals==1
tab operatingairline1 if monthly_enplaned>201226&geosummary1==2&avg_monthly_enplaned!=.,nol



by operatingairline1: egen monthly_enplaned=sum(passengercount) if activitytypecode1

sort activityperiod
gen year=int(activityperiod/100)
gen month=mod(activityperiod,100)
gen yearmonth=month
replace yearmonth=yearmonth+12 if year==2006
replace yearmonth=yearmonth+24 if year==2007
replace yearmonth=yearmonth+36 if year==2008
replace yearmonth=yearmonth+48 if year==2009
replace yearmonth=yearmonth+60 if year==2010
replace yearmonth=yearmonth+72 if year==2011
replace yearmonth=yearmonth+84 if year==2012
replace yearmonth=yearmonth+96 if year==2013
replace yearmonth=yearmonth+102 if year==2014

twoway (line monthly yearmonth if operatingairline1==14) /*
*/ (line passengercount yearmonth if operatingairline1==59) /*
*/ (line passengercount yearmonth if operatingairline1==67) /*
*/ (line passengercount yearmonth if operatingairline1==68) /*
*/ (line passengercount yearmonth if operatingairline1==69)
