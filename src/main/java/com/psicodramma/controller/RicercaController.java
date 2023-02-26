package com.psicodramma.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.function.BiFunction;

import com.psicodramma.App;
import com.psicodramma.UIControl.OperaPane;
import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Opera;
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

    public RicercaController(){
        bookService = new BookService();
    }

    public RicercaController(String text, BiFunction<OperaDao, String, Collection<Opera>> prova) {
        bookService = new BookService();
        operaList.addAll(bookService.search(prova, text));
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
        try {
            App.setRoot("timeline");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
