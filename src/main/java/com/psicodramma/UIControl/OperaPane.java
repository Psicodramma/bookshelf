package com.psicodramma.UIControl;

import java.io.IOException;

import com.psicodramma.App;
import com.psicodramma.controller.LibroController;
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
    @FXML private Label labelAutori;
    @FXML private Label labelGeneri;

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
        LibroController controller = new LibroController(opera);
        try {
            App.setRoot("libro", controller);
        } catch (IOException e) {
            e.printStackTrace();
        }
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
            labelAutori.setText(opera.getAutoriToString());
            labelGeneri.setText(opera.getGeneriToString());
        }
    }
}
