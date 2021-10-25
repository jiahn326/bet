package com.bet.demo.controller;

import com.bet.demo.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @Autowired
    private MainService mainService;

    @RequestMapping("/")
    public String open(){
        return "redirect:/login";
    }

//    @RequestMapping("/openTms")
//    public String openTms(HttpServletRequest request){
//        HttpSession session = request.getSession(false);
//        if(session != null){
//            SessionVO sesionVO = (SessionVO) session.getAttribute("SessionVO");
//            if(sesionVO == null ){
//                return "loginView/login";
//            }else{
//                return "content";
//            }
//        }else{
//            return "loginView/login";
//        }
//    }
//
    @RequestMapping("/login")
    public ModelAndView loginCheck(HttpServletRequest request, UserVO vo){
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("loginView/login");
        if(session != null){
            SessionVO sessionVO = (SessionVO) session.getAttribute("SessionVO");
            if(sessionVO == null) {
                mv.addObject("userId", vo.getUserId());
                return mv;
            }else {
                mv.setViewName("content");
                return mv;
            }
        }else{
            mv.addObject("userId",vo.getUserId());
            return mv;
        }
    }
}
