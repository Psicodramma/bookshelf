package com.psicodramma.UIControl;

import java.io.IOException;
import java.text.DateFormat;

import com.psicodramma.model.Azione;
import com.psicodramma.model.Interagibile;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.layout.AnchorPane;

public class ActionPane extends ListCell<Azione>{
    @FXML private AnchorPane pannello;
    @FXML private Label labelUtente;
    @FXML private Label labelAzione;
    @FXML private Label labelTimestamp;
    @FXML private LikeCommentButton likesController;

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
            interagibile = item;
            setGraphic(pannello);
            setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
            likesController.setInteragibile(item);
            labelUtente.setText(item.getUtente().getUsername());
            labelAzione.setText(item.getAzione().name() + " " + item.getEdizione().getOpera().getTitolo());
            labelTimestamp.setText(DateFormat.getDateInstance().format(item.getTimestamp())); 
        }
    }
}
