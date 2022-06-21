package kr.or.mini;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PostgreSQL {
	public static void main(String[] args) throws ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
		
		String connurl  = "jdbc:postgresql://localhost:5432/postgres";
		String user	    = "postgres";
		String password = "0911";
		
		try (Connection connection = DriverManager.getConnection(connurl, user, password);) {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT VERSION() AS VERSION");
			
			while (rs.next()) {
				String version = rs.getString("version");
				
				System.out.println(version);
			}
			rs.close();
			stmt.close();
			connection.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
