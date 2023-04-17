
PROC IMPORT datafile="/folders/myshortcuts/Shared_Folder/exame.csv" 
	out=exame dbms=csv replace; 
	getnames=yes; 
RUN;

PROC TABULATE data=exame;
class sexo;
table sexo ALL; 
RUN;

PROC TABULATE data=exame;
class sexo tipo;
table sexo tipo ALL; 
RUN;

PROC TABULATE data=exame;
  class tipo;
  table tipo * (n pctn) All;
RUN;

PROC TABULATE data=exame;
  class sexo tipo;
  table tipo, (sexo All) * (n*f=5. colpctn*f=Pctfmt7.1) / RTS=25;
  keylabel All="All genders" n='Count' colpctn='%';
RUN;

