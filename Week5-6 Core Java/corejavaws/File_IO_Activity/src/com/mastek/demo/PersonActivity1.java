package com.mastek.demo;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class PersonActivity1 {
	public static void main(String args[]){  
        Scanner scan = new Scanner(System.in);
        System.out.println("First Name: ");
        String fname = scan.next();
        System.out.println("Last Name: ");
        String lname = scan.next();
        System.out.println("First Name:" + " " + fname + " " + "Last Name:" + " " + lname);
        scan.close();
        
        try(FileWriter fw = new FileWriter("D:\\users.txt", true);
                BufferedWriter bw = new BufferedWriter(fw);
                PrintWriter out = new PrintWriter(bw))
                {
        			out.write(fname + " : " + lname+'\n');
        			out.close();
                } catch (IOException e) {
                	e.printStackTrace();
                }
	}
}
