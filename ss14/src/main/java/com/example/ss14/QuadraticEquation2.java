package com.example.ss14;

import java.util.Scanner;

public class QuadraticEquation2 {
    static Scanner scanner = new Scanner(System.in);
    static void QuadraticEquation(double a, double b, double c){
        double x1 = 0.0;
        double x2 = 0.0;
        double delta = 0.0;

        delta = b*b - 4*a*c;

        if (delta < 0){
            System.out.println("Phương trình vô nghiệm");
        } else if (delta == 0) {
            x1 = -b / 2*a;
            x2 = -b / 2*a;
            System.out.println("Phương trình có nghiệm kép x1=x2 là: " + x1 + x2);
        }else {
            x1 = ((-b + Math.sqrt(delta)) / (2*a));
            x2 = ((-b - Math.sqrt(delta)) / (2*a));
            System.out.println("Phương trình có 2 nghiệm là: " + x1 + "và"  + x2);
        }
    }

    public static void main(String[] args) {
        System.out.print("Nhập a: ");
        double a = Double.parseDouble(scanner.nextLine());
        System.out.print("Nhập b: ");
        double b = Double.parseDouble(scanner.nextLine());
        System.out.print("Nhập c: ");
        double c = Double.parseDouble(scanner.nextLine());
        QuadraticEquation(a,b,c);
    }
}
