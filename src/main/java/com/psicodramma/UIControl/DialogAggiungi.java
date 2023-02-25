package com.psicodramma.UIControl;

import java.io.IOException;
import java.util.Objects;
import java.util.Optional;

import com.psicodramma.model.Raccolta;
import com.psicodramma.model.Utente;
import com.psicodramma.service.LibraryService;

import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Insets;
import javafx.scene.Node;
import javafx.scene.control.ButtonBar;
import javafx.scene.control.ButtonBar.ButtonData;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Dialog;
import javafx.scene.control.DialogPane;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.control.TextInputDialog;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.stage.Modality;
import javafx.util.Pair;

public class DialogAggiungi extends Dialog<Raccolta>{
    @FXML private DialogPane dPane;
    @FXML private ComboBox<Raccolta> raccolteChoice;
    @FXML private ImageView buttonAdd;
    @FXML private ButtonType buttonConfirm;
    @FXML private ButtonType buttonCancel;

    private ObservableList<Raccolta> obsList = FXCollections.observableArrayList();
    private Utente utente;
    private LibraryService libraryService;

    public DialogAggiungi() { }

    public DialogAggiungi(Utente utente){
        this.utente = utente;
        obsList.setAll(utente.getLibreria().getRaccoltePersonali());
        libraryService = new LibraryService();
        loadFXML();
    }
    
    private void loadFXML() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/psicodramma/custom/dialog_aggiungi.fxml"));
            loader.setController(this);
            //loader.setRoot(this);
            DialogPane dialogPane = loader.load();
            // dialogPane.lookupButton(connectButtonType).addEventFilter(ActionEvent.ANY, this::onConnect);

            initModality(Modality.WINDOW_MODAL);

            setTitle("In raccolta");
            setDialogPane(dialogPane);
            setResultConverter(buttonType -> {
                if(!Objects.equals(ButtonBar.ButtonData.OK_DONE, buttonType.getButtonData())) {
                    return null;
                }

                return raccolteChoice.getValue();
            });
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public DialogPane getdPane() {
        return dPane;
    }

    @FXML
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
        Node loginButton = dialog.getDialogPane().lookupButton(buttonConferma);
        nome.textProperty().addListener((observable, oldValue, newValue) -> {
            loginButton.setDisable(newValue.trim().isEmpty());
        });

        dialog.getDialogPane().setContent(grid);
        Platform.runLater(() -> nome.requestFocus());

        dialog.setResultConverter(dialogButton -> {
            if (dialogButton == buttonConfirm) {
                return new Pair<>(nome.getText().trim(), descrizione.getText().trim());
            }
            return null;
        });

        Optional<Pair<String, String>> result = dialog.showAndWait();

        result.ifPresent(usernamePassword -> {
            System.out.println("Username=" + usernamePassword.getKey() + ", Password=" + usernamePassword.getValue());
        });
    }

    @FXML
    private void conferma(){
        this.setResult(raccolteChoice.getValue());
        this.hide();
        this.close();
    }

    @FXML
    private void annulla(){
        this.setResult(null);
        this.hide();
        this.close();
    }

    @FXML
    private void initialize(){
        raccolteChoice.setItems(obsList);
    }
}
