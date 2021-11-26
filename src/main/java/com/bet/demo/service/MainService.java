package com.bet.demo.service;

import com.bet.demo.data.Entry;
import com.bet.demo.data.User;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@Service
public class MainService {

    private User user = new User();

    @RequestMapping(value = "/signUp")
    public void signUp(HttpServletRequest request, HttpServletResponse response, HttpSession session, Firestore db) throws ExecutionException, InterruptedException {
        // HTML 폼에서 username으로 전달된 값을 가지고 옴
        String username = request.getParameter("username");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        DocumentReference docRef = db.collection("users").document("test1"); //***need to find a unique string to replace childpath***
        // Add document data  with id "alovelace" using a hashmap
        Map<String, Object> data = new HashMap<>();

        // username이 null 이 아닌 경우 세션에 값을 저장
        if(username != null) {
            data.put("username", username);
        }

        // firstname이 null 이 아닌 경우 세션에 값을 저장
        if(firstname != null) {
            data.put("firstname", firstname);
        }

        // lastname이 null 이 아닌 경우 세션에 값을 저장
        if(lastname != null) {
            data.put("lastname", lastname);
        }

        // password이 null 이 아닌 경우 세션에 값을 저장
        if(password != null) {
            data.put("password", password);
        }

        // email이 null 이 아닌 경우 세션에 값을 저장
        if(email != null) {
            data.put("email", email);
        }

        //asynchronously write data
        ApiFuture<WriteResult> result = docRef.set(data);
        // ...
        // result.get() blocks on response
        System.out.println("Update time : " + result.get().getUpdateTime());

    }

    @RequestMapping(value = "/login")
    public boolean login(HttpServletRequest request, HttpServletResponse response, HttpSession session, Firestore db) throws ExecutionException, InterruptedException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DocumentReference docRef = db.collection("users").document(username);
        // asynchronously retrieve the document
        ApiFuture<DocumentSnapshot> future = docRef.get();
        // ...
        // future.get() blocks on response

        DocumentSnapshot document = future.get();
        if (document.exists()) {
            this.user = document.toObject(User.class);
            if (this.user.getPassword().equals(password)) {
                this.loadEntriesToUser(username, db);
                return true;
            } else
                return false;
        } else {
            return false;
        }
    }

    public List searchHistory(HttpServletRequest request, HttpServletResponse response){
        String searchType = request.getParameter("searchType");
        String keyword = request.getParameter("keyword");

        List<Entry> entryList = user.getEntry();
        List<Entry> searchList = new ArrayList<>();

        if (searchType == null || keyword == null){
            return entryList;
        }

        for (Entry entry : entryList) {
            switch (searchType){
                case "category":
                    if (entry.getCategory().contains(keyword))
                        searchList.add(entry);
                    break;
                case "description":
                    if (entry.getDescription().contains(keyword))
                        searchList.add(entry);
                    break;
                case "transaction":
                    if (entry.getTransaction().contains(keyword))
                        searchList.add(entry);
                    break;
                case "all":
                    return entryList;
                default:
                    break;
            }
        }

        return searchList;
    }

    public User getUser(){
        return this.user;
    }

    private void loadEntriesToUser(String username, Firestore db) throws ExecutionException, InterruptedException {
        List<Entry> list = new ArrayList<>();
        ApiFuture<QuerySnapshot> entryFuture = db.collection("entry").whereEqualTo("user",username).get();
        List<QueryDocumentSnapshot> documents = entryFuture.get().getDocuments();
        System.out.println(documents.size());
        for (QueryDocumentSnapshot document : documents) {
            Entry entry = document.toObject(Entry.class);
            user.addAnEntry(entry);
            System.out.println(entry.toString());
            list.add(entry);
        }
    }
}