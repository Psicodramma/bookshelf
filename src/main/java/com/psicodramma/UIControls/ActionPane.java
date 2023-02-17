package com.psicodramma.UIControls;

import java.io.IOException;

import com.psicodramma.model.Azione;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;

public class ActionPane extends ListCell<Azione>{
    @FXML private Label labelUtente;
    @FXML private Label labelAzione;
    @FXML private Label labelTimestamp;

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
            //setContentDisplay(ContentDisplay.TEXT_ONLY);
        } else {
            labelUtente.setText("URCA");
            labelAzione.setText("");
            labelTimestamp.setText("MAZURCA");

            //setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
        }
    }
}
