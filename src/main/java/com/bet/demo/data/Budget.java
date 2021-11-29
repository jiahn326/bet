package com.bet.demo.data;

public class Budget {

    private int wants;
    private int needs;
    private int savings;

    public Budget(){

    }

    public Budget(int wants, int needs, int savings){
        this.wants = wants;
        this.needs = needs;
        this.savings = savings;
    }

    public int getNeeds() {
        return needs;
    }

    public void setNeeds(int needs) {
        this.needs = needs;
    }

    public int getSavings() {
        return savings;
    }

    public void setSavings(int savings) {
        this.savings = savings;
    }

    public int getWants() {
        return wants;
    }

    public void setWants(int wants) {
        this.wants = wants;
    }

    @Override
    public String toString(){
        return "Budget{" +
                "wants='" + wants + '\'' +
                ", needs='" + needs + '\'' +
                ", savings='" + savings +
                '}';
    }
}
