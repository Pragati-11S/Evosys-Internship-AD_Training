package com.mastek.demo;

import java.io.FileOutputStream;

public class FileOutputStreamExample1 {
	public static void main(String args[]) {
		try {
			FileOutputStream fout = new FileOutputStream("D:\\testout.txt");
			fout.write(65);
			fout.close();
			System.out.println("Success..");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
