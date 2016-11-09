%{
int a=0,s=0,m=0,d=0,ob=0,cb=0,va=0,id=0;
int flaga=0,flags=0,flagm=0,flagd=0;
%}
ID[a-zA-Z][a-zA-Z0-9]*
NOTID [0-9a-zA-Z]+
%%
{ID} { id++; printf("%s is an Identifier\n",yytext);}
{NOTID} {va++;}
[+] {a++; flaga=1;}
[-] {s++; flags=1;}
[*] {m++; flagm=1;}
[/] {d++; flagd=1;}
[(] {ob++; }
[)] {cb++;}
%%
int main()
{
	printf("Enter the Expression\n");
	yylex();
	if(ob-cb!=0|va>0|id==0|a+s+m+d>=id)
	{
		printf("Invalid Expression\n");
	
	}
	else
	{
		printf("Valid Expression\n");
		printf("\nAdd=%d\nSub=%d\nMul=%d\nDiv=%d\n",a,s,m,d);
		printf("Operators are:\n");
		if(flaga)
			printf("+\n");
		if(flags)
			printf("-\n");
		if(flagm)
			printf("*\n");
		if(flagd)
			printf("/\n");
	}
	return 0;
}	

