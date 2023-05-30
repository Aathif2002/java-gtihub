package com.dedalus.controller;

import java.util.Scanner;

import com.dedalus.model.Employee;

public class EmployeeController {
	Employee emp = new Employee();
	Scanner sc= new Scanner(System.in);
	public void addEmployee() {
		
		
		System.out.println("Enter the Number:");
		int eno = sc.nextInt();
		emp.setEmpno(eno);
		
		System.out.println("Enter the Name:");
		String ename= sc.next();
		emp.setEname(ename);
		
		
	}
	public void viewEmployee() {
		//System.out.println(emp.getEmpno());
		//System.out.println(emp.getEname());
		System.out.println(emp);
	}

}
