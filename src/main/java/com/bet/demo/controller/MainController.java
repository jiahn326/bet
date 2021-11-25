package com.bet.demo.controller;

import com.bet.demo.data.Entry;
import com.bet.demo.data.User;
import com.bet.demo.service.MainService;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

@Controller
public class MainController {

    Firestore db = null;
    User user = null;

    @Autowired
    private MainService mainService;

    @RequestMapping("/")
    public String open(){
        return "redirect:/openBet";
    }

    // main page(home page)
    @RequestMapping("/openBet")
    public String openBet(){
        /*return "content";*/
        return "loginView/login";
    }


/*    @RequestMapping("/login")
    public ModelAndView test() throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("loginView/login");
        mv.addObject("userName", "Jihyun");
        return mv;
    }*/
    
    // login page
    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response) throws ExecutionException, InterruptedException, IOException {
        HttpSession session = request.getSession();


        if (db == null){
            initializeFirebase();
        }

        String page = "";
        if (mainService.login(request, response, session, db)){
            this.user = mainService.getUser();
            System.out.println(this.user.toString());
            //System.out.println(this.user.getEntry().toString());
            page = "content";
        } else{
            page = "loginView/login";
        }

        if(session != null) {
            session.invalidate();
        }

        return page;
    }

    private void initializeFirebase() throws IOException {
        InputStream serviceAccount = new FileInputStream("src/main/resources/serviceAccountKey.json");
        GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(credentials)
                .build();
        FirebaseApp.initializeApp(options);
        this.db = FirestoreClient.getFirestore();
    }

    //sign up page
    @RequestMapping(value = "/signUp")
    public String signUp(HttpServletRequest request, HttpServletResponse response) throws ExecutionException, InterruptedException, IOException {
        HttpSession session = request.getSession();

        if (db == null){
            initializeFirebase();
        }

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




    /* page info */

    @RequestMapping("/history/info")
    public String history(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("supersuper");
        HttpSession session = request.getSession();

        if (db == null){
            initializeFirebase();
        }

        List<Entry> entryList = new ArrayList<>();
        if (user != null && !user.isEntryEmpty()){
            entryList = user.getEntry();
            System.out.println(entryList.get(1).toString());
            System.out.println("supersuper");
            request.setAttribute("entryList", entryList);
        }
        System.out.println("supersuper");

        if(session != null) {
            session.invalidate();
        }

        return "historyView/history";
    }

    @RequestMapping("/chart/info")
    public String chart(){
        return "chartView/chart";
    }

    @RequestMapping("/calendar/info")
    public String calendar(){
        return "calendarView/calendar";
    }

    @RequestMapping("/budget/info")
    public String budget(){
        return "budgetView/budget";
    }


}
