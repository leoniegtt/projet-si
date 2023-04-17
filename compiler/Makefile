all: parser

parser: lex.yy.c bison.tab.c bison.tab.h stack.h stack.c
	gcc -g -o parser bison.tab.c lex.yy.c stack.c

lex.yy.c: lex.l bison.tab.h
	flex lex.l

bison.tab.c bison.tab.h: bison.y
	bison -t -v -d bison.y

clean:
	rm parser bison.tab.c lex.yy.c bison.tab.h parser.output

test: parser test.c
	./parser < test.c
