# KPcompiler: Implementing a Language with LLVM

## How to build it
~~~
make
./main
~~~

## How it works all together?

### Lexer

Tokens identifiers are stored under `lexer/token.h` file and lexer implementation under `lexer/lexer.cpp` file.

Tokens are just an `enum` structure, which consists of token identifier and a number assigned to this token.
This way, we can identify tokens through lexical analysis.

The actual reading of a stream is implemented in `lexer/lexer.cpp` file.
Function `gettok` reads characters one-by-one from `stdin` and groups them in tokens.
So, basically, `gettok` function reads characters and returns numbers (tokens).

### AST (Abstract Syntax Tree)

Basic block of each AST node is `ExprAST` node, which is stored under `ast/ExprAST.h` file.
All other nodes are extends from `ExprAST` node.

Each of AST nodes must implement one method - `codegen()`.
`codegen()` method is responsible for generating LLVM IR, using LLVM IRBuilder API, that's all.

### Parser

Parser is where lexer and AST are combined together.
The actual implementation of a parser stores into `parser/parser.cpp` file.

When parsing is done, got the last character/token from the stream, we have an AST representation of our code.
We can use it and generate LLVM IR from our AST using `codegen()` method in each AST node.

This process is done in `main.cpp` file.
`main.cpp` file is the place where all the parts are combined in one place.
