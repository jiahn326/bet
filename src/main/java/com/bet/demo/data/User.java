package com.bet.demo.data;

public class User {
    private String id;
    private String fname;
    private String lname;
    private String username;
    private String pword;

    public User() {
    }

    public User(String id, String fname, String lname, String username, String pword) {
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.username = username;
        this.pword = pword;
    }

    public User(String fname, String lname, String username, String pword) {
        this.fname = fname;
        this.lname = lname;
        this.username = username;
        this.pword = pword;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPword() {
        return pword;
    }

    public void setPword(String pword) {
        this.pword = pword;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", fname='" + fname + '\'' +
                ", lname='" + lname + '\'' +
                ", username='" + username + '\'' +
                ", pword='" + pword + '\'' +
                '}';
    }
}
