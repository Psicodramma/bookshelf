package com.psicodramma.UIControl;

import java.io.IOException;
import java.util.Objects;

import com.psicodramma.model.Raccolta;
import com.psicodramma.model.Utente;

import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonBar;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Dialog;
import javafx.scene.control.DialogPane;
import javafx.scene.control.TextInputDialog;
import javafx.scene.control.ButtonBar.ButtonData;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;

public class DialogAggiungi extends Dialog<Raccolta>{
    @FXML private DialogPane dPane;
    @FXML private ComboBox<Raccolta> raccolteChoice;
    @FXML private ImageView buttonAdd;
    @FXML private ButtonType buttonConfirm;
    @FXML private ButtonType buttonCancel;

    private ObservableList<Raccolta> obsList = FXCollections.observableArrayList();
    private Utente utente;

    public DialogAggiungi() { }

    public DialogAggiungi(Utente utente){
        this.utente = utente;
        obsList.setAll(utente.getLibreria().getRaccoltePersonali());
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
        TextInputDialog alert = new TextInputDialog();
        alert.setHeaderText("Inserisci il nome della raccolta che vuoi creare");
        alert.showAndWait();

        if (alert.getResult() != null && alert.getResult() != "") {
            
        }
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
