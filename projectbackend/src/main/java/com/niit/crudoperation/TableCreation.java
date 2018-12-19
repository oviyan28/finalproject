package com.niit.crudoperation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dbconfig.Dbconfiguration;

public class TableCreation {
	public static void main( String[] args )
    {
    
	System.out.println( "WELCOME TO HIBERNATE APPLICATION" );
       
 ApplicationContext context=new AnnotationConfigApplicationContext(Dbconfiguration.class);
        
System.out.println("TABLE CREATED SUCCESSFULLY");
    
}

}



