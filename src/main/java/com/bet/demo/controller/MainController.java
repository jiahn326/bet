package com.bet.demo.controller;

import com.bet.demo.data.*;
import com.bet.demo.data.Number;
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
import org.apache.commons.math3.util.Precision;
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
    List<Entry> entryList = null;
    Entry currentEntry_Update = new Entry();
    int maxID = 0;

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


//    @RequestMapping("/content")
//    public String content(HttpServletRequest request, HttpServletResponse response){
//        if (this.user.superSmile()){
//            request.setAttribute("emoji", "supersmile");
//        } else if (this.user.smile()){
//            request.setAttribute("emoji", "smile");
//        } else if (this.user.sad()){
//            request.setAttribute("emoji", "sad");
//        } else if (this.user.angry()){
//            request.setAttribute("emoji", "angry");
//        } else{
//            request.setAttribute("emoji", "smile");
//        }
//        System.out.println("<<<< Check!");
//
//        return "content";
//    }


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

            String userName = this.user.getFirstname() + this.user.getLastname();
            System.out.println(">>>>>>>>>>> username: " + userName);
            request.setAttribute("userName", userName);


            mainService.setEmoji(request, response);
            System.out.println("<<<< Check!");

            //this.entryList = user.getEntry();
            //System.out.println(this.user.toString());
            //System.out.println(this.user.getEntry().toString());
//            System.out.println("current month expense" + user.getCurMonthExpense("10", "2021"));
//            System.out.println("current month income" + user.getCurMonthIncome("11", "2021"));
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

    @RequestMapping("/signUpButton")
    public String signUpButton(){
        return "loginView/signUp";
    }

    // logout page --> return to login page
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();

        this.user = null;
        this.entryList = null;
        this.currentEntry_Update = null;
        this.mainService.setUserToNull();

        if(session != null) {
            session.invalidate();
        }

        return "loginView/login";
    }

    /* page info */
    @RequestMapping("/user/info")
    public String userPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ExecutionException, InterruptedException{

        return "loginView/accountSetting";
    }

    @RequestMapping("/history/info")
    public String history(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExecutionException, InterruptedException {
        System.out.println("supersuper");
        HttpSession session = request.getSession();

        mainService.setEmoji(request, response);

        this.entryList = null; //reset
        mainService.reloadEntries(user, db); // refresh

        if (db == null){
            initializeFirebase();
        }

        if (this.entryList == null){
            mainService.reloadEntries(user,db);
        }

        System.out.println(user.getEntry());

        if (user != null && !user.isEntryEmpty() && this.entryList == null){
            this.entryList = user.getEntry();
        }

        this.maxID = user.getMaxID();

        request.setAttribute("entryList", this.entryList);
        request.setAttribute("currentBalance", Precision.round(this.user.getCurrentBalance(),2));
        request.setAttribute("monthlyExpense", Precision.round(user.getCurMonthExpense("11", "2021"),2));
        request.setAttribute("monthlyIncome", Precision.round(user.getCurMonthIncome("11", "2021"),2));

        System.out.println(this.entryList.toString());

        if(session != null) {
            session.invalidate();
        }

        return "historyView/history";
    }

    @RequestMapping("/searchHistory")
    public String search(HttpServletRequest request, HttpServletResponse response){
        String entryType = request.getParameter("entryType");
        String keyword = request.getParameter("keyword");

        System.out.println(request.toString());

        System.out.println(entryType + " " + keyword);

        this.entryList = mainService.searchHistory("category", "savings");

        request.setAttribute("entryList", this.entryList);
        System.out.println(this.entryList.toString());

        return "redirect:/history/info";
    }

    @RequestMapping("/refresh")
    public String refresh(HttpServletRequest request, HttpServletResponse response) throws ExecutionException, InterruptedException {

        mainService.reloadEntries(user,db);
        this.user = mainService.getUser();
        this.entryList = this.user.getEntry();

        request.setAttribute("entryList", this.entryList);
        System.out.println(this.entryList.toString());

        return "redirect:/history/info";

    }

    @RequestMapping("/history/search")
    @ResponseBody
    public String searchHistory(@RequestBody Search search) throws ServletException, IOException {

        System.out.println("button clicked");

        String entryType = search.getEntryType();
        String keyword = search.getKeyword();

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

            DocumentReference docRef = db.collection("entry").document(user.getUsername()+(this.maxID+1)); //***need to find a unique string to replace childpath***
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

            data.put("number", this.maxID+1);

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

            DocumentReference docRef = db.collection("entry").document(this.user.getUsername()+number);

            ApiFuture<WriteResult> future = docRef.update("dateTime", dateTime);

            future = docRef.update("amount", amount);

            future = docRef.update("category", category);

            future = docRef.update("description", description);

            future = docRef.update("transaction", transaction);

            future = docRef.update("user", username);

            WriteResult result = future.get();
            System.out.println("Write result: " + result);

//            user.addAnEntry(entryVO);
//            mainService.loadEntriesToUser(user.getUsername(), db);

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

        return "redirect:/history/info";
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
    public String budget(HttpServletRequest request, HttpServletResponse response) throws ExecutionException, InterruptedException {

        mainService.setEmoji(request, response);

        this.entryList = null; //reset
        mainService.reloadEntries(user, db); // refresh
        this.user.setBudget(null);
        mainService.reloadBudget(user, db);

        System.out.println("reloaded");
        System.out.println(this.user.getBudget());

        double totalWants = Precision.round(this.user.getTotalWants(), 2);
        double totalNeeds = Precision.round(this.user.getTotalNeeds(),2);
        double totalSavings = Precision.round(this.user.getTotalSavings(), 2);
        double totalExpense = Precision.round(this.user.getTotalExpense(), 2);

        int budgetWants = this.user.getBudget().getWants();
        int budgetNeeds = this.user.getBudget().getNeeds();
        int budgetSavings = this.user.getBudget().getSavings();

        request.setAttribute("totalWants", totalWants);
        request.setAttribute("totalNeeds", totalNeeds);
        request.setAttribute("totalSavings", totalSavings);

        request.setAttribute("budgetWants", budgetWants);
        request.setAttribute("budgetNeeds", budgetNeeds);
        request.setAttribute("budgetSavings", budgetSavings);

        request.setAttribute("plannedWants", Precision.round(totalExpense * (budgetWants*1.0/100), 2));
        request.setAttribute("plannedNeeds", Precision.round(totalExpense * (budgetNeeds*1.0/100), 2));
        request.setAttribute("plannedSavings", Precision.round(totalExpense * (budgetSavings*1.0/100),2));

        return "budgetView/budget";
    }

    @RequestMapping("/budget/update")
    @ResponseBody
    public String updateBudget(@RequestBody Budget budget) throws IOException, ExecutionException, InterruptedException {
        try{
            int newNeeds = budget.getNeeds();
            int newWants = budget.getWants();
            int newSavings = budget.getSavings();

            System.out.println("input budget" + budget);

            if (db == null){
                this.initializeFirebase();
            }

            DocumentReference docRef = db.collection("budget").document(this.user.getUsername());
            ApiFuture<WriteResult> future;
            future = docRef.update("needs", newNeeds);
            future = docRef.update("wants", newWants);
            future = docRef.update("savings", newSavings);

            WriteResult result = future.get();

            System.out.println("Write result: " + result);

            System.out.println("new budget" + this.user.getBudget());
        } catch (Exception e){
            System.err.println(e);
        }

        return "redirect:/budget/info";
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
