package com.bet.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConnectionController {
    @RequestMapping("/history/info")
    public String connectionHistoryInfoView(){
        return "historyView/history";
    }

    @RequestMapping("/chart/info")
    public String connectionChartInfoView(){
        return "chartView/chart";
    }

    @RequestMapping("/calendar/info")
    public String connectionCalendarInfoView(){
        return "calendarView/calendar";
    }

    @RequestMapping("/budget/info")
    public String connectionBudgetInfoView(){
        return "budgetView/budget";
    }

}
