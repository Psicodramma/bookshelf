package com.psicodramma.UIControl;

import java.io.IOException;

import com.psicodramma.App;
import com.psicodramma.dao.InteragibileDao;
import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Utente;
import com.psicodramma.service.InteractionService;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;

public class CommentTab extends AnchorPane{
    @FXML protected TextField textboxCommento;
    @FXML protected ImageView buttonCommento;
    @FXML protected ListView<Commento> listCommento;

    private ObservableList<Commento> commentList = FXCollections.observableArrayList();
    private InteractionService interactionService;
    private Interagibile interagibile;
    private Utente utente;
    private int level;

    public CommentTab(int level) {
        this.level = level;
        this.utente = ((Utente)App.getData());
        interactionService = new InteractionService();
        loadFXML();
    }

    private void loadFXML() {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/com/psicodramma/custom/comment_tab.fxml"));
            loader.setRoot(this);
            loader.setController(this);
            loader.load();
        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void setInteragibile(Interagibile interagibile) {
        this.interagibile = interagibile;
        commentList.addAll(interactionService.getComment(interagibile));
        checkList();
    }

    private void checkList() {
        if (!commentList.isEmpty()) {
            setupListView();
        } else {
            System.out.println("comment list is empty");
        }
    }

    private void setupListView() {
        listCommento.setItems(commentList);
        listCommento.setCellFactory((param) -> new CommentPane(level));
    }

    @FXML
    private void sendCommento() {
        
    }
}
