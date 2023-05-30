package com.dal;
	
	
 class MyClass {
	 
	 int a=9;
	
	public void display()
	{
		int a=23;
		int b=56;
		int c=a+b;
		System.out.println("a+b ="+c);
	}
	
	public void aathif()
	{
		String a="Mohammed"; 
		String b="Aathif";
		System.out.println("My Name is :"+a+b);
	}
	


	public static void main(String[] args) {
		MyClass nc= new MyClass();
		nc.display();
		
		MyClass mc= new MyClass();
		mc.aathif();
		
		System.out.println(nc.a);
		
		
	}

}
