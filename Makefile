all:
	lex nush.l
	yacc nush.y -d
	gcc lex.yy.c y.tab.c -ll -o nush.bin
	./nush.bin nush.txt
