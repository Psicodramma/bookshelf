package com.psicodramma.controller;

import java.io.IOException;
import java.util.Objects;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;

import jakarta.persistence.*;

import com.psicodramma.App;
import com.psicodramma.model.Utente;
import com.psicodramma.UIControls.ToastController;

public class AccessController {
    @FXML protected TextField usernameTextbox;
    @FXML protected TextField passwordTextbox;
    @FXML protected TextField nationalityTextbox;

    
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");  
    private Object sharedData;

    @FXML
    protected void initialize(){
        sharedData = App.getData();
        if(!Objects.isNull(sharedData)) System.out.println("Stringa passata: "+Objects.toString(sharedData));
    }

    @FXML
    private void switchToRegister() throws IOException {
        String provaUserData = usernameTextbox.getText();
        App.setData(provaUserData);
        App.setRoot("register");
    }

    @FXML
    private void switchToLogin() throws IOException {
        String provaUserData = usernameTextbox.getText();
        App.setData(provaUserData);
        App.setRoot("login");
    }

    @FXML
    private void login() throws IOException {
        //controllo dei dati
        String username = usernameTextbox.getText();
        if(username.equals("")) 
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Inserire username");
        else{
        String password = passwordTextbox.getText();
        EntityManager em=emf.createEntityManager(); 
        em.getTransaction().begin(); 
        long num = (long) em.createNativeQuery("select count(*) from utente where username = ?1 and password = ?2")
        .setParameter(1, username)
        .setParameter(2, password)
        .getSingleResult();
        if(num>0){
            ToastController.showToast(ToastController.TOAST_SUCCESS, usernameTextbox, "Accesso effettuato");
            App.setRoot("timeline");
        }else{
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Accesso Negato");
        }
    }

    }

    @FXML
    private void register() throws IOException {
        //controllo dei dati
        if(usernameTextbox.getText().equals("")){
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Inserire username");
        }else{
        Utente u = new Utente(usernameTextbox.getText(), nationalityTextbox.getText(), passwordTextbox.getText());

        EntityManager em=emf.createEntityManager(); 

        try{
            em.getTransaction().begin(); 
            em.persist(u);
            em.getTransaction().commit();
            ToastController.showToast(ToastController.TOAST_SUCCESS, usernameTextbox, "L'utente è stato inserito");

        }catch(PersistenceException e){
                ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "L'utente è già registrato");
        }
        
        em.close(); 
        //emf.close();  
        //App.setRoot("timeline");
        }
    }

    @FXML
    private void recuperaPassword() throws IOException{
        String username = usernameTextbox.getText();
        if(username.equals("")) ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Inserire username");
        else{
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
}
