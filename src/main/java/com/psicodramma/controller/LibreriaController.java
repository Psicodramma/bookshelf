package com.psicodramma.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Objects;

import com.psicodramma.App;
import com.psicodramma.UIControl.EditionPane;
import com.psicodramma.UIControl.LikeCommentButton;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Opera;
import com.psicodramma.model.Utente;
import com.psicodramma.service.BookService;
import com.psicodramma.service.LibraryService;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.image.ImageView;
import javafx.scene.layout.VBox;

public class LibreriaController {
    @FXML private ImageView indietroButton;
    @FXML private Label labelUtente;
    @FXML private Label labelLettura;
    @FXML private Label labelDaLeggere;
    @FXML private Label labelLetti;
    @FXML private Label labelAccantonati;
    @FXML private VBox raccolte;
    @FXML private Button followButton;
    @FXML private ListView<Edizione> raccoltaLetti;
    @FXML private ListView<Edizione> raccoltaInLettura;
    @FXML private ListView<Edizione> raccoltaDaLeggere;
    @FXML private ListView<Edizione> raccoltaAccantonati;
    
    private ObservableList<Edizione> listaLetti = FXCollections.observableArrayList();
    private ObservableList<Edizione> listaInLettura = FXCollections.observableArrayList();
    private ObservableList<Edizione> listaDaLeggere = FXCollections.observableArrayList();
    private ObservableList<Edizione> listaAccantonati = FXCollections.observableArrayList();

    private LibraryService libraryService;
    private Utente utente;

    public LibreriaController() {
        libraryService = new LibraryService();
    }

    public LibreriaController(Utente utente){
        this.utente = utente;
        libraryService = new LibraryService();
        
        listaLetti.setAll();
        listaInLettura.setAll();
        listaDaLeggere.setAll();
        listaAccantonati.setAll();
    }
    
    @FXML
    private void initialize() { 
        if(!Objects.isNull(utente)){
            raccoltaLetti.setItems(listaLetti);
            raccoltaLetti.setCellFactory((param) -> new EditionPane());

            raccoltaInLettura.setItems(listaInLettura);
            raccoltaInLettura.setCellFactory((param) -> new EditionPane());

            raccoltaDaLeggere.setItems(listaDaLeggere);
            raccoltaDaLeggere.setCellFactory((param) -> new EditionPane());

            raccoltaAccantonati.setItems(listaAccantonati);
            raccoltaAccantonati.setCellFactory((param) -> new EditionPane());

            if(utente.equals(App.getData())){
                followButton.setVisible(false);
            }
        }
    }

    @FXML
    private void indietro(){
        try {
            App.setRoot("timeline");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void segui(){
        try {
            App.setRoot("timeline");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
