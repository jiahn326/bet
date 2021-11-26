package com.bet.demo.data;

import java.util.Comparator;

public class DateSorter implements Comparator<Entry> {

    @Override
    public int compare(Entry e1, Entry e2){
        return e2.getDateTime().compareTo(e1.getDateTime());
    }
}
