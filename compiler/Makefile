all: parser

parser: lex.yy.c bison.tab.c bison.tab.h stack.h fonctions.h stack.c instructions.h instructions.c fonctions.c interpreteur.c interpreteur.h cross.c cross.h
	gcc -g -o parser bison.tab.c lex.yy.c stack.c instructions.c fonctions.c interpreteur.c cross.c

lex.yy.c: lex.l bison.tab.h
	flex lex.l

bison.tab.c bison.tab.h: bison.y
	bison -t -v -d bison.y

clean:
	rm parser bison.tab.c lex.yy.c bison.tab.h parser.output

test: parser test.c
	./parser < test.c
