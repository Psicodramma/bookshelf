package com.psicodramma.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.stream.Stream;

import com.psicodramma.App;
import com.psicodramma.UIControl.ActionPane;
import com.psicodramma.UIControl.EditionPane;
import com.psicodramma.dao.OperaDao;
import com.psicodramma.model.Azione;
import com.psicodramma.model.Edizione;
import com.psicodramma.model.Opera;
import com.psicodramma.model.Utente;
import com.psicodramma.service.TimelineService;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.XYChart;
import javafx.scene.chart.XYChart.Data;
import javafx.scene.chart.XYChart.Series;
import javafx.scene.control.ListView;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.VBox;

public class TimelineController {
    @FXML private ListView<Azione> actionViewList;
    @FXML private BarChart<String, Long> actionWeekChart;
    @FXML private TextField searchBox;  
    @FXML private VBox vb;    
    @FXML private ListView<Edizione> recommendations;    

    private ObservableList<Azione> actionList = FXCollections.observableArrayList();
    private ObservableList<Edizione> raccomandati = FXCollections.observableArrayList();
    private ToggleGroup group = new ToggleGroup();
    private TimelineService timelineService;
    private Utente utente;
    private Map<String, Long> azioniGiorno;
    
    public TimelineController() {
        this.utente = ((Utente)App.getData());
        timelineService = new TimelineService();
        List<Azione> res = timelineService.getActionList();
        actionList.setAll(res);
        azioniGiorno = timelineService.getAzioniGiorno(utente);
        List<Edizione> racc = timelineService.getRaccomandati(utente);
        raccomandati.setAll(racc);
    }

    private void setRadioButton(){
        RadioButton rb1 = new RadioButton("Titolo");
        BiFunction<OperaDao, String, Collection<Opera>> prova = (operaDao, testoRicerca) -> {
            return operaDao.getOpereByTitolo(testoRicerca);
        };
        rb1.setUserData(prova);
        rb1.setToggleGroup(group);
        rb1.setSelected(true);

        RadioButton rb2 = new RadioButton("Autore");
        prova = (operaDao, testoRicerca) -> {
            return operaDao.getOpereByAutore(testoRicerca);
        };
        rb2.setUserData(prova);
        rb2.setToggleGroup(group);

        RadioButton rb3 = new RadioButton("Genere");
        prova = (operaDao, testoRicerca) -> {
            return operaDao.getOpereByGenere(testoRicerca);
        };
        rb3.setUserData(prova);
        rb3.setToggleGroup(group);

        vb.getChildren().add(rb1);
        vb.getChildren().add(rb2);
        vb.getChildren().add(rb3);
    }
     
    @FXML
    private void initialize() {
        setRadioButton();
        if (!actionList.isEmpty()) {
            setupListView();
        } else {
            System.out.println("action list is empty");
        }
        setupActionWeek();
    }

    @FXML 
    private void gotoRicerca(){
        RicercaController ricercaController = new RicercaController(searchBox.getText(), (BiFunction<OperaDao, String, Collection<Opera>>) group.getSelectedToggle().getUserData());
        try {
            App.setRoot("ricerca", ricercaController);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void setupListView() {
        actionViewList.setItems(actionList);
        actionViewList.setCellFactory((param) -> new ActionPane());

        recommendations.setItems(raccomandati);
        recommendations.setCellFactory((param) -> new EditionPane());
    }

    private void setupActionWeek(){
        Stream<LocalDate> giorni = LocalDate.now().minusDays(6).datesUntil(LocalDate.now().plusDays(1));
        XYChart.Series<String, Long> serie = new Series<>();
        giorni.forEach(x ->{
            if(azioniGiorno.containsKey(x.toString())){
                serie.getData().add(new Data<>(x.toString(), azioniGiorno.get(x.toString())));
            }else{
                serie.getData().add(new Data<String,Long>(x.toString(), Long.parseLong("0")));
            }
        });
        actionWeekChart.getData().add(serie);
    }

}