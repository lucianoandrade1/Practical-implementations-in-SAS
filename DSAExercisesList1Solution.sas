
PROC IMPORT datafile="/folders/myshortcuts/Shared_Folder/dataset.csv" 
out=cars dbms=csv replace; 
getnames=yes; 
RUN;


PROC FREQ DATA=cars NLEVELS ORDER = FREQ;
    TABLE cor;
RUN;

PROC FREQ DATA=cars NLYVELS ORDER = FREQ;
	TABLE ano / maxlevels=3;
RUN;

Ods graphics on;
PROC FREQ data=cars ORDER=FREQ;
Tables ano/ maxlevels=3 PLOTS=freqplot (type=bar scale=percent);
RUN;
Ods graphics off;

PROC FREQ DATA=cars NLYVELS ORDER = FREQ;
	TABLE transmissao;
RUN;

PROC TEMPLATE;
define statgraph my_pie_chart;
	begingraph;
		layout region;
			piechart category=Transmissao /
			datalabelcontent=(category percent)
			datalabellocation=outside;
		endlayout;
	endgraph;
end;
RUN;
 
PROC SGRENDER data=cars
              template=my_pie_chart;
RUN;

PROC FREQ DATA=cars NLYVELS ORDER = FREQ;
	TABLE preco;
RUN;

PROC CORRESP data=cars dimens=1 observed short OUTF=Atr;
   ods select observed;
   tables ano, transmissao;
RUN;

PROC SGPLOT DATA = cars;
 VBAR ano / GROUP = transmissao GROUPDISPLAY = CLUSTER;
RUN;

