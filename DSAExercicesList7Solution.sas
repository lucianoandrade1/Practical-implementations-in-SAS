/* Dataset creation */
data Heights;
label Height = 'Height (cm)';
input Height @@;
datalines;
164.1 160.9 164.1 164.7 166.7 
165.0 163.7 167.4 164.9 163.7
164.0 167.5 162.8 163.9 165.9 
162.3 164.1 160.6 168.6 168.6
163.7 163.0 164.7 168.2 166.7 
162.8 164.0 164.1 162.1 162.9
162.7 160.9 161.6 164.6 165.7 
166.6 166.7 166.0 168.5 164.4
160.5 163.0 160.0 161.6 164.3 
160.2 163.5 164.7 166.0 165.1
163.6 162.0 163.6 165.8 166.0 
165.4 163.5 166.3 166.2 167.5
165.8 163.1 165.8 164.4 164.0 
164.9 165.7 161.0 164.1 165.5
168.6 166.6 165.7 165.1 170.0;


title 'Analysis of Female Heights (95%)';
ods select BasicIntervals;
proc univariate data=Heights cibasic (alpha=0.05);
   var Height;
run;

title 'Analysis of Female Heights (90%)';
ods select BasicIntervals;
proc univariate data=Heights cibasic (alpha=0.1);
   var Height;
run;


