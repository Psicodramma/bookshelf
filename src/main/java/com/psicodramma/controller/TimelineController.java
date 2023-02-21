package com.psicodramma.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import com.psicodramma.App;
import com.psicodramma.UIControl.ActionPane;
import com.psicodramma.model.Azione;
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
import javafx.scene.control.TextField;

public class TimelineController {
    @FXML private ListView<Azione> actionViewList;
    @FXML private BarChart<String, Long> actionWeekChart;
    @FXML private TextField searchBox;     

    private ObservableList<Azione> actionList = FXCollections.observableArrayList();
    private TimelineService timelineService;
    private Utente utente;
    private Map<String, Long> azioniGiorno;
    
    public TimelineController() {
        this.utente = ((Utente)App.getData());
        timelineService = new TimelineService();
        List<Azione> res = timelineService.getActionList();
        actionList.setAll(res);
        azioniGiorno = timelineService.getAzioniGiorno(utente);
    }
     
    @FXML
    private void initialize() {
        if (!actionList.isEmpty()) {
            setupListView();
        } else {
            System.out.println("action list is empty");
        }
        setupActionWeek();
    }

    @FXML 
    private void gotoRicerca(){
        RicercaController ricercaController = new RicercaController(searchBox.getText());
        try {
            App.setRoot("ricerca", ricercaController);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void setupListView() {
        actionViewList.setItems(actionList);
        actionViewList.setCellFactory((param) -> new ActionPane());
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