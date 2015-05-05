*Step 1: Encoding Text to Categorical Data
encode terminal, gen(terminal1)
encode publishedairlineiatacode, gen(publishedairlineiatacode1)
encode publishedairline, gen(publishedairline1)
encode pricecategorycode, gen(pricecategorycode1)
encode operatingairlineiatacode, gen(operatingairlineiatacode1)
encode operatingairline, gen(operatingairline1)
encode geosummary, gen(geosummary1)
encode georegion, gen(georegion1)
encode boardingarea, gen(boardingarea1)
encode activitytypecode, gen(activitytypecode1)

sort operatingairline1
by operatingairline1: egen monthly_enplaned = mean(passengercount)
tab monthly_enplaned operatingairline1
tab operatingairline1 if monthly_enplaned>54660.06

tab monthly_enplaned operatingairline1 if geosummary1==1
tab operatingairline1 if monthly_enplaned>54660.06 & geosummary1==1
*Top 5 Domestic
**American Airlines 
**Delta Air Lines 
**Southwest Airlines 
**United Airlines 
**Virgin America 


tab monthly_enplaned operatingairline1 if geosummary1==2
tab operatingairline1 if monthly_enplaned>26109.25 & geosummary1==2
*Top 5 International
** Delta Air Lines 
**SkyWest Airlines 
**United Airlines 
**United Airlines - Pre 07/01/2013 
**Virgin America 



