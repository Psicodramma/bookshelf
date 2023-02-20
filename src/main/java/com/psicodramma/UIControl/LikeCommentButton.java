package com.psicodramma.UIControl;

import java.io.File;

import com.psicodramma.App;
import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Utente;
import com.psicodramma.service.InteractionService;

import javafx.fxml.FXML;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

public class LikeCommentButton{
    @FXML private ImageView imgLike;
    private boolean stateLike = false;
    @FXML private ImageView imgCommento;
    @FXML private Label labelLikeCount;
    @FXML private Pane pannello;
    @FXML private ActionPane pannelloController;
    @FXML private CommentPane commentoController;
    private boolean stateCommento = false;

    private InteractionService interactionService;
    private Interagibile interagibile;

    public LikeCommentButton() {
        interactionService = new InteractionService();
    }

    public void setInteragibile(Interagibile interagibile) {
        this.interagibile = interagibile;
        interagibile.setLike(interactionService.getLikes(interagibile));
        setLikeLabel();
    }
    
    public void setCommentoController(CommentPane commentoController) {
        this.commentoController = commentoController;
    }

    @FXML
    private void initialize() {
        setLikeLabel();
    }

    @FXML
    protected void editLike() {
        Utente utente = (Utente) App.getData();
        
        stateLike = !stateLike;
        if(stateLike){
            interactionService.addLike(interagibile, utente);
        } else {
            interactionService.removeLike(interagibile, utente);
        }
        setLikeLabel();
    }

    private void setLikeLabel(){
        Image image;
        if(stateLike){
            File file = new File("bookshelf/src/main/resources/com/psicodramma/icon/like_full.png");
            image = new Image(file.toURI().toString());
        } else {
            File file = new File("bookshelf/src/main/resources/com/psicodramma/icon/like.png");
            image = new Image(file.toURI().toString());
        }
        imgLike.setImage(image);
        if(interagibile != null){
            labelLikeCount.setText("" + interagibile.getLike().size());
        }
    }

    @FXML
    protected void addComment() {
        if(!(interagibile instanceof Commento)){
            CommentTab ctrl = new CommentTab(1);
            ctrl.setInteragibile(interagibile);
            Stage stage = new Stage();
            stage.setTitle("Commenti");
            stage.setScene(new Scene(ctrl));
            stage.show();
        } else {
            if(!stateCommento){
                commentoController.loadSubLevel();
            } else {
                commentoController.unloadSubLevel();
            }

            stateCommento = !stateCommento;
        }
    }
}
