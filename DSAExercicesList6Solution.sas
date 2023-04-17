
/* Carregando o Dataset */
DATA nascimentos (keep=weight boy);
SET sashelp.bweight;
RUN;

PROC SQL; 
 SELECT 
 	MEAN(Weight) AS All,
 	(SELECT MEAN(Weight) FROM nascimentos WHERE Boy=1)AS Boy,
 	(SELECT MEAN(Weight) FROM nascimentos WHERE Boy=0) AS Girl
 FROM nascimentos;
Quit;

PROC SQL;
	SELECT count(*) FROM nascimentos
	WHERE RANUNI(0) <= 0.1;
quit;

PROC SQL;
	SELECT * FROM nascimentos (OBS=5000)
	ORDER BY RANUNI(0);
quit;

PROC SURVEYSELECT data=nascimentos
	out = perc10_nasc
	method = srs
	samprate = 0.1;
run;

PROC SURVEYSELECT data=nascimentos
	out = perc10_nasc
	method = srs
	sampsize= 5000;
run;

PROC SQL;
	CREATE TABLE Male_Samples_2500 AS 
	SELECT * FROM nascimentos (OBS=2500)
	WHERE Boy = 1
	ORDER BY RANUNI(0);
quit;


PROC SQL;
	CREATE TABLE Female_Samples_2500 AS
	SELECT * FROM nascimentos (OBS=2500)
	WHERE Boy = 0
	ORDER BY RANUNI(0);
quit;

PROC SQL;
	SELECT * FROM Male_Samples_2500
	UNION CORRESPONDING ALL 
	SELECT * FROM Female_Samples_2500;
quit;


	
	

