package com.qst.bean;

public class LinkMan {
    public String username;
    public String name;
    public String  telephonenumber;
    public String remark;

    public LinkMan() {
    }

    public LinkMan(String username, String name, String telephonenumber, String remark) {
        this.username = username;
        this.name = name;
        this.telephonenumber = telephonenumber;
        this.remark = remark;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephonenumber() {
        return telephonenumber;
    }

    public void setTelephonenumber(String telephonenumber) {
        this.telephonenumber = telephonenumber;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "LinkMan{" +
                "username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", telephonenumber=" + telephonenumber +
                ", remark='" + remark + '\'' +
                '}';
    }
}
