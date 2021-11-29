package com.bet.demo.data;

import com.google.cloud.firestore.QueryDocumentSnapshot;

import java.util.ArrayList;
import java.util.List;

public class User {
    private String email;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private List<Entry> entries = new ArrayList<>();
    private List<Entry> expenses = new ArrayList<>();
    private List<Entry> income =new ArrayList<>();
    private List<Entry> savings = new ArrayList<>();
    private List<Entry> needs = new ArrayList<>();
    private List<Entry> wants = new ArrayList<>();

    public User() {
    }

    public User(String email, String firstname, String lastname, String username, String password) {
        this.email = email;
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void addAnEntry(Entry entry){
        this.entries.add(entry);
    }

    public List getEntry(){
        this.sortEntriesByDate();
        return this.entries;
    }

    public boolean isEntryEmpty(){
        return this.entries.isEmpty();
    }

    public void makeEntryEmpty(){
        this.entries.clear();
    }

    private void addAnExpense(Entry entry){
        this.expenses.add(entry);
    }

    private void addAnIncome(Entry entry){
        this.income.add(entry);
    }

    private void splitEntries(){
        for (Entry entry: entries) {
            if(entry.getTransaction().equals("expense")){
                addAnExpense(entry);
            } else if (entry.getTransaction().equals("income")){
                addAnIncome(entry);
            }
        }
    }

    public int noOfEntry(){
        return this.entries.size();
    }

    public int noOfExpense(){
        return this.expenses.size();
    }

    public int noOfIncome(){
        return this.income.size();
    }

    private void sortSpendings(){
        this.splitEntries();
        this.wants = new ArrayList<>();
        this.needs = new ArrayList<>();
        this.savings = new ArrayList<>();

        for (Entry entry: this.expenses) {
            String category = entry.getCategory();
            switch (category){
                case "wants":
                    this.wants.add(entry);
                    break;
                case "needs":
                    this.needs.add(entry);
                    break;
                case "savings":
                    this.savings.add(entry);
                    break;
                default:
                    break;
            }
        }
        for (Entry entry: this.income){
            this.savings.add(entry);
        }
    }

    public List getWants(){
        this.splitEntries();
        return this.wants;
    }

    public List getNeeds(){
        this.splitEntries();
        return this.needs;
    }

    public List getSavings(){
        this.splitEntries();
        return this.savings;
    }

    private void sortEntriesByDate(){
        this.entries.sort(new DateSorter());
    }

    public double getCurrentBalance(){
        this.splitEntries();
        double income = 0.0;
        double expense = 0.0;
        for (Entry entry: this.expenses) {
            expense += entry.getAmount();
        }
        for (Entry entry: this.income){
            income += entry.getAmount();
        }
        return income-expense;
    }

    public double getTotalWants(){
        this.sortSpendings();
        double total = 0.0;
        for (Entry entry: this.wants){
            total += entry.getAmount();
        }
        return total;
    }

    public double getTotalNeeds(){
        this.sortSpendings();
        double total = 0.0;
        for (Entry entry: this.needs){
            total += entry.getAmount();
        }
        return total;
    }

    public double getTotalSavings(){
        this.sortSpendings();
        double total =0.0;
        for (Entry entry: this.savings){
            total += entry.getAmount();
        }
        return total;
    }

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
