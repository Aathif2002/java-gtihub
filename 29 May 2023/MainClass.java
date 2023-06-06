package com.dedalus.view;

import java.util.Scanner;

import com.dedalus.controller.EmployeeController;

public class MainClass {

	public static void main(String[] args) {
		
		System.out.println("Wecome to dedalus");
		EmployeeController ec = new EmployeeController();
		Scanner sc = new Scanner(System.in);
		String ch=null;
		do {
		System.out.println("Enter your choice: \n 1. Add Employee \n 2. View Employee");
		int choice =sc.nextInt();
		switch (choice) {
		case 1: {
			ec.addEmployee();
			
			break;
		}
       case 2: {
    	   ec.viewEmployee();
			
			break;
		}
		default:
			System.out.println("Please Enter valid number...");
			break;
		}
		
		System.out.println("Do u want to continue Y | y");
		ch=sc.next();
		
	} while(ch.equals("Y") || ch.equals("y"));
		System.out.println("Thanks for using our system.");
		System.exit(0);
		
	}

}
