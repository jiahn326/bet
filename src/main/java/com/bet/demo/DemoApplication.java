package com.bet.demo;

import com.bet.demo.data.User;
import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.*;
import java.util.Objects;
import java.util.concurrent.ExecutionException;

@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) throws IOException, ExecutionException, InterruptedException {
        SpringApplication.run(DemoApplication.class, args);

        /*InputStream serviceAccount = new FileInputStream("src/main/resources/serviceAccountKey.json");
        GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(credentials)
                .build();
        FirebaseApp.initializeApp(options);

        Firestore db = FirestoreClient.getFirestore();

        DocumentReference docRef = db.collection("users").document("johndoe");
        // asynchronously retrieve the document
        ApiFuture<DocumentSnapshot> future = docRef.get();
        // ...
        // future.get() blocks on response

        User user = null;
        DocumentSnapshot document = future.get();
        if (document.exists()) {
            System.out.println("account doesn't exist");
        } else {
            user = document.toObject(User.class);
            if (user.getPassword().equals("password")){
                System.out.println("correct password");
            }
        }*/

    }
}
