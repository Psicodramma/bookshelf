package com.psicodramma.controller;

import java.util.Objects;

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
    private Opera op;
    public LibroController() {
        opDao = new OperaDao();
    }
    
    @FXML
    private void initialize() { 
        //idOpera = (String) App.getData(); 
        String idOpera = "1";
        op = opDao.getOperaById(idOpera);
        if(!Objects.isNull(op)){
            labelNomeOpera.setText(op.getTitolo());
            labelAnno.setText(String.valueOf(op.getAnno()));
            labelDescrizione.setText(op.getDescrizione());
            labelLingua.setText(op.getLingua());
            labelAutori.setText(String.join(", ", op.getAutori()));
            labelGeneri.setText(String.join(", ", op.getGeneri()));

            intDao = new InteragibileDao();
            intDao.setInteragibile(op);
            op.getEdizioni().forEach(x -> intDao.setInteragibile(x));
        }else{
            labelNomeOpera.setText("Opera non presente");
        }
    }

    @FXML
    private void indietro(){
        System.out.println("Prova");
    }

    
}
