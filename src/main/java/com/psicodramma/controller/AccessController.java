package com.psicodramma.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

import jakarta.persistence.*;

import com.psicodramma.App;
import com.psicodramma.model.Utente;

public class AccessController {
    @FXML protected TextField usernameTextbox;
    @FXML protected TextField passwordTextbox;
    @FXML protected TextField nationalityTextbox;
    //@FXML private Label toastLabel;
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");  

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
        String username = usernameTextbox.getText();
        if(username.equals("")) 
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Inserire username");
        String password = passwordTextbox.getText();
        EntityManager em=emf.createEntityManager(); 
        em.getTransaction().begin(); 
        long num = (long) em.createNativeQuery("select count(*) from utente where username = ?1 and password = ?2")
        .setParameter(1, username)
        .setParameter(2, password)
        .getSingleResult();
        if(num>0){
            ToastController.showToast(ToastController.TOAST_SUCCESS, usernameTextbox, "Accesso effettuato");
        }else{
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Accesso Negato");
        }
    }

    @FXML
    private void register() throws IOException {
        //controllo dei dati
        Utente u = new Utente(usernameTextbox.getText(), nationalityTextbox.getText(), passwordTextbox.getText());

        EntityManager em=emf.createEntityManager(); 

        try{
            em.getTransaction().begin(); 
            em.persist(u);
            em.getTransaction().commit();
            ToastController.showToast(ToastController.TOAST_SUCCESS, usernameTextbox, "L'utente è stato inserito");

        }catch(PersistenceException e){
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "L'utente già inserito");
        }
        
        em.close(); 
        //emf.close();  
        //App.setRoot("timeline");
    }

    @FXML
    private void recuperaPassword() throws IOException{
        String username = usernameTextbox.getText();
        if(username.equals("")) ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Inserire username");
        EntityManager em=emf.createEntityManager(); 
        em.getTransaction().begin();
        try{
        String pwd = (String) em.createNativeQuery("select password from utente where username = ?1")
            .setParameter(1, username)
            .getSingleResult();
        passwordTextbox.setText(pwd);
        } catch(NoResultException e){
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Username non trovato");
        }
        
    }
}
