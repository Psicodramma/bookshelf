package com.psicodramma.UIControls;

import java.io.IOException;

import com.psicodramma.model.Azione;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.layout.Pane;

public class ActionPane extends ListCell<Azione>{
    @FXML protected Pane pannello;
    @FXML protected Label labelUtente;
    @FXML protected Label labelAzione;
    @FXML protected Label labelTimestamp;

    public ActionPane() {
        loadFXML();
    }

    private void loadFXML() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/psicodramma/custom/action_pane.fxml"));
            loader.setController(this);
            //loader.setRoot(this);
            loader.load();
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    protected void doSomething() {
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
            labelUtente.setText("URCA");
            labelUtente.setVisible(true);
            labelAzione.setText("HAHAHA");
            labelAzione.setVisible(true);
            labelTimestamp.setText("MAZURCA");
            labelTimestamp.setVisible(true);

        }
    }
}
