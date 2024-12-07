package com.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class DatabaseConnection {

	public static Connection connection;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcitydb?useSSL=false", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (connection);
	}

	public static void CloseConnection() {
		if (connection != null) {
			try {
				connection.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
		ResultSet rs = null;
		try {
			if (connection == null) {
				getConnection();
			}
			rs = connection.createStatement().executeQuery(SqlQueryString);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return rs;
	}

	public static int insertUpdateFromSqlQuery(String SqlQueryString) {
		int i = 2;
		try {
			if (connection == null) {
				getConnection();
			}
			i = connection.createStatement().executeUpdate(SqlQueryString);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return i;
	}
	
	public static int generateUserId() {
		int uid = 0;
		Random random=new Random();
		uid = random.nextInt((99999 - 100) + 1) + 10;
		//System.out.println("User Id " + uid);
		return uid;
	}
	
	public static int generatePlaceId() {
		int pid = 0;
		Random random=new Random();
		pid = random.nextInt((99999 - 100) + 1) + 10;
		//System.out.println("Place Id " + pid);
		return pid;
	}
	
	public static int generateJobId() {
		int jobId = 0;
		Random random=new Random();
		jobId = random.nextInt((99999 - 100) + 1) + 10;
		//System.out.println("Job Id " + jobId);
		return jobId;
	}
	
	public static int generateCityId() {
		int cityId = 0;
		Random random=new Random();
		cityId = random.nextInt((99999 - 100) + 1) + 10;
		//System.out.println("City Id " + cityId);
		return cityId;
	}
}
