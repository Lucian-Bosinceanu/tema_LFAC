all:
	lex nush.l
	yacc -d -v nush.y  
	gcc lex.yy.c y.tab.c -ll -o nush.bin
	./nush.bin nush.txt