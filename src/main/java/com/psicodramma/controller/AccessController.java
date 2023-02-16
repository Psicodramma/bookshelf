package com.psicodramma.controller;

import java.io.IOException;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;

import javax.persistence.*;

import com.psicodramma.App;
import com.psicodramma.model.Utente;

public class AccessController {
    @FXML protected TextField usernameTextbox;
    @FXML protected TextField passwordTextbox;
    @FXML protected TextField nationalityTextbox;

    @FXML
    private void switchToRegister() throws IOException {
        App.setRoot("register");
    }

    @FXML
    private void switchToLogin() throws IOException {


        App.setRoot("login");
    }

    @FXML
    private void login() throws IOException {
        //controllo dei dati

        App.setRoot("timeline");
    }

    @FXML
    private void register() throws IOException, ClassNotFoundException {
        //controllo dei dati
        Utente u = new Utente(usernameTextbox.getText(), nationalityTextbox.getText(), passwordTextbox.getText());
        EntityManagerFactory emf=Persistence.createEntityManagerFactory("default");  
        EntityManager em=emf.createEntityManager();  
        em.persist(u);
        emf.close();  
        em.close(); 
        //App.setRoot("timeline");
    }
}
