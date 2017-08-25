/* Question 1 */
data htwt ;
	infile '/folders/myfolders/Tutorial1/tut1htwt.csv' delimiter=";" firstobs=2;
	input id gender $ hight weight siblings;
run;

data test ;
	infile '/folders/myfolders/Tutorial1/tut1test.csv' delimiter=";" firstobs=2;
	input id test;
run;


/* Question 2 */
data htwtf ;
	set htwt;
	where (gender = "F");
run;


/* Question 3 */
proc sort data=htwt;
	by id;
proc sort data=test;
	by id;
data htwttest;
	merge htwt test;
	by id;
run;

data taller183;
	set htwttest;
	where (hight > 183);
run;


/* Question 4 */
data htwtfixed;
	infile '/folders/myfolders/Tutorial1/tut1htwtfixed.txt' firstobs=2;
	input id 1-3 gender $ 4 hight 5-7 weight 8-9 siblings 10;
run;
	

/* Question 5 */
data htwtfixedremo;
	set htwtfixed;
	drop weight; where (id = 365);
run;


/* Question 6 */
proc sort data=htwttest;
	where (gender = "F");
	by descending hight;
run;


/* Question 7 */
data htwttest;
	set htwttest;
	if test >= 80 then grade = "A";
		else if 70 <= test < 80 then grade = "B";
			else if 60 <= test < 70 then grade = "C";
				else if 50 <= test < 60 then grade = "D";
					else grade = "F";
run;
