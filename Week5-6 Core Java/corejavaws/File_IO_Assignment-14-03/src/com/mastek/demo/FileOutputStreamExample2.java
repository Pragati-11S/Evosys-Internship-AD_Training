package com.mastek.demo;

import java.io.FileOutputStream;

public class FileOutputStreamExample2 {
	public static void main(String args[]) {
		try {
			FileOutputStream fout=new FileOutputStream("D:\\testout.txt");
			String s="Welcome to JavaTPoint";
			byte b[]=s.getBytes();
			fout.write(b);
			fout.close();
			System.out.println("Success..");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
