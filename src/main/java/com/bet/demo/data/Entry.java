package com.bet.demo.data;

public class Entry {

    private double amount;
    private String category;
    private String dateTime;
    private String description;
    private int number;
    private String transaction;
    private String user;
    private String sign;

    public Entry(){
    }

    public Entry(double amount, String category, String dateTime, String description, int number, String transaction, String user){
        this.amount = amount;
        this.category = category;
        this.dateTime = dateTime;
        this.description = description;
        this.number = number;
        this.transaction = transaction;
        this.user = user;
        this.setSign();
    }

    public void setSign() {
        if (transaction.equals("expense")){
            this.sign = "-";
        } else if (transaction.equals("income")){
            this.sign = "+";
        }
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
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

    public String getSign(){
        return this.sign;
    }

    @Override
    public String toString(){
        return "Entry{" +
                "amount='" + this.sign+amount + '\'' +
                ", category='" + category + '\'' +
                ", date time='" + dateTime + '\'' +
                ", number='" + number + '\'' +
                ", transaction='" + transaction + '\'' +
                ", user='" + user + '\'' +
                '}';
    }

}
