%{
int idc=0;
%}
%x 	IDENT
ID 	[a-zA-z][a-zA-Z0-9]*
DTYPE 	"int"|"float"|"char"
%%
{DTYPE}		{BEGIN IDENT;}
<IDENT>{ID}"," 	{idc++;}
<IDENT>{ID}";" 	{idc++; BEGIN INITIAL;}
.|\n		;
%%
int main(int argc,char*argv[])
{
	FILE *fp;
	if(argc==2)
	{
		fp=fopen(argv[1],"r");
		yyin=fp;
		yylex();
		printf("Number of identifiers is=%d\n",idc);
	}
	else
	printf("Input file is missing:");
	return 0;
}
