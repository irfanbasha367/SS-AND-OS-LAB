%{
int sc=0,cc=0,lc=0,wc=0;
%}
%%
[^ \t\n]+  	{wc++;cc+=yyleng;}
[ ] 		{sc++;}
[ \n] 		{lc++;}
%%
main(int argc, char*argv[])
{
	FILE *fp;
	if(argc==2)
	{
		fp=fopen(argv[1],"r");
		yyin=fp;
	}
	yylex();
	printf("no.of cc=%d\n",cc);
	printf("no.of wc=%d\n",wc);
	printf("no.of sc=%d\n",sc);
	printf("no.of lc=%d\n",lc);
}

