SOURCES = $(shell find ast KPcompiler lexer logger parser -name '*.cpp')
HEADERS = $(shell find ast KPcompiler lexer logger parser -name '*.h')
OBJ = ${SOURCES:.cpp=.o}

CC = clang++-17
CFLAGS = -g -O3 -I /usr/include/llvm-17 -I /usr/include/llvm-c-17 -I /usr/include/c++/11 -I /usr/include/x86_64-linux-gnu/c++/11 -I llvm/include -I llvm/build/include -I ./ -L/usr/lib/llvm-17/lib -lLLVM
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs all`

.PHONY: main

main: main.cpp ${OBJ}
	${CC} ${CFLAGS} ${LLVMFLAGS} ${OBJ} $< -o $@

clean:
	rm -r ${OBJ}

%.o: %.cpp ${HEADERS}
	${CC} ${CFLAGS} ${LLVMFLAGS} -c $< -o $@
