package com.bet.demo.data;

public class Search {


    private String entryType;
    private String keyword;

    public Search(){

    }

    public Search(String entryType, String keyword){
        this.entryType = entryType;
        this.keyword = keyword;
    }

    public String getEntryType() {
        return entryType;
    }

    public void setEntryType(String entryType) {
        this.entryType = entryType;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getKeyword() {
        return keyword;
    }
}
