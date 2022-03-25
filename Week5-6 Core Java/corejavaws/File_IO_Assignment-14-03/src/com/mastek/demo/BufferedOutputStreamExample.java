package com.mastek.demo;

import java.io.*;

public class BufferedOutputStreamExample {
	public static void main(String args[]) throws IOException {
		FileOutputStream fout=new FileOutputStream("D:\\testout.txt");
		BufferedOutputStream bout=new BufferedOutputStream(fout);
		String s="Welcome to JavaTPoint";
		byte b[]=s.getBytes();
		bout.write(b);
		bout.flush();
		bout.close();
		fout.close();
		System.out.println("Success..");
	}
}
