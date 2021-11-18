package com.bet.demo.controller;

import com.bet.demo.data.User;
import com.bet.demo.service.MainService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ExecutionException;

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
        return "content";
//        return "redirect:/login";
    }


    @RequestMapping("/login")
    public ModelAndView test() throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("loginView/login");
        mv.addObject("userName", "Jihyun");
        return mv;
    }
    
    // login page
    /*@RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response) throws ExecutionException, InterruptedException, IOException {
        HttpSession session = request.getSession();

        //***I MOVED THE FIREBASE INIT HERE - NEED TO FIND A WAY TO MAKE IT GLOBAL BUT STILL WORK***
        InputStream serviceAccount = new FileInputStream("src/main/resources/serviceAccountKey.json");
        GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(credentials)
                .build();
        FirebaseApp.initializeApp(options);
        Firestore db = FirestoreClient.getFirestore();
        //***END***

        mainService.login(request, response, session, db);

        if(session != null) {
            session.invalidate();
        }

        return "login";
    }*/



    //sign up page
    @RequestMapping(value = "/signUp")
    public String signUp(HttpServletRequest request, HttpServletResponse response) throws ExecutionException, InterruptedException, IOException {
        HttpSession session = request.getSession();

        //***I MOVED THE FIREBASE INIT HERE - NEED TO FIND A WAY TO MAKE IT GLOBAL BUT STILL WORK***
        InputStream serviceAccount = new FileInputStream("src/main/resources/serviceAccountKey.json");
        GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(credentials)
                .build();
        FirebaseApp.initializeApp(options);
        Firestore db = FirestoreClient.getFirestore();
        //***END***

        mainService.signUp(request, response, session, db);

        if(session != null) {
            session.invalidate();
        }

        return "loginView/login";
    }


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
