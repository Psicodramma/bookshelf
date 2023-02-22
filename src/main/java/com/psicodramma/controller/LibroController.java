package com.psicodramma.controller;

import java.io.IOException;
import java.util.Objects;

import com.psicodramma.App;
import com.psicodramma.UIControl.LikeCommentButton;
import com.psicodramma.dao.InteragibileDao;
import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Opera;
import com.psicodramma.service.BookService;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
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

    //CAMBIA
    private BookService bookService;
    private Opera opera;

    public LibroController() {
        bookService = new BookService();
    }

    public LibroController(Opera opera){
        this.opera = opera;
        bookService = new BookService();
    }
    
    @FXML
    private void initialize() { 
        if(!Objects.isNull(opera)){
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
