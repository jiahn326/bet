package com.bet.demo.controller;

import com.bet.demo.data.Entry;
import com.bet.demo.data.Number;
import com.bet.demo.data.Search;
import com.bet.demo.data.User;
import com.bet.demo.service.MainService;
import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
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
    Entry currentEntry_Update = new Entry();
    HttpServletRequest request;
    HttpServletResponse response;
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
        this.request = request;
        this.response = response;

        if (db == null){
            initializeFirebase();
        }

        String page = "";
        if (mainService.login(request, response, session, db)){
            this.user = mainService.getUser();
            //this.entryList = user.getEntry();
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
        this.request = request;
        this.response = response;

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
        this.request = request;
        this.response = response;

        System.out.println(request.toString());
        this.entryList = null; //reset

        mainService.reloadEntries(user, db); // refresh

        if (db == null){
            initializeFirebase();
        }


        if (user != null && !user.isEntryEmpty()){
            this.entryList = user.getEntry();
        }

        System.out.println(this.entryList.toString());

        request.setAttribute("entryList", this.entryList);

        if(session != null) {
            session.invalidate();
        }

        return "historyView/history";
    }

//    @RequestMapping("/searchHistory")
//    public String search(HttpServletRequest request, HttpServletResponse response){
//        String entryType = request.getParameter("entryType");
//        String keyword = request.getParameter("keyword");
//
//        System.out.println(request.toString());
//
//        System.out.println(entryType + " " + keyword);
//
//        this.entryList = mainService.searchHistory("category", "wants");
//        System.out.println(this.entryList.toString());
//
//        return "redirect:/history/info";
//
//    }

    @RequestMapping("/history/search")
    @ResponseBody
    public String searchHistory(@RequestBody Search search) throws ServletException, IOException {

        System.out.println("button clicked");

        String entryType = search.getEntryType();
        String keyword = search.getKeyword();

        System.out.println(request.toString());

        System.out.println(entryType + " " + keyword);

        this.entryList = mainService.searchHistory(entryType, keyword);
        System.out.println(this.entryList.toString());

        return "redirect:/history/info";
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

            DocumentReference docRef = db.collection("entry").document(user.getUsername()+(user.getEntry().size()+1)); //***need to find a unique string to replace childpath***
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

            data.put("number", user.getEntry().size()+1);

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

    //    @RequestMapping(value = "create")
    @GetMapping("/history/detail")
    @ResponseBody
    public String detail(Entry entryVO) throws ExecutionException, InterruptedException {
        try {

            if (db == null){
                initializeFirebase();
            }

            int number = entryVO.getNumber();
            currentEntry_Update.setNumber(number);

            System.out.println(">>>>>>>>>>>>>>> number: " + number);
//            double amount = entryVO.getAmount();
//            String category = entryVO.getCategory();
//            String dateTime = entryVO.getDateTime();
//            String description = entryVO.getDescription();
//            String transaction = entryVO.getTransaction();
//            String username = user.getUsername();

//            DocumentReference docRef = db.collection("entry").document(user.getUsername()+(user.getEntry().size()+1)); //***need to find a unique string to replace childpath***
//            // Add document data  with id "alovelace" using a hashmap
//            Map<String, Object> data = new HashMap<>();
//
//            // amount이 null 이 아닌 경우 세션에 값을 저장
//            data.put("amount", amount);
//
//            // category이 null 이 아닌 경우 세션에 값을 저장
//            if(category != null) {
//                data.put("category", category);
//            }
//
//            // dateTime이 null 이 아닌 경우 세션에 값을 저장
//            if(dateTime != null) {
//                data.put("dateTime", dateTime);
//            }
//
//            // description이 null 이 아닌 경우 세션에 값을 저장
//            if(description != null) {
//                data.put("description", description);
//            }
//
//            // transaction이 null 이 아닌 경우 세션에 값을 저장
//            if(transaction != null) {
//                data.put("transaction", transaction);
//            }
//
//            // username이 null 이 아닌 경우 세션에 값을 저장
//            if(username != null) {
//                data.put("user", username);
//            }
//
//            data.put("number", user.getEntry().size()+1);
//
//            //asynchronously write data
//            ApiFuture<WriteResult> result = docRef.set(data);
//            // ...
//            // result.get() blocks on response
//            System.out.println("Update time : " + result.get().getUpdateTime());

            //user.addAnEntry(entryVO);
            //mainService.loadEntriesToUser(user.getUsername(), db);

        } catch(Exception e) {
            System.out.println("error occurred");
        }

        return "redirect:/history/info";
    }



    @RequestMapping("/history/update")
    @ResponseBody
    public String updateEntry(@RequestBody Entry entryVO) throws ExecutionException, InterruptedException {
        try {

            if (db == null){
                initializeFirebase();
            }

            int number = currentEntry_Update.getNumber();
            System.out.println("update number!="+number);
            double amount = entryVO.getAmount();
            String category = entryVO.getCategory();
            String dateTime = entryVO.getDateTime();
            String description = entryVO.getDescription();
            String transaction = entryVO.getTransaction();
            String username = user.getUsername();

            for (Entry entry : this.entryList){
                if (!dateTime.equals (entry.getDateTime())){

                    DocumentReference docRef = db.collection("entry").document(this.user.getUsername()+number);
                    /*Map<String, Object> data = new HashMap<>();;
                    ApiFuture<QuerySnapshot> entryFuture = db.collection("entry").whereEqualTo("number", number).get(); //***need to find a unique string to replace childpath***
                    // Add document data  with id "alovelace" using a hashmap*/

                    ApiFuture<WriteResult> future = docRef.update("dateTime", dateTime);

                    future = docRef.update("amount", amount);

                    future = docRef.update("category", category);

                    future = docRef.update("description", description);

                    future = docRef.update("transaction", transaction);

                    future = docRef.update("user", username);

                    WriteResult result = future.get();
                    System.out.println("Write result: " + result);
                }
            }

            //user.addAnEntry(entryVO);
            //mainService.loadEntriesToUser(user.getUsername(), db);

        } catch(Exception e) {
            System.out.println("error occurred");
        }

        return "redirect:/history/info";
    }

    @PostMapping("/history/delete")
    @ResponseBody
    public String delete(@RequestBody Entry entry) throws ExecutionException, InterruptedException{
        int entryID = entry.getNumber();
        System.out.println("entryID = " + entryID);
        ApiFuture<WriteResult> writeResult = db.collection("entry").document(this.user.getUsername()+entryID).delete();

        return "redirect:/content";
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

    //sets up firebase and connects to the firestore database
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
