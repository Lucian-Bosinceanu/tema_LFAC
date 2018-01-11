all:
	yacc nush.y -d
	lex nush.l
	gcc lex.yy.c y.tab.c -ll -o nush.bin
	./nush.bin nush.txt
