package com.bet.demo.controller;

import com.bet.demo.data.Entry;
import com.bet.demo.data.User;
import com.bet.demo.service.MainService;
import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@Controller
public class MainController {

    Firestore db = null;
    User user = null;
    List<Entry> entryList = new ArrayList<>();

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
            //System.out.println(this.user.toString());
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
    public String history(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExecutionException, InterruptedException {
        //System.out.println("supersuper");
        HttpSession session = request.getSession();

        this.entryList = null; //reset

        mainService.reloadEntries(user, db); // refresh

        if (db == null){
            initializeFirebase();
        }


        if (user != null && !user.isEntryEmpty()){

            this.entryList = user.getEntry();
            //System.out.println(entryList.get(1).toString());
            //System.out.println("supersuper");
            request.setAttribute("entryList", entryList);
        }
        //System.out.println("supersuper");

        /*List<Entry> searchList = new ArrayList<>();
        if (!mainService.search(request, response).isEmpty()){
            searchList = mainService.search(request,response);
            request.setAttribute("entryList", searchList);
        }*/

        if(session != null) {
            session.invalidate();
        }

        return "historyView/history";
    }

//    @RequestMapping(value = "create")
    @RequestMapping("/history/add")
    @ResponseBody
    public String create(@RequestBody Entry entryVO) throws ExecutionException, InterruptedException {
        try {

            if (db == null){
                initializeFirebase();
            }


            double amount = entryVO.getAmount();
            String category = entryVO.getCategory();
            String dateTime = entryVO.getDateTime();
            String description = entryVO.getDescription();
            String transaction = entryVO.getTransaction();
            String username = user.getUsername();

            DocumentReference docRef = db.collection("entry").document(dateTime); //***need to find a unique string to replace childpath***
            // Add document data  with id "alovelace" using a hashmap
            Map<String, Object> data = new HashMap<>();

            // amount이 null 이 아닌 경우 세션에 값을 저장
            data.put("amount", amount);

            // category이 null 이 아닌 경우 세션에 값을 저장
            if(category != null) {
                data.put("category", category);
            }

            // dateTime이 null 이 아닌 경우 세션에 값을 저장
            if(dateTime != null) {
                data.put("dateTime", dateTime);
            }

            // description이 null 이 아닌 경우 세션에 값을 저장
            if(description != null) {
                data.put("description", description);
            }

            // transaction이 null 이 아닌 경우 세션에 값을 저장
            if(transaction != null) {
                data.put("transaction", transaction);
            }

            // username이 null 이 아닌 경우 세션에 값을 저장
            if(username != null) {
                data.put("user", username);
            }

            //asynchronously write data
            ApiFuture<WriteResult> result = docRef.set(data);
            // ...
            // result.get() blocks on response
            System.out.println("Update time : " + result.get().getUpdateTime());

            //user.addAnEntry(entryVO);
            //mainService.loadEntriesToUser(user.getUsername(), db);

        } catch(Exception e) {
            System.out.println("error occurred");
        }

        return "redirect:/history/info";
    }

    @RequestMapping("/history/searchType")
    @ResponseBody
    public String searchType(){
        return "hi";
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

    private void initializeFirebase() throws IOException {
        InputStream serviceAccount = new FileInputStream("src/main/resources/serviceAccountKey.json");
        GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(credentials)
                .build();
        FirebaseApp.initializeApp(options);
        this.db = FirestoreClient.getFirestore();
    }

}
