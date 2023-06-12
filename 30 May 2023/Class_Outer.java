package com.aathif;

abstract class AbstractClass {
    public abstract void abstractMethod(); 
}

public class Class_Outer {
	
	static int i = 10; 
    int instanceVariable = 20; 

    public void method() {
        System.out.println("i == " + ++i); 
    }

    static class InnerClass extends AbstractClass {
      

        public void display() {
            System.out.println("i == " + i);
            // System.out.println("instanceVariable == " + instanceVariable); 
        }

        @Override
        public void abstractMethod() {
            System.out.println("Abstract method implementation"); 
        }
    }

    public static void main(String[] a) {
    	Class_Outer.InnerClass ic = new Class_Outer.InnerClass();
        ic.display(); 
        ic.abstractMethod(); 

        Class_Outer co = new Class_Outer();
        co.method(); 
    }

}
