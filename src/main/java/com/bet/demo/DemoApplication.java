package com.bet.demo;

import com.bet.demo.data.Entry;
import com.bet.demo.data.User;
import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.*;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
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
        ApiFuture<DocumentSnapshot> userFuture = docRef.get();

        User user = null;
        DocumentSnapshot userDocument = userFuture.get();
        if (userDocument.exists()) {
            user = userDocument.toObject(User.class);
            System.out.println(user.toString());
            if (user.getPassword().equals("password")){
                System.out.println("correct password");
            }
        } else {
            System.out.println("No account associated with the username johndoe");
        }

        List<Entry> list = new ArrayList<>();
        ApiFuture<QuerySnapshot> entryFuture = db.collection("entry").whereEqualTo("user","johndoe").get();
        List<QueryDocumentSnapshot> documents = entryFuture.get().getDocuments();
        System.out.println(documents.size());
        for (QueryDocumentSnapshot document : documents) {
            Entry entry = document.toObject(Entry.class);
            user.addAnEntry(entry);
        }

        list = user.getEntry();

        List<Entry> categoryList = new ArrayList<>();

        String searchType = "category";
        String keyword = "savings";
        for (Entry entry : list) {
            switch (searchType){
                case "category":
                    if (entry.getCategory().contains(keyword)){
                        categoryList.add(entry);
                    }
            }
        }
        System.out.println(categoryList.toString());
*/
    }
}
