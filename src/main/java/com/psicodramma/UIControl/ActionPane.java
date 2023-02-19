package com.psicodramma.UIControl;

import java.io.IOException;
import java.text.DateFormat;

import com.psicodramma.model.Azione;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Utente;

import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Pane;

public class ActionPane extends ListCell<Azione>{
    @FXML protected AnchorPane pannello;
    @FXML protected Label labelUtente;
    @FXML protected Label labelAzione;
    @FXML protected Label labelTimestamp;
    @FXML protected Pane placeholder;

    private Interagibile interagibile;

    public ActionPane() {
        loadFXML();
    }

    private void loadFXML() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/psicodramma/custom/action_pane.fxml"));
            loader.setController(this);
            loader.load();
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    private void initialize(){
        labelUtente.setOnMousePressed((mouseEvent) -> gotoRaccoltaUtente());
        labelAzione.setOnMousePressed((mouseEvent) -> gotoLibro());
    }

    @FXML
    private void gotoRaccoltaUtente() {
        System.out.println("The button was clicked!");
    }

    @FXML
    private void gotoLibro() {
        System.out.println("The button was clicked!");
    }

    @Override
    protected void updateItem(Azione item, boolean empty) {
        super.updateItem(item, empty);
        
        if(empty || item == null) {
            setText(null);
            setGraphic(null);
        } else {
            setVisible(true);
            setGraphic(pannello);
            setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
            labelUtente.setText(item.getUtente().getUsername());
            labelAzione.setText(item.getAzione().name() + " " + item.getEdizione().getOpera().getTitolo());
            labelTimestamp.setText(DateFormat.getDateInstance().format(item.getTimestamp()));

            interagibile = item;
            placeholder.setUserData(interagibile);
        }
    }
}
