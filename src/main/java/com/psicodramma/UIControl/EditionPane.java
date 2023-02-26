package com.psicodramma.UIControl;

import java.io.IOException;
import java.text.DateFormat;

import com.psicodramma.App;
import com.psicodramma.controller.EdizioneController;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Utente;
import com.psicodramma.model.enums.TipoAzione;
import com.psicodramma.service.LibraryService;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;

public class EditionPane extends ListCell<Edizione>{
    @FXML private AnchorPane pannello;
    @FXML private ImageView immagineEdizione;
    @FXML private Label labelLingua;
    @FXML private Label labelAnno;
    @FXML private Label labelEditore;
    @FXML private Button stateButton;
    @FXML private Button readButton;

    private boolean showButtons;
    private Edizione edizione;
    private LibraryService libraryService;
    private Utente utente;

    public EditionPane(boolean showButtons) {
        libraryService = new LibraryService();
        this.showButtons = showButtons;
        loadFXML();
    }

    private void loadFXML() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/psicodramma/custom/edition_pane.fxml"));
            loader.setController(this);
            loader.load();
            utente = (Utente) App.getData();
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    private void initialize(){
        immagineEdizione.setOnMouseClicked((mouseEvent) -> gotoEdizione());
        if(showButtons){
            readButton.setOnMouseClicked((mouseEvent) -> setAsToRead());
            stateButton.setOnMouseClicked((mouseEvent) -> modifyState());
        } else {
            readButton.setVisible(showButtons);
            stateButton.setVisible(showButtons);
        }
    }

    @FXML
    private void gotoEdizione() {
        EdizioneController controller = new EdizioneController(edizione);
        try {
            App.setRoot("edizione", controller);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void setAsToRead() {
        Alert alert = new Alert(AlertType.CONFIRMATION, "Aggiungere in lettura?", ButtonType.YES, ButtonType.NO, ButtonType.CANCEL);
        alert.showAndWait();

        if (alert.getResult() == ButtonType.YES) {
            libraryService.addEdizione(edizione, utente.getLibreria().getRaccolta(TipoAzione.DALEGGERE.toString()).get());
        }
        readButton.setText("In lettura");
        readButton.setOnMouseClicked((mouseEvent) -> removeToRead());
        
    }

    @FXML
    private void removeToRead() {
        Alert alert = new Alert(AlertType.CONFIRMATION, "Rimuovere dalle edizioni in lettura?", ButtonType.YES, ButtonType.NO, ButtonType.CANCEL);
        alert.showAndWait();

        if (alert.getResult() == ButtonType.YES) {
            libraryService.removeEdizione(edizione, utente.getLibreria().getRaccolta(TipoAzione.DALEGGERE.toString()).get());
        }
        readButton.setText("Da leggere");
        readButton.setOnMouseClicked((mouseEvent) -> setAsToRead());
        
    }

    @FXML
    private void modifyState() {
        DialogAggiungi dia = new DialogAggiungi(utente);
        dia.showAndWait();

    }

    @Override
    protected void updateItem(Edizione item, boolean empty) {
        super.updateItem(item, empty);
        
        if(empty || item == null) {
            setText(null);
            setGraphic(null);
        } else {
            edizione = item;
            setGraphic(pannello);
            setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
            labelAnno.setText(DateFormat.getDateInstance().format(edizione.getDataPubblicazione()));
            labelEditore.setText(edizione.getEditore());
            labelLingua.setText(edizione.getLingua());
        }
    }
}
