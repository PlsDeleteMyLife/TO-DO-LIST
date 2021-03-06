main: bin/main

test: bin/main-test

bin/main: build/main.o build/create_or_add.o build/menu.o build/print_view.o build/copy.o build/delete.o 
	gcc -Wall -Werror build/main.o build/create_or_add.o build/menu.o build/print_view.o build/copy.o build/delete.o -o bin/main -lncurses

build/main.o: src/main.c
	gcc -std=c99 -I includes -Wall -lncurses -ltinfo -Werror -c src/main.c -o build/main.o

bin/main-test: build/main-test.o build/create_or_add.o build/menu.o build/print_view.o build/copy.o build/delete.o 
	gcc -Wall -Werror build/main-test.o build/create_or_add.o build/menu.o build/print_view.o build/copy.o build/delete.o -o bin/main-test -lncurses

build/main-test.o: test/main.c
	gcc -std=c99 -I includes -I src -Wall -lncurses -ltinfo -Werror -c test/main.c -o build/main-test.o

build/create_or_add.o: src/create_or_add.c
	gcc -std=c99 -Wall -Werror -c src/create_or_add.c -o build/create_or_add.o

build/menu.o: src/menu.c
	gcc -std=c99 -Wall -Werror -c src/menu.c -o build/menu.o

build/print_view.o: src/print_view.c
	gcc -std=c99 -Wall -Werror -c src/print_view.c -o build/print_view.o

build/copy.o: src/copy.c
	gcc -std=c99 -Wall -Werror -c src/copy.c -o build/copy.o

build/delete.o: src/delete.c
	gcc -std=c99 -Wall -Werror -c src/delete.c -o build/delete.o


.PHONY : clean
clean:
	rm -rf build/*.o
