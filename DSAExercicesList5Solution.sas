
DATA _null_;
	do
		y = pdf('BINOM', 1, .10, 4);
		put 'Probability: ' y;
	end;
RUN;



