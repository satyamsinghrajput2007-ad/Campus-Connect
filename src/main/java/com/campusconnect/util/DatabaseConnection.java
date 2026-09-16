package com.campusconnect.util;
import com.campusconnect.exception.DatabaseException;
import java.sql.*;
public final class DatabaseConnection {
 private DatabaseConnection(){}
 private static final String URL=env("CAMPUS_DB_URL","jdbc:mysql://localhost:3306/campusconnect?useSSL=false&serverTimezone=UTC");
 private static final String USER=env("CAMPUS_DB_USER","root");
 private static final String PASSWORD=env("CAMPUS_DB_PASSWORD","");
 private static String env(String k,String d){String v=System.getenv(k);return v==null||v.isBlank()?d:v;}
 public static Connection getConnection(){try{return DriverManager.getConnection(URL,USER,PASSWORD);}catch(SQLException e){throw new DatabaseException("Unable to connect to the campus database.",e);}}
}
