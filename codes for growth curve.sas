data broiler_data;
input Age ABW;
datalines; 
insert data here
;
proc nlin data=broiler_data method=gauss;
	parms a=70 b= 10 k = 0.7;
	model ABW = a*exp(-b*exp(-k*Age));
	output out=gompertz p=pred r=resid parms a b k;
	proc print data = gompertz;
	run;

proc corr data=gompertz;
	var ABW pred;
	run;

ods graphics on;

proc nlin plots(stats=all)=(diagnostics(stats=(maxincurv maxpecurv)) fit);
	parms a=70 b= 10 k = 0.7;
	model ABW = a*exp(-b*exp(-k*Age));
run;

ods graphics off;

/*****************************************************/
/**	plotting the data and predicted function	**/
/*****************************************************/
	symbol1 i=none v=diamond c=black;
	symbol2 i=join v=none c=orange;

proc gplot data=gompertz uniform;
	plot ABW*age=1 pred*age=2/overlay;
run;

/*******line-break*****/

data broiler_data;
input Age ABW;
datalines; 
insert data here
;
proc nlin data=broiler_data method=gauss;
	parms a=70 b= 10 k = 0.7;
	model ABW=a/(1+b*exp(-k*Age));
	output out=logistic p=pred r=resid parms a b k;
	proc print data = logistic;
run;
	
proc corr data=logistic;
	var ABW pred;
	

/*****************************************************/
/**		plotting the data and predicted function		**/
/*****************************************************/
	symbol1 i=none v=diamond c=black;
	symbol2 i=join v=none c=orange;

proc gplot data=logistic uniform;
	plot ABW*age=1 pred*age=2/overlay;	
run;

ods graphics on;

proc nlin plots=diagnostics(stats=all);
	parms a=70 b= 10 k = 0.7;
	model ABW=a/(1+b*exp(-k*Age));
run;

ods graphics off;

/*****line-break*****/

data broiler_data;
input Age ABW;
datalines; 
insert data here
;
proc nlin data=broiler_data method=gauss;
	parms a=70 b= 10 k = 0.7;
	model ABW=a*(1-b*exp(-k*age))**3;
	output out=vonbert p=pred r=resid parms a b k;
	proc print data = vonbert;
run;
	
proc corr data=vonbert;
	var ABW pred;
run;
	

/*****************************************************/
/**		plotting the data and predicted function		**/
/*****************************************************/
	symbol1 i=none v=diamond c=black;
	symbol2 i=join v=none c=orange;

proc gplot data=vonbert uniform;
	plot ABW*age=1 pred*age=2/overlay;	
run;

ods graphics on;

proc nlin plots(stats=all)=(diagnostics(stats=(maxincurv maxpecurv)) fit);
	parms a=70 b= 10 k = 0.7;
	model ABW=a*(1-b*exp(-k*age))**3;
run;

ods graphics off;

/*****line-break******/

data broiler_data;
input Age ABW;
datalines; 
insert data here
;
proc nlin data=broiler_data method=gauss;
	parms a=70 b= 10 k = 0.7;
	model ABW=a*exp((b/k)*(1-exp(-k*Age)));
	output out=gompertz_laird p=pred r=resid parms a b k;
	proc print data = gompertz_laird;
run;

proc corr data=gompertz_laird;
	var ABW pred;
run;
	

/*****************************************************/
/**		plotting the data and predicted function		**/
/*****************************************************/
	symbol1 i=none v=diamond c=black;
	symbol2 i=join v=none c=orange;

proc gplot data=gompertz_laird uniform;
	plot ABW*age=1 pred*age=2/overlay;	
run;

ods graphics on;

proc nlin plots(stats=all)=(diagnostics(stats=(maxincurv maxpecurv)) fit);
	parms a=70 b= 10 k = 0.7;
	model ABW=a*exp((b/k)*(1-exp(-k*Age)));
run;

ods graphics off;

/*****line-break******/

data broiler_data;
input Age ABW;
datalines; 
insert data here
;
proc nlin data=broiler_data method=gauss;
	parms a=1497.30 b= 14.31 k = 0.13 d=0.50;
	model ABW=a/(1+b*exp(-k*Age))**1/d;
	output out=richards p=pred r=resid parms a b k d;
	proc print data = richards;
run;

proc corr data=WLS;
	var ABW pred;
run;
	

/*****************************************************/
/**		plotting the data and predicted function		**/
/*****************************************************/
	symbol1 i=none v=diamond c=black;
	symbol2 i=join v=none c=orange;

proc gplot data=gompertz_laird uniform;
	plot ABW*age=1 pred*age=2/overlay;	
run;

/****optional*****/

/************line-break**********/
data broiler_data;
input Age ABW;
datalines; 
insert data here
;
proc nlin data=broiler_data method=gauss;
	parms a=2000 b= -3 k = 0.14;
	model ABW = a/(1+exp(-b-k*Age));
	output out=weighted_least_square p=pred r=resid parms a b k;
	proc print data = weighted_least_square;
run;

proc corr data=weighted_least_square;
	var ABW pred;
run;
	

/*****************************************************/
/**		plotting the data and predicted function		**/
/*****************************************************/
	symbol1 i=none v=diamond c=black;
	symbol2 i=join v=none c=orange;

proc gplot data=weighted_least_square uniform;
	plot ABW*age=1 pred*age=2/overlay;	
run;

ods graphics on;

proc nlin plots(stats=all)=(diagnostics(stats=(maxincurv maxpecurv)) fit);
	parms a=2000 b= -3 k = 0.14;
	model ABW = a/(1+exp(-b-k*Age));
run;

ods graphics off;
