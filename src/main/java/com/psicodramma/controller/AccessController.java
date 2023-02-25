package com.psicodramma.controller;

import java.io.IOException;
import java.util.Objects;

import com.psicodramma.App;
import com.psicodramma.UIControl.ToastController;
import com.psicodramma.service.AccessService;
import com.psicodramma.service.LibraryService;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class AccessController {
    @FXML protected TextField usernameTextbox;
    @FXML protected TextField passwordTextbox;
    @FXML protected TextField nationalityTextbox;
    
    private Object sharedData;
    private AccessService accessService;
    private LibraryService libraryService;

    public AccessController(){
        accessService = new AccessService();
        libraryService = new LibraryService();
    }

    @FXML
    protected void initialize(){
        sharedData = App.getData();
        if(!Objects.isNull(sharedData)) System.out.println("Stringa passata: " + Objects.toString(sharedData));
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
        if(username.equals("")) {
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Inserire username");
        } else {
            String password = passwordTextbox.getText();
            
            boolean canLogin = accessService.login(username, password);

            if(canLogin){
                ToastController.showToast(ToastController.TOAST_SUCCESS, usernameTextbox, "Accesso effettuato");
                App.setData(accessService.getUser(username));
                App.setRoot("timeline");
            }else{
                ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Accesso Negato");
            }
        }
    }

    @FXML
    private void register() throws IOException {
        //controllo dei dati
        if(usernameTextbox.getText().equals("") || nationalityTextbox.getText().equals("") || passwordTextbox.getText().equals("")){
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Campi Obbligatori");
        }else{
            boolean success = accessService.register(usernameTextbox.getText(), passwordTextbox.getText(), nationalityTextbox.getText());
            if(success){
                // ToastController.showToast(ToastController.TOAST_SUCCESS, usernameTextbox, "L'utente è stato inserito");
                login();
            } else {
                ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "L'utente è già registrato");
            }
        }

    }

    @FXML
    private void recuperaPassword() throws IOException{
        String username = usernameTextbox.getText();
        if(username.equals("")){
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Inserire username");
        } else {
            String pwd = accessService.restorePassword(username);
            
            if(!pwd.equals("")){
                passwordTextbox.setText(pwd);
            } else {
                ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Username non trovato");
            }
        
        }
    }
    
}