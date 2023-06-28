<h1>calcCompiler</h1>

  <p>calcCompiler is a built in calculator compiler project that implements a simple calculator using lex and yacc. It supports basic arithmetic operations, conditional statements, variable assignments, and symbol lookup.</p>

  <h2>Prerequisites</h2>

  <p>To build and run this project, you need to have the following tools installed:</p>

  <ul>
    <li>Lex (Flex)</li>
    <li>Yacc (Bison)</li>
    <li>GCC (GNU Compiler Collection)</li>
  </ul>

  <h2>Getting Started</h2>

  <p>To get started with calcCompiler, follow these steps:</p>

  <ol>
    <li>Clone the repository:</li>
    <pre><code>git clone https://github.com/your-username/calcCompiler.git</code></pre>
    <li>Change into the project directory:</li>
    <pre><code>cd calcCompiler</code></pre>
    <li>Generate the lexer and parser:</li>
    <pre><code>lex calculatorScanner.lex
yacc -d calculatorParser.yacc</code></pre>
    <li>Compile the source code:</li>
    <pre><code>gcc lex.yy.c y.tab.c -o calculator.out</code></pre>
    <li>Run the calculator:</li>
    <pre><code>./calculator.out</code></pre>
  </ol>

  <h2>Usage</h2>

  <p>The calculator supports the following operations:</p>

  <ul>
    <li>Arithmetic operators: <code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, <code>%</code>, <code>**</code> (power)</li>
    <li>Conditional statements: <code>zero?</code>, <code>if</code>, <code>then</code>, <code>else</code></li>
    <li>Variable assignments: <code>let</code>, <code>in</code></li>
    <li>Parentheses: <code>( )</code></li>
    <li>Statement termination: <code>;</code></li>
  </ul>

  <p>Here's an example usage:</p>

  <pre><code>let x = 5;
let y = 2;
let z = x + y * 3;
z;</code></pre>

  <p>This will output: <code>11</code></p>

  <h2>Contributing</h2>

  <p>Contributions are welcome! If you find any issues or have suggestions for improvement, please open an issue or submit a pull request.</p>

  <h2>License</h2>

  <p>This project is licensed under the <a href="LICENSE">MIT License</a>.</p>

  <h2>Acknowledgments</h2>

  <p>This project is inspired by the concepts of lex and yacc and serves as a simple demonstration of a calculator compiler.</p>

  <h2>Contact</h2>

  <p>For questions or support, you can reach out to the project maintainer at your-email@example.com.</p>
