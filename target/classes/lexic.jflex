package org.codenotes.arithmetic.analyzer.lexic;

import java_cup.runtime.Symbol;

import org.codenotes.arithmetic.analyzer.syntax.Tokens;

%%

%class ArithmeticLexAnalizer
%unicode
%cupsym Tokens
%cup
%public
%line
%column

Br = \n | \r | \r\n
Spaces = {Br} | [ \t\f]

Int = [0-9]+
Number =  {Int} ("." {Int})?
Id = [a-zA-Z$_] [a-zA-Z_$0-9]+ | [a-zA-Z$] [a-zA-Z_$0-9]*

%%

<YYINITIAL> {
    {Spaces}                   { /* ignorar epicamente */ }
}

<YYINITIAL> {
    {Number}                     { return new Symbol(Tokens.NUMBER, yytext()); }
    {Id}                         { return new Symbol(Tokens.ID, yytext()); }
    "("                          { return new Symbol(Tokens.LEFT_PAR); }
    ")"                          { return new Symbol(Tokens.RIGHT_PAR); }
    "*"                          { return new Symbol(Tokens.TIMES); }
    "/"                          { return new Symbol(Tokens.DIV); }
    "+"                          { return new Symbol(Tokens.PLUS); }
    "-"                          { return new Symbol(Tokens.MINUS); }
    "="                          { return new Symbol(Tokens.ASSIGN); }
    ";"                          { return new Symbol(Tokens.SEPARATOR); }
}
