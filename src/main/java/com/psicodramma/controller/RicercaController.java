package com.psicodramma.controller;

import com.psicodramma.UIControl.CommentPane;
import com.psicodramma.UIControl.OperaPane;
import com.psicodramma.model.Commento;
import com.psicodramma.model.Interagibile;
import com.psicodramma.model.Opera;
import com.psicodramma.model.Utente;
import com.psicodramma.service.BookService;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.ListView;
import javafx.scene.image.ImageView;

public class RicercaController {
    @FXML protected ImageView backButton;
    @FXML protected ListView<Opera> listOpera;

    private ObservableList<Opera> operaList = FXCollections.observableArrayList();
    private BookService bookService;
    private Interagibile interagibile;
    private Utente utente;

    public RicercaController(){
        bookService = new BookService();
    }

    public RicercaController(String text) {
        bookService = new BookService();
        operaList.addAll(bookService.search(text));
    }
     
    @FXML
    private void initialize() {
        if (!operaList.isEmpty()) {
            setupListView();
        } else {
            System.out.println("action list is empty");
        }
    }

    private void setupListView() {
        listOpera.setItems(operaList);
        listOpera.setCellFactory((param) -> new OperaPane());
    }

    @FXML
    private void gotoTimeline(){
        System.out.println("CIAO");
    }
}
