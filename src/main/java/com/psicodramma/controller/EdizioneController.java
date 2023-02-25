package com.psicodramma.controller;

import java.io.IOException;
import java.util.Objects;

import com.psicodramma.App;
import com.psicodramma.UIControl.LikeCommentButton;
import com.psicodramma.model.Edizione;
import com.psicodramma.service.BookService;
import com.psicodramma.service.InteractionService;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;

public class EdizioneController {
    @FXML private ImageView indietroButton;
    @FXML private ImageView imgEdizione;
    @FXML private Label labelNomeOpera;
    @FXML private Label labelAutori;
    @FXML private Label labelAnno;
    @FXML private Label labelDescrizione;
    @FXML private Label labelLinguaOriginale;
    @FXML private Label labelGeneri;
    @FXML private LikeCommentButton likesController;
    @FXML private Button readButton;
    @FXML private Button stateButton;
    @FXML private Label labelEditore;
    @FXML private Label labelPaese;
    @FXML private Label labelLingua;
    @FXML private Label labelPagine;
    @FXML private Label labelLinguaEdizione;
    @FXML private Label labelISBN;

    private Edizione edizione;
    private InteractionService interactionService;
    private BookService bookService;

    public EdizioneController(Edizione edizione){
        this.edizione = edizione;
        interactionService = new InteractionService();
        bookService = new BookService();
    }

    @FXML
    private void initialize() { 
        if(!Objects.isNull(edizione)){
            labelNomeOpera.setText(edizione.getOpera().getTitolo());
            labelAutori.setText(edizione.getOpera().getAutoriToString());
            labelAnno.setText(String.valueOf(edizione.getOpera().getAnno()));
            if(edizione.getDescrizione() != null && !edizione.getDescrizione().equals("")){
                labelDescrizione.setText(edizione.getDescrizione());
            } else {
                labelDescrizione.setText(edizione.getOpera().getDescrizione());
            }
            labelLinguaOriginale.setText(edizione.getOpera().getLingua());
            labelGeneri.setText(edizione.getOpera().getGeneriToString());
            labelEditore.setText(edizione.getEditore());
            labelPaese.setText(edizione.getPaese());
            labelLingua.setText(edizione.getLingua());
            labelPagine.setText(String.valueOf(edizione.getNumeroPagine()));
            labelLinguaEdizione.setText(edizione.getLingua());
            labelISBN.setText(edizione.getIsbn());

            likesController.setInteragibile(edizione);
        } else {
            labelNomeOpera.setText("Edizione non presente");
        }
    }

    @FXML
    private void setAsLetto(){

    }

    @FXML
    private void modificaStato(){
        
    }

    @FXML
    private void indietro(){
        LibroController controller = new LibroController(edizione.getOpera());
        try {
            App.setRoot("libro", controller);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}