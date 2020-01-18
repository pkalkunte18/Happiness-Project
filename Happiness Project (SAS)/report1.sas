proc import out = happy
	datafile = 'C:\Users\pkalkunte18\Downloads\ESP.csv'
	DBMS = csv replace;
getnames= yes;
datarow = 2;

/* MISSING FERTILITY RATE -- Model in use */
proc reg data = happy;
	model Ranking = GDP_Per_Capita Life_Expectancy Unemployment_Rate People_Per_KMsq Percent_Population_Urban 
Air_Pollution_PPM / vif tol collin dw spec white;
title1 'ESP';
output out = happy2;
proc corr data = happy; 

/*proc autoreg happy2;
model Ranking = GDP_Per_Capita Life_Expectancy Unemployment_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Electricity_Access Air_Pollution_PPM/nlag = 1; */

/*OVB testing

data happy3;
set happy2;
yhatsq = yhat*yhat;
yhatcub = yhatsq*yhat;

proc reg data = happy3;
model Ranking = GDP_Per_Capita Unemployment_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Female_Labor Air_Pollution_PPM yhatsq yhatcub; 

proc reg data = happy3;
model Ranking = GDP_Per_Capita Life_Expectancy Unemployment_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Female_Labor Percent_Electricity_Access Air_Pollution_PPM yhatsq yhatcub; 
title1 'unrestricted'; */


/*Past models***************************************************************************************************************/

/* ALL VARIABLES IN THIS MODEL 
proc reg data = happy;
model Ranking = GDP_Per_Capita Life_Expectancy Unemployment_Rate Fertility_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Female_Labor Percent_Electricity_Access Air_Pollution_PPM / vif tol collin ;
title1 'All variables';
*/

/* MISSING LIFE EXPECTANCY 
proc reg data = happy;
model Ranking = GDP_Per_Capita Unemployment_Rate Fertility_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Female_Labor Percent_Electricity_Access Air_Pollution_PPM / vif tol collin ;
title1 'Missing life expectancy';
*/

/* MISSING ELECTRICITY ACCESS 
proc reg data = happy;
	model Ranking = GDP_Per_Capita Life_Expectancy Unemployment_Rate Fertility_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Female_Labor Air_Pollution_PPM / vif tol collin ;
title1 'missing electricity access';
*/

/* JUST LIFE EXPECTANCY 
proc reg data = happy;
	model Ranking = GDP_Per_Capita Life_Expectancy Unemployment_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Female_Labor Air_Pollution_PPM / vif tol collin ;
title1 'Just life expectancy';
*/

/* JUST FERTILITY RATE 
proc reg data = happy;
model Ranking = GDP_Per_Capita Unemployment_Rate Fertility_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Female_Labor Air_Pollution_PPM / vif tol collin ;
title1 'Just Fertility rate';
*/

/* JUST ELECTRICITY ACCESS 
proc reg data = happy;
	model Ranking = GDP_Per_Capita Unemployment_Rate People_Per_KMsq Percent_Population_Urban 
Percent_Female_Labor Percent_Electricity_Access Air_Pollution_PPM / vif tol collin ;
title1 'Just electricity Access';
*/

run;
quit;
