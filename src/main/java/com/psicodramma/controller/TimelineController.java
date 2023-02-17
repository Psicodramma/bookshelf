package com.psicodramma.controller;

import java.io.IOException;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.fxml.FXML;
import javafx.scene.control.ListView;

import com.psicodramma.App;
import com.psicodramma.UIControls.ActionPane;
import com.psicodramma.UIControls.ActionPaneFactory;
import com.psicodramma.model.Azione;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class TimelineController {
    @FXML protected ListView<Azione> actionViewList;

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
    private ObservableList<Azione> studentList;

    public TimelineController() {
        studentList = FXCollections.observableArrayList();
    }
     
    @FXML
    private void initialize() {
        if (!studentList.isEmpty()) {
            setupListView();
        } else {
            System.out.println("student list is empty");
        }
        EntityManager em = emf.createEntityManager();
        // leggo l'utente
        
        // leggo le azioni che puó vedere

        //inizializzo la lista
        actionViewList.setCellFactory(new ActionPaneFactory());
        ObservableList<Azione> list = FXCollections.observableArrayList();
        list.add(new Azione());
        actionViewList.setItems(list);
    }

    private void setupListView() {
        actionViewList.setItems(studentList);
        actionViewList.setCellFactory((listView) -> new ActionPane());
    }

    @FXML
    private void switchToPrimary() throws IOException {
        App.setRoot("primary");
    }
}