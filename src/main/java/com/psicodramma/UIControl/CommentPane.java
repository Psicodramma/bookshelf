package com.psicodramma.UIControl;

import java.io.IOException;
import java.text.DateFormat;

import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;

public class CommentPane extends ListCell<Commento>{
    @FXML protected AnchorPane commento;
    @FXML protected AnchorPane placeholder;
    @FXML protected VBox vbokksu;
    @FXML protected Label labelUtente;
    @FXML protected Label labelCommento;
    @FXML protected Label labelTimestamp;
    @FXML protected LikeCommentButton likesController;

    private Interagibile interagibile;
    private int level;

    public CommentPane(int level) {
        this.level = level;
        loadFXML();
    }

    private void loadFXML() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/psicodramma/custom/comment_pane.fxml"));
            loader.setController(this);
            loader.load();
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public int getLevel() {
        return level;
    }

    @FXML
    private void initialize(){  
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
    protected void updateItem(Commento item, boolean empty) {
        super.updateItem(item, empty);
        
        if(empty || item == null) {
            setText(null);
            setGraphic(null);
        } else {
            interagibile = item;
            setGraphic(commento);
            setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
            likesController.setInteragibile(item);
            likesController.setCommentoController(this);
            labelUtente.setText(item.getUtente().getUsername());
            labelCommento.setText(item.getTesto());
            labelTimestamp.setText(DateFormat.getDateInstance().format(item.getTimestamp())); 
        }
    }

    public void loadSubLevel() {
        CommentTab ctrl = new CommentTab(level + 1);
        ctrl.setInteragibile(interagibile);
        ctrl.setPrefWidth(commento.getPrefWidth());
        AnchorPane.setTopAnchor(ctrl, (double) 0);
        AnchorPane.setBottomAnchor(ctrl, (double) 0);
        AnchorPane.setLeftAnchor(ctrl, (double) 0);
        AnchorPane.setRightAnchor(ctrl, (double) 0);
        commento.setPrefHeight(commento.getPrefHeight() / (level + 1) * 10);
        placeholder.getChildren().add(ctrl);
    }

    public void unloadSubLevel() {
        placeholder.getChildren().clear();
        commento.setPrefHeight(commento.getPrefHeight() * (level + 1) / 10);
    }
}
