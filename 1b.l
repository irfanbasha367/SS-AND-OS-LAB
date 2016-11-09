%{
int c=0;
%}
%x cmt
%x ct
%%
"//" 		{BEGIN ct;}
<ct>.\n 	{c++;BEGIN INITIAL;}
<ct>. 		;
"/*" 		{BEGIN cmt;}
<cmt>\n 	{c++;}
<cmt>.\n        {c++;}
<cmt>"*/"	{c++;BEGIN INITIAL;}
<cmt>.		;
%%
main(int argc,char *argv[])
{
	FILE *fp1,*fp2;
	if(argc==3)
	{
		fp1=fopen(argv[1],"r");
		fp2=fopen(argv[2],"w");
		yyin=fp1;
		yyout=fp2;
	}
	yylex();
	printf("no.of comment lines=%d\n",c);
} 
