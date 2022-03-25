package com.mastek.demo;
import java.io.*; 
public class SequenceInputStreamExample2 {
	public static void main(String args[])throws Exception{    
		   FileInputStream fin1=new FileInputStream("D:\\testin.txt");    
		   FileInputStream fin2=new FileInputStream("D:\\testin.txt");    
		   FileOutputStream fout=new FileOutputStream("D:\\testout1.txt");      
		   SequenceInputStream sis=new SequenceInputStream(fin1,fin2);    
		   int i;    
		   while((i=sis.read())!=-1)    
		   {    
		     fout.write(i);        
		   }    
		   sis.close();    
		   fout.close();      
		   fin1.close();      
		   fin2.close();       
		   System.out.println("Success..");  
		  } 
}

   