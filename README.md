# C_VarDec_Compiler
Flex and Bison Compiler/Parser for C Subset: A simple compiler/parser project demonstrating lexical analysis and parsing using Flex and Bison tools for a subset of the C programming language. Supports variable declarations and assignments for integers and floats. Includes input/output files for testing. 



-------------------
This repository contains a flex code file (`b.l`), a Bison file (`b.y`), and input/output files (`input.txt` and `output.txt`) demonstrating a simple compiler/parser for a subset of the C programming language.

The compiler/parser implemented in this repository focuses on parsing and generating code for C declarative statements for integer and float values. It supports declarations of variables with or without initialization.
For example:
int a1;
int b_3 = 4, v2 = 4;
float d2 = 3.5;


b.l (Flex Code):
-----------------
The `b.l` file is implemented using Flex, a tool for generating scanners. It defines lexical rules for recognizing tokens in the input source code. Here are the main components:
- Token Definitions: Rules are defined for recognizing keywords (`int`, `float`, `end`), identifiers (variable names), integers, floats, and special characters like `,`, `=`, `;`, and whitespace.
- Lexical Actions: Actions associated with recognized tokens include storing values (`yylval`) for integers, floats, and identifiers.
- Error Handling: An error message is generated for any invalid characters encountered.


b.y (Bison File):
-------------------
The `b.y` file is implemented using Bison, a tool for generating parsers. It defines a grammar for parsing the input source code. Here are the main components:
- Token Declarations: Tokens recognized by the parser are declared along with their types (`INTEGER`, `FLOAT`, `varName`, `INTtype`, `FLOATtype`, `end`).
- Grammar Rules: Grammar rules define the structure of the input language. The rules describe statements (`S`), expressions (`E`), type declarations (`T` and `G`), assignments (`X` and `Y`), and value assignments (`I` and `F`).
- Semantic Actions: Actions associated with grammar rules generate output code based on the parsed input. These actions print formatted output corresponding to the parsed statements.
- Error Handling: An error message is generated for any syntax errors encountered during parsing.


Input and Output Files:
-------------------------
The `input.txt` file contains a sample input source code written in the subset of C language. The `output.txt` file demonstrates the output generated by the parser after parsing the input. Each line in the output corresponds to a parsed statement from the input.


Usage:
--------
To use this compiler/parser:
1. Ensure you have Flex and Bison installed on your system.
2. Compile the flex code and bison code using the following commands:

bison -d b.y
flex b.l
gcc lex.yy.c b.tab.c

3. Run the compiled parser executable:

./a.exe

4. The output will be generated in the `output.txt` file.


Contributors:
---------------
- <a href="https://github.com/Bansi5513">*Bansi Patel*</a>
- <a href="https://github.com/Nikunj-Goswami4">*Nikunj Goswami*</a>
