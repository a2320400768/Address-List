package com.qst.dao;

import com.qst.bean.LinkMan;
import com.qst.bean.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LinkManDAO {
    Connection conn=null;
    Statement stam=null;
    String sql;
    ResultSet rs=null;

    public boolean addLinkMan(LinkMan linkMan){
        try{
            conn=Mysql.getConn();
            stam=conn.createStatement();
            sql="insert into linkman values('"+linkMan.username+"','"+linkMan.name+"','"+linkMan.telephonenumber+"','"+linkMan.remark+"')";
            if(stam.executeUpdate(sql)>0){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                conn.close();
                stam.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean deleteLinkMan(String telephonenumber){
        try{
            conn=Mysql.getConn();
            stam= conn.createStatement();
            sql="delete from linkman where telephonenumber = '"+telephonenumber+"'";
            if(stam.executeUpdate(sql)>0){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                conn.close();
                stam.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

    public List<LinkMan> selectLinkMan(String selectname,String selectdate){
        List<LinkMan> linkMan=new ArrayList<>();
        try{
            conn=Mysql.getConn();
            stam=conn.createStatement();
            sql="select * from linkman where "+selectname+" = '" + selectdate +"'";
            rs=stam.executeQuery(sql);
            while (rs.next()){
                linkMan.add(new LinkMan(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4)));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                conn.close();
                stam.close();
                rs.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return linkMan;
    }

    public boolean updateLinkMan(LinkMan linkMan,String telephonenumber){
        try{
            conn=Mysql.getConn();
            stam=conn.createStatement();
            sql="update linkman set name= '" +linkMan.getName()+"', telephonenumber='"+linkMan.getTelephonenumber()+"', remark='"+linkMan.getRemark()+"' where telephonenumber='"+telephonenumber+"'" ;
            int count=stam.executeUpdate(sql);
            if(count>0){
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try{
                conn.close();
                stam.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

    public List<LinkMan> showLinkMan(String username){

        List<LinkMan> linkMan=new ArrayList<>();
        try{

            conn=Mysql.getConn();
            stam=conn.createStatement();
            sql="select * from linkman where username= '"+username+"'";
            rs=stam.executeQuery(sql);
            while(rs.next()){
                linkMan.add(new LinkMan(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4)));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                conn.close();
                stam.close();
                rs.close();
            }catch (Exception e){
                e.printStackTrace();
            }

        }
        return linkMan;
    }

}
