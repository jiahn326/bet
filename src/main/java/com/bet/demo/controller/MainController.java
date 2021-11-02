package com.bet.demo.controller;

import com.bet.demo.data.User;
import com.bet.demo.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {
    @Autowired
    private MainService mainService;

    @RequestMapping("/")
    public String open(){
        return "redirect:/openBet";
    }

    // main page(home page)
    @RequestMapping("/openBet")
    public String openBet(){
        return "loginView/signUp";
    }

    // login page
    @RequestMapping("/login")
    public ModelAndView test() throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("loginView/login");
        mv.addObject("userName", "Jihyun");
        return mv;
    }

//    // sign up page
//    @RequestMapping(value = "/signUp")
//    public String logout(HttpServletRequest request, HttpServletResponse response){
//        HttpSession session = request.getSession();
//
//        if(session != null) {
//            session.invalidate();
//        }
//
//        return "loginView/login";
//    }
//
//    // logout page --> return to login page
//    @RequestMapping(value = "/logout")
//    public String logout(HttpServletRequest request, HttpServletResponse response){
//        HttpSession session = request.getSession();
//
//        if(session != null) {
//            session.invalidate();
//        }
//
//        return "loginView/login";
//    }
}
