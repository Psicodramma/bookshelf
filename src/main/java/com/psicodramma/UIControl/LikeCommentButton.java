package com.psicodramma.UIControl;

import java.io.File;
import java.io.IOException;

import com.psicodramma.App;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Utente;
import com.psicodramma.service.InteractionService;

import javafx.fxml.FXML;
import javafx.scene.Parent;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Pane;

public class LikeCommentButton extends Pane{
    @FXML protected ImageView imgLike;
    private boolean state = false;
    @FXML protected ImageView imgCommento;
    @FXML protected Label labelLikeCount;
    @FXML protected Pane pannello;

    private InteractionService interactionService;

    public LikeCommentButton() {
        super();
        interactionService = new InteractionService();
    }

    @FXML
    private void initialize() {
        // state = interagibile.getLike().contains(utente.getUsername());
        setLikeLabel();
    }

    @FXML
    protected void editLike() {
        Interagibile interagibile = (Interagibile)pannello.getUserData();
        Utente utente = (Utente) App.getData();
        
        state = !state;
        if(state){
            interactionService.addLike(interagibile, utente);
        } else {
            interactionService.removeLike(interagibile, utente);
        }
        setLikeLabel();
    }

    private void setLikeLabel(){
        Image image;
        if(state){
            File file = new File("bookshelf/src/main/resources/com/psicodramma/icon/like_full.png");
            image = new Image(file.toURI().toString());
        } else {
            File file = new File("bookshelf/src/main/resources/com/psicodramma/icon/like.png");
            image = new Image(file.toURI().toString());
        }
        imgLike.setImage(image);
        // labelLikeCount.setText("" + interagibile.getLike().size());
        labelLikeCount.setText("2");
    }

    @FXML
    protected void addComment() {
        System.out.println("The button was clicked!");
    }
}
