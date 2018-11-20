package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Connect {
    String mysqlUname = "root";
    String mysqlPswd = "root";
    String mysqlURL = "jdbc:mysql://localhost:3306/truebus";
    String driverPath = "com.mysql.jdbc.Driver";
    
    Connection con;
    
    public Connect(){
        this.makeConnection();
    }
    
    public Connection makeConnection(){
        try {
            Class.forName(driverPath);
            con = DriverManager.getConnection(mysqlURL, mysqlUname, mysqlPswd);
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
}