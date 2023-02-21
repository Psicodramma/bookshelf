package com.psicodramma.controller;

import java.io.IOException;
import java.util.Objects;

import com.psicodramma.App;
import com.psicodramma.dao.InteragibileDao;
import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Opera;

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

    private OperaDao opDao;
    private InteragibileDao intDao;
    private Opera opera;

    public LibroController() {
        opDao = new OperaDao();
    }

    public LibroController(Opera opera){
        opDao = new OperaDao();
        this.opera = opera;
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

            intDao = new InteragibileDao();
            intDao.setInteragibile(opera);
            opera.getEdizioni().forEach(x -> intDao.setInteragibile(x));
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
