package com.bet.demo.service;

import com.bet.demo.data.User;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@Service
public class MainService {

    User user = null;


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
            if (user.getPassword().equals(password)) {
                return true;
            } else
                return false;
        } else {
            return false;
        }
    }

    public List getEntryList(){
        if (user != null && user.getEntry() != null){
            return user.getEntry();
        }

        return null;
    }
}