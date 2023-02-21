package com.psicodramma.UIControl;

import java.io.IOException;
import java.text.DateFormat;

import com.psicodramma.model.Azione;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Opera;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.layout.AnchorPane;

public class OperaPane extends ListCell<Opera>{
    @FXML private AnchorPane pannello;
    @FXML private Label labelTitolo;
    @FXML private Label labelLingua;
    @FXML private Label labelAnno;
    @FXML private Label labelDescrizione;

    private Opera opera;

    public OperaPane() {
        loadFXML();
    }

    private void loadFXML() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/psicodramma/custom/opera_pane.fxml"));
            loader.setController(this);
            loader.load();
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    private void initialize(){
        pannello.setOnMouseClicked((mouseEvent) -> gotoLibro());
    }

    @FXML
    private void gotoLibro() {
        System.out.println("VAGIANGIU!");
    }

    @Override
    protected void updateItem(Opera item, boolean empty) {
        super.updateItem(item, empty);
        
        if(empty || item == null) {
            setText(null);
            setGraphic(null);
        } else {
            opera = item;
            setGraphic(pannello);
            setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
            labelAnno.setText(String.valueOf(opera.getAnno()));
            labelDescrizione.setText(opera.getDescrizione());
            labelLingua.setText(opera.getLingua());
            labelTitolo.setText(opera.getTitolo());
        }
    }
}
