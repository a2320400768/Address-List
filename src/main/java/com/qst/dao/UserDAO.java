package com.qst.dao;

import com.qst.bean.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDAO {

    Connection conn=null;
    Statement stam=null;
    String sql;
    ResultSet rs=null;
    public boolean saveUser(User user) {
        try{
            conn=Mysql.getConn();
            stam=conn.createStatement();
            sql="select username from user where username='" +user.getUsername()+"'";
            rs=stam.executeQuery(sql);
            if(rs.next()){
                if(rs.getString(1).equals(user.getUsername())){
                    return false;
                }
            }
            sql="insert into user values("+ "'"+ user.getUsername()+"'"+","+"'"+user.getPassword()+"'"+")";
            stam.execute(sql);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            try {
                conn.close();
                stam.close();
                rs.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    public boolean readUser(User user){
        try{
            conn=Mysql.getConn();
            stam=conn.createStatement();
            sql="select username,password from user where username='" +user.getUsername()+"'";
            rs=stam.executeQuery(sql);
            if(rs.next()){
                if(rs.getString(1).equals(user.getUsername())&&rs.getString(2).equals(user.getPassword())){
                    return true;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                conn.close();
                stam.close();
                rs.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

}
