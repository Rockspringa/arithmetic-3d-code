package org.codenotes.arithmetic;

import org.codenotes.arithmetic.analyzer.lexic.ArithmeticLexAnalizer;
import org.codenotes.arithmetic.analyzer.syntax.ArithmeticParser;

import java.io.FileReader;
import java.io.InputStreamReader;

public class Main {

    public static void main(String... args) throws Exception {
        if (args.length != 0) {
            parse(new FileReader(args[0]));
        } else {
            System.out.println("Ingrese las asignaciones separadas por ';'");
            parse(new InputStreamReader(System.in));
        }
    }

    private static void parse(InputStreamReader reader) throws Exception {
        new ArithmeticParser(new ArithmeticLexAnalizer(reader)).parse();
    }
}
