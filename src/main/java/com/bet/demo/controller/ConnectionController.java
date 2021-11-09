package com.bet.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConnectionController {
    @RequestMapping("/history/info")
    public String connectionMailInfoView(){
        return "historyView/history";
    }

}
