package com.psicodramma.UIControl;

import java.io.IOException;
import java.text.DateFormat;

import com.psicodramma.App;
import com.psicodramma.controller.EdizioneController;
import com.psicodramma.model.Edizione;
import com.psicodramma.service.LibraryService;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Button;
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

    private Edizione edizione;
    private LibraryService libraryService;

    public EditionPane() {
        libraryService = new LibraryService();
        loadFXML();
    }

    private void loadFXML() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/psicodramma/custom/edition_pane.fxml"));
            loader.setController(this);
            loader.load();
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    private void initialize(){
        immagineEdizione.setOnMouseClicked((mouseEvent) -> gotoEdizione());
        readButton.setOnMouseClicked((mouseEvent) -> setAsToRead());
        stateButton.setOnMouseClicked((mouseEvent) -> modifyState());
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
        System.out.println("da leggere :"+edizione.getEditore());
        readButton.setOnMouseClicked((mouseEvent) -> removeToRead());
        readButton.setText("rimuovi da leggere");
    }

    @FXML
    private void removeToRead() {
        System.out.println("non più da leggere :"+edizione.getEditore());
        readButton.setOnMouseClicked((mouseEvent) -> removeToRead());
        readButton.setText("da leggere");
    }

    @FXML
    private void modifyState() {
        
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
