%{
int flag=0;
%}
%%
"and"|"AND"|"or"|"OR"|"not"|"NOT"|"if"|"IF"|"else"|"ELSE"|"but"|"BUT"      {flag=1;}
%%
int main()
{
	printf("Enter the sentence:\n");
	yylex();
	if(flag==0)
		printf("sentence is simple:\n");
	else 
		printf("sentence is compound:\n");
	return 0;
}
