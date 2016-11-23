package com.zzy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	private static String dbName = "bookdb";
	private static String user = "tendernesszzy";
	private static String password = "994599";
	private static String parameter = "?characterEncoding=utf8";
	private static String dburl = "jdbc:mysql://pnrorvepeufu.rds.sae.sina.com.cn:10579/";
//	private static String url  = dburl + dbName + parameter;
	private static String url  = dburl + dbName ;
	private static Statement stmt = null;
	private static Connection con = null;
	
	public DBConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			stmt = con.createStatement();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} 
	
	public Connection getConnection() {
		return con;
	}
	
	public ResultSet select(String sql) {
		System.out.println("DBConnection.select()");
		ResultSet rs = null;
		try {
			 rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			System.out.println(sql);
			e.printStackTrace();
		}
		System.out.println(rs==null);
		return rs;
	}
	
	public boolean execSql(String sql) {
		try {
			return stmt.execute(sql);
		} catch (SQLException e) {
			return false;
		}
	}
	
	public int executeQuery(String sql) {
		try {
			return stmt.executeUpdate(sql);
		} catch (SQLException e) {
			return -1;
		}
	}
	
	public boolean close() {
		try {
			con.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
