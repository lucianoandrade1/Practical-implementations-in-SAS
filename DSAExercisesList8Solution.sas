
PROC SORT data = sashelp.class out = class;
 by sex;
RUN;

PROC MEANS data = class;
 by sex;
 var height;
 output out = statisticssummary;
RUN;

PROC PRINT data = statisticssummary;
 where _STAT_  in ("N", "MEAN", "STD");
 var Sex _STAT_ Height;
RUN;


PROC TTEST data=statisticssummary order = data alpha=0.05 test=diff sides=2;
 class sex;
 var height;
RUN;

