package com.psicodramma.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import com.psicodramma.App;
import com.psicodramma.UIControl.EditionPane;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Raccolta;
import com.psicodramma.model.Utente;
import com.psicodramma.service.LibraryService;

import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonBar.ButtonData;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Dialog;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.util.Pair;

public class LibreriaController {
    @FXML private ImageView indietroButton;
    @FXML private Label labelUtente;
    @FXML private VBox raccolteBox;
    @FXML private Button followButton;
    private List<ListView<Edizione>> raccolte;
    
    private List<ObservableList<Edizione>> liste;

    private LibraryService libraryService;
    private Utente utente;

    public LibreriaController() {
        libraryService = new LibraryService();
    }

    public LibreriaController(Utente utente){
        this.utente = utente;
        libraryService = new LibraryService();
    }
    
    @FXML
    private void initialize() { 
        if(!Objects.isNull(utente)){
            raccolte = new ArrayList<ListView<Edizione>>(utente.getLibreria().getRaccoltePersonali().size());
            liste = new ArrayList<ObservableList<Edizione>>(utente.getLibreria().getRaccoltePersonali().size());
            for (Raccolta r : utente.getLibreria().getRaccoltePersonali()) {
                // inizializzo le observableList
                ObservableList<Edizione> oal = FXCollections.observableArrayList();
                oal.setAll(r.getEdizioni());
                liste.add(oal);

                //inizializzo l'interfaccia per ogni raccolta
                AnchorPane ap = new AnchorPane();
                VBox.setVgrow(ap, Priority.ALWAYS);
                Label labelNome = new Label(r.getNome());
                AnchorPane.setTopAnchor(labelNome, (double) 5);
                AnchorPane.setLeftAnchor(labelNome, (double) 5);
                Label labelDesc = new Label(r.getDescrizione());
                labelDesc.setLayoutX(850);
                AnchorPane.setTopAnchor(labelDesc, (double) 5);
                AnchorPane.setRightAnchor(labelDesc, (double) 5);
                ListView<Edizione> lv = new ListView<>();
                AnchorPane.setTopAnchor(lv, (double) 25);
                AnchorPane.setLeftAnchor(lv, (double) 0);
                AnchorPane.setRightAnchor(lv, (double) 0);
                AnchorPane.setBottomAnchor(lv, (double) 0);
                lv.setItems(oal);
                lv.setCellFactory((param) -> new EditionPane());
                ap.getChildren().addAll(labelNome, labelDesc, lv);
                ap.setMinWidth(ap.getWidth());
                ap.setMinHeight(ap.getHeight());
                raccolteBox.getChildren().add(ap);
            }

            if(utente.equals(App.getData())){
                followButton.setGraphic(new ImageView(new File("bookshelf/src/main/resources/com/psicodramma/icon/plus.png").toURI().toString()));
                followButton.setText("");
                followButton.setOnMouseClicked(param -> newRaccolta());
            } else {
                followButton.setOnMouseClicked(param -> segui());
                followButton.setText("Segui");
            }

            labelUtente.setText(utente.getUsername());
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

    private void segui(){
        try {
            App.setRoot("timeline");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void newRaccolta(){
        Dialog<Pair<String, String>> dialog = new Dialog<>();
        dialog.setTitle("Nuova raccolta");
        dialog.setHeaderText("Inserisci i dati per creare una nuova raccolta");

        ButtonType buttonConferma = new ButtonType("Conferma", ButtonData.OK_DONE);
        ButtonType buttonCancella = new ButtonType("Cancella", ButtonData.CANCEL_CLOSE);
        dialog.getDialogPane().getButtonTypes().addAll(buttonCancella, buttonConferma);

        GridPane grid = new GridPane();
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(20, 150, 10, 10));
        
        TextField nome = new TextField();
        TextField descrizione = new TextField();
        
        grid.add(new Label("Nome:"), 0, 0);
        grid.add(nome, 1, 0);
        grid.add(new Label("Descrizione:"), 0, 1);
        grid.add(descrizione, 1, 1);

        // Validazione
        Node button = dialog.getDialogPane().lookupButton(buttonConferma);
        nome.textProperty().addListener((observable, oldValue, newValue) -> {
            button.setDisable(newValue.trim().isEmpty());
        });

        dialog.getDialogPane().setContent(grid);
        Platform.runLater(() -> nome.requestFocus());

        dialog.setResultConverter(dialogButton -> {
            if (dialogButton == buttonConferma) {
                return new Pair<>(nome.getText().trim(), descrizione.getText().trim());
            }
            return null;
        });

        Optional<Pair<String, String>> result = dialog.showAndWait();

        result.ifPresent(usernamePassword -> {
            System.out.println("Username=" + usernamePassword.getKey() + ", Password=" + usernamePassword.getValue());
        });
    }
}
