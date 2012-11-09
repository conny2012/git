package dataconnection;

import java.sql.Connection;

public class JDBC {
	
	private java.sql.Connection jdbcconnection;
	
	public Connection connect(){
		 
		try{
			Class.forName("com.mysql.jdbc.Driver");  
			//jdbcconnection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/data", "root", "root");
			jdbcconnection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3307/easyStart", "easystart", "easystart");
			System.out.println("treiber wurde geladen (3307)");
			
		}
		catch (Exception ex){
			try	{
				jdbcconnection = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/easyStart", "easystart", "easystart");
				System.out.println("treiber wurde geladen (3306)");
			}
			catch(Exception e){
				ex.printStackTrace();	
			}
		}
		return jdbcconnection;
	}

	public void closeconnection(){
		try {
			jdbcconnection.close();
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
}