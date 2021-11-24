package com.bet.demo.data;

public class Entry {

    private double amount;
    private String category;
    private String dateTime;
    private String description;
    private String transaction;
    private String user;

    public Entry(){
    }

    public Entry(double amount, String category, String dateTime, String description, String transaction, String user){
        this.amount = amount;
        this.category = category;
        this.dateTime = dateTime;
        this.description = description;
        this.transaction = transaction;
        this.user = user;
    }

    public double getAmount(){
        return this.amount;
    }

    public void setAmount(double amount){
        this.amount = amount;
    }

    public String getCategory(){
        return this.category;
    }

    public void setCategory(String category){
        this.category = category;
    }

    public String getDateTime(){
        return this.dateTime;
    }

    public void setDateTime(String dateTime){
        this.dateTime = dateTime;
    }

    public String getDescription(){
        return this.description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public String getTransaction(){
        return this.transaction;
    }

    public void setTransaction(String transaction){
        this.transaction = transaction;
    }

    public String getUser(){
        return this.user;
    }

    public void setUser(String user){
        this.user = user;
    }

    @Override
    public String toString(){
        return "Entry{" +
                "amount='" + amount + '\'' +
                ", category='" + category + '\'' +
                ", date time='" + dateTime + '\'' +
                ", transaction='" + transaction + '\'' +
                ", user='" + user + '\'' +
                '}';
    }

}
