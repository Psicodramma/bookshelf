package com.psicodramma.controller;

import java.io.IOException;

import com.psicodramma.App;
import com.psicodramma.UIControl.ToastController;
import com.psicodramma.service.AccessService;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class AccessController {
    @FXML protected TextField usernameTextbox;
    @FXML protected TextField passwordTextbox;
    @FXML protected TextField nationalityTextbox;
    
    private AccessService accessService;

    public AccessController(){
        accessService = new AccessService();
    }

    @FXML
    protected void initialize(){
    }

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
        String username = usernameTextbox.getText().trim();
        if(username.equals("")) {
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Inserire username");
        } else {
            String password = passwordTextbox.getText().trim();
            
            boolean canLogin = accessService.login(username, password);

            if(canLogin){
                ToastController.showToast(ToastController.TOAST_SUCCESS, usernameTextbox, "Accesso effettuato");
                App.setData(accessService.getUser(username));
                Stage s = (Stage) usernameTextbox.getScene().getWindow();
                App.setRoot("timeline");
                s.setMaximized(true);
                s.setResizable(true);
            }else{
                ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Accesso Negato");
            }
        }
    }

    @FXML
    private void register() throws IOException {
        //controllo dei dati
        if(usernameTextbox.getText().trim().isEmpty() || nationalityTextbox.getText().trim().isEmpty() || passwordTextbox.getText().trim().isEmpty()){
            ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "Campi Obbligatori");
        }else{
            boolean success = accessService.register(usernameTextbox.getText().trim(), passwordTextbox.getText().trim(), nationalityTextbox.getText().trim());
            if(success){
                ToastController.showToast(ToastController.TOAST_SUCCESS, usernameTextbox, "Registrazione Avvenuta con successo");
                switchToLogin();
            } else {
                ToastController.showToast(ToastController.TOAST_ERROR, usernameTextbox, "L'utente è già registrato");
            }
        }

    }

    @FXML
    private void recuperaPassword() throws IOException{
        String username = usernameTextbox.getText().trim();
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