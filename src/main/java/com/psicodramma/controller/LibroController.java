package com.psicodramma.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Objects;

import com.psicodramma.App;
import com.psicodramma.UIControl.EditionPane;
import com.psicodramma.UIControl.LikeCommentButton;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Opera;

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

    private Opera opera;

    public LibroController() { }

    public LibroController(Opera opera){
        this.opera = opera;
        
        Collection<Edizione> res = opera.getEdizioni();
        editionList.setAll(res);
    }
    
    @FXML
    private void initialize() { 
        if(!Objects.isNull(opera)){
            edizioniList.setItems(editionList);
            edizioniList.setCellFactory((param) -> new EditionPane(true));

            labelNomeOpera.setText(opera.getTitolo());
            labelAnno.setText(String.valueOf(opera.getAnno()));
            labelDescrizione.setText(opera.getDescrizione());
            labelLingua.setText(opera.getLingua());
            labelAutori.setText(opera.getAutoriToString());
            labelGeneri.setText(opera.getGeneriToString());

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
