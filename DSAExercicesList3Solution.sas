
PROC IMPORT datafile="/folders/myshortcuts/Shared_Folder/orcamentos.csv" 
	out=orcamento dbms=csv replace; 
	getnames=yes; 
RUN;

PROC SQL;
	SELECT count(*) AS cnt FROM orcamento 
	WHERE reg_procedencia = 'capital' 
	AND grau_instrucao='ensino médio';
QUIT;


PROC SQL;
	SELECT ROUND(f.ocurrences / t.ocurrences * 100, 0.001) AS percentage
	FROM 
	(SELECT count(*) AS ocurrences FROM orcamento where reg_procedencia = 'interior' and grau_instrucao = 'superior') f,
	(SELECT count(*) AS ocurrences FROM orcamento where reg_procedencia = 'interior') t;
QUIT;


PROC SGPLOT DATA = orcamento;
	VBAR grau_instrucao / GROUP = reg_procedencia STAT=sum;
RUN;

PROC FREQ DATA=orcamento;
	tables grau_instrucao*estado_civil / chisq;
RUN;

PROC MEANS MEAN MEDIAN DATA = orcamento;
	VAR salario;
RUN;

PROC MEANS STD VAR DATA=orcamento;
	VAR salario;
RUN;


