package com.psicodramma.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Objects;

import com.psicodramma.App;
import com.psicodramma.UIControl.EditionPane;
import com.psicodramma.UIControl.LikeCommentButton;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Opera;
import com.psicodramma.service.BookService;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.image.ImageView;

public class LibroController {
    @FXML protected ImageView indietroButton;
    @FXML protected ImageView imgLibro;
    @FXML protected Label labelNomeOpera;
    @FXML protected Label labelAutori;
    @FXML protected Label labelAnno;
    @FXML protected Label labelDescrizione;
    @FXML protected Label labelLingua;
    @FXML protected Label labelGeneri;
    @FXML private LikeCommentButton likesController;
    @FXML private ListView<Edizione> edizioniList;
    
    private ObservableList<Edizione> editionList = FXCollections.observableArrayList();

    private BookService bookService;
    private Opera opera;

    public LibroController() {
        bookService = new BookService();
    }

    public LibroController(Opera opera){
        this.opera = opera;
        bookService = new BookService();
        // FORSE DA LEVARE
        Collection<Edizione> res = opera.getEdizioni();
        editionList.setAll(res);
    }
    
    @FXML
    private void initialize() { 
        if(!Objects.isNull(opera)){
            edizioniList.setItems(editionList);
            edizioniList.setCellFactory((param) -> new EditionPane());

            labelNomeOpera.setText(opera.getTitolo());
            labelAnno.setText(String.valueOf(opera.getAnno()));
            labelDescrizione.setText(opera.getDescrizione());
            labelLingua.setText(opera.getLingua());
            labelAutori.setText(String.join(", ", opera.getAutori()));
            labelGeneri.setText(String.join(", ", opera.getGeneri()));

            likesController.setInteragibile(opera);
        }else{
            labelNomeOpera.setText("Opera non presente");
        }
    }

    @FXML
    private void indietro(){
        try {
            App.setRoot("timeline");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
