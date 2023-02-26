package com.psicodramma.controller;

import java.io.File;
import java.io.IOException;
import java.util.Objects;

import com.psicodramma.App;
import com.psicodramma.UIControl.DialogAggiungi;
import com.psicodramma.UIControl.LikeCommentButton;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Utente;
import com.psicodramma.model.enums.TipoAzione;
import com.psicodramma.service.LibraryService;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
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
    @FXML private Label labelAnnoEdizione;
    @FXML private Label labelPagine;
    @FXML private Label labelLinguaEdizione;
    @FXML private Label labelISBN;

    private Utente utente;
    private Edizione edizione;
    private LibraryService libraryService;

    public EdizioneController(Edizione edizione){
        this.edizione = edizione;
        utente = (Utente) App.getData();
        libraryService = new LibraryService();
    }

    @FXML
    private void initialize() { 
        if(!Objects.isNull(edizione)){
            imgEdizione.setImage(new Image(new File(edizione.getUrl()).toURI().toString()));
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
            labelAnnoEdizione.setText(edizione.getDataPubblicazione().toString());
            labelPagine.setText(String.valueOf(edizione.getNumeroPagine()));
            labelLinguaEdizione.setText(edizione.getLingua());
            labelISBN.setText(edizione.getIsbn());

            utente.getLibreria().getRaccolta(TipoAzione.LETTO.raccolta).ifPresent((raccolta) -> readButton.setVisible(!raccolta.contains(edizione)));

            likesController.setInteragibile(edizione);
        } else {
            labelNomeOpera.setText("Edizione non presente");
        }
    }

    @FXML
    private void setAsLetto(){
        Alert alert = new Alert(AlertType.CONFIRMATION, "Aggiungere ai letti?", ButtonType.YES, ButtonType.NO, ButtonType.CANCEL);
        alert.showAndWait();

        if (alert.getResult() == ButtonType.YES) {
            libraryService.addEdizione(edizione, utente.getLibreria().getRaccolta(TipoAzione.LETTO.raccolta).get());
        }
        readButton.setVisible(false);
    }

    @FXML
    private void modificaStato(){
        DialogAggiungi dia = new DialogAggiungi(utente, edizione);
        dia.showAndWait();
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
