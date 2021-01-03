package com.qst.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Mysql {
    public static Connection getConn() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/users?useSSL=true";
        String name="root";
        String password="a9952754971";
        Connection conn= DriverManager.getConnection(url,name,password);
        return conn;
    }
}
