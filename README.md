<h1>CalcCompiler</h1>
<p>
  The CalcCompiler repository contains the code and resources for a calculator compiler project that implements a simple calculator<br>
  using Lex & Yacc (also known as flex and bison) tools.<br>
  It supports basic arithmetic operations, conditional statements, variable assignments, and symbol lookup.
</p>

<h2>Getting Started</h2>
<p>To build and run this project, you need to have the following tools installed</p>

<h3>Prerequisites</h3>
<ul>
  <li>Flex (Lex)</li>
  <li>Bison (Yacc)</li>
  <li>GCC (GNU Compiler Collection)</li>
</ul>

<h3>Installation</h3>
<ol>
  <li>
    Clone or download the repository to your local machine
    <pre>$ git clone https://github.com/Nitzantomer1998/CalcCompiler.git</pre>
  </li>
  <li>
    Change into the project directory
    <pre><code>cd CalcCompiler</code></pre>
  </li>
  <li>
    Generate the Scanner and Parser
    <pre><code>lex calculatorScanner.lex</code><br><code>yacc -d calculatorParser.yacc</code></pre>
  </li>
  <li>
    Compile the source code
    <pre><code>gcc lex.yy.c y.tab.c -o calculator.out</code></pre>
  </li>
  <li>
    Run the calculator
    <pre><code>./calculator.out</code></pre>
  </li>
</ol>

<h2>Features</h2>
<ul>
  <li>
    Arithmetic operators: <code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, <code>%</code>, <code>**</code>
    <ul>
      <li>Addition: <code>+(1,2);</code></li>
      <li>Multiplication: <code>*(3,2);</code></li>
      <li>Exponentiation: <code>**(4,3);</code></li>
    </ul>
  </li>
  <br>
  <li>
    Conditional statements: <code>zero?</code>, <code>if</code>, <code>then</code>, <code>else</code>
     <ul>
      <li>Check if zero: <code>zero? (/(5,5));</code></li>
      <li>If-then-else: <code>if (+(1,0)) then *(5,5) else *(5,1);</code></li>
     </ul>
  </li>
  <br>
  <li>
    Variable assignments: <code>let</code>, <code>in</code>
    <ul>
      <li>Assign and use a variable: <code>let integer = +(5,5) in integer;</code></li>
    </ul>
  </li>
  <br>
  <li>Parentheses: <code>( )</code></li>
  <br>
  <li>Statement termination: <code>;</code></li>
</ul>

<h2>Limitations</h2>
<ul>
   <li>The calculator does not support advanced mathematical functions, trigonometric operations, etc.</li>
   <li>The parser may not provide very descriptive error messages for certain input errors, making it harder to debug.</li>
   <li>The maximum length of symbol names in the symbol table is limited to 20 characters.</li>
</ul>

<h2>Future improvements</h2>
<ul>
   <li>Implement support for user-defined functions and procedures to enhance the calculator's functionality.</li>
   <li>Enhance the error handling and error messages to provide more informative feedback to users when input errors occur.</li>
   <li>Optimize the code generation process for mathematical operations to improve performance.</li>
   <li>Implement additional mathematical functions, such as trigonometric, logarithmic, and exponential functions, to make the calculator more versatile.</li>
</ul>

<h2>Support</h2>
<p>For any questions or issues, please open an issue on the GitHub repository or contact the me directly.</p>

<h2>Contributing</h2>
<p>I welcome contributions from the community. If you are interested in contributing to this project, please follow these guidelines</p>
<ul>
   <li>Fork the repository and create a new branch for your changes.</li>
   <li>Make your changes and ensure that the code is well-documented and properly tested.</li>
   <li>Open a pull request and provide a clear and detailed explanation of your changes and the reasoning behind them.</li>
   <li>Be prepared to answer questions and address any issues or feedback on your pull request.</li>
</ul>
