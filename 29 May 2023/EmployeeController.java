package com.dedalus.controller;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.dedalus.model.Employee;

public class EmployeeController implements EmployeeInterface {
	
	Scanner sc = new Scanner(System.in);

	Employee emp;
	
	List<Employee> emplist = new ArrayList<>();
	
	public void addEmployee()
	{
		emp = new Employee();
		System.out.println("Enter Eno");
		int eno = sc.nextInt();
		emp.setEno(eno);
		System.out.println(emp.getEno());
		System.out.println("Enter Ename");
		String ename = sc.next();
		emp.setEname(ename);
		System.out.println(emp.getEname());
		
		emplist.add(emp);
	}
	
	public void viewEmployee() {
//		System.out.println(emp.getEmpno());
//		System.out.println(emp.getEname());
		
		System.out.println(emplist);
	}
	
	public void SerialEg() {
		try{
			//Employee emp = new Employee();
		
			FileOutputStream fos = new FileOutputStream("dedalus.txt");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			
			oos.writeObject(emplist);
			System.out.println("Serilized to file dedalus.txt");
			oos.close();
			fos.close();
			}
			catch(FileNotFoundException fnf)
			{
				System.out.println("No file");
			}
			catch(IOException ae)
			{
				System.out.println("No file");
			}
			
	}
	
	public void DeSerialEg() {
		try{
			
			
			FileInputStream fis = new FileInputStream("dedalus.txt");
			ObjectInputStream ois = new ObjectInputStream(fis);
			
			emplist = (ArrayList<Employee>) ois.readObject();
			System.out.println("DeSerilized from file dedalus.txt");
			
			for(Employee emp : emplist) {
				System.out.println(emp.getEno() + " " + emp.getEname());
			}
			ois.close();
			fis.close();
			
			}
			catch(FileNotFoundException fnf)
			{
				System.out.println("No file");
			}
			catch(ClassNotFoundException cnf)
			{
				System.out.println("No Emp class");
			}
			catch(IOException ae)
			{
				System.out.println("No file");
			}

	}
}