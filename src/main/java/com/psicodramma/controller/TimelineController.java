package com.psicodramma.controller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.ListView;

import com.psicodramma.App;
import com.psicodramma.UIControl.ActionPane;
import com.psicodramma.model.Azione;
import com.psicodramma.model.Utente;
import com.psicodramma.service.TimelineService;

public class TimelineController {
    @FXML protected ListView<Azione> actionViewList;

    private ObservableList<Azione> actionList;
    private TimelineService timelineService;
    private Utente utente;
    
    public TimelineController() {
        this.utente = ((Utente)App.getData());
        timelineService = new TimelineService();
        var res = timelineService.getActionList(new Utente());
        actionList = FXCollections.observableArrayList(res);
    }
     
    @FXML
    private void initialize() {
        if (!actionList.isEmpty()) {
            setupListView();
        } else {
            System.out.println("action list is empty");
        }
    }

    private void setupListView() {
        actionViewList.setCellFactory((param) -> new ActionPane());
        actionViewList.setItems(actionList);
    }


}