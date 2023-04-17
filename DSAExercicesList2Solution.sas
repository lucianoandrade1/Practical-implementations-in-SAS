
PROC IMPORT datafile="/folders/myshortcuts/Shared_Folder/telemarketing.csv" 
out=attendance dbms=csv replace; 
getnames=yes; 
RUN;

PROC MEANS DATA = attendance mean median std var q1 q3 qrange MAXDEC=2 ;
var tempo_telefone;
RUN;

PROC UNIVARIATE data = attendance noprint;
var tempo_telefone;
output out=outdata PCTLPTS = 32, 57, 98 PCTLPRE = time time time PCTLNAME = _P32 _P57 _P98;
RUN;

PROC SGPLOT data=attendance;
  vbox tempo_telefone;
RUN;

PROC CORR data=attendance cov outp=CorrCov noprint;
run;

PROC FREQ DATA=attendance ORDER=freq;
    TABLE tempo_telefone / MISSING;
RUN;

title 'Cumulative Distribution Function of Tempo Telefone';
ods graphics on;
PROC UNIVARIATE data=attendance noprint;
   cdf tempo_telefone;
   inset normal(mu sigma);
RUN;

PROC SGPLOT data=attendance;
 scatter x=tempo_telefone y=clientes;
RUN;


