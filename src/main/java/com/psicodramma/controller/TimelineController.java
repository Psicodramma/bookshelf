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
        // inizializzo le azioni qui
        var em = emf.createEntityManager();
        var res = em.createNativeQuery("select * from azione order by data desc", Azione.class).getResultList();
        studentList = FXCollections.observableArrayList(res);
    }
     
    @FXML
    private void initialize() {
        if (!studentList.isEmpty()) {
            setupListView();
        } else {
            System.out.println("student list is empty");
        }
        // leggo l'utente
        
        // leggo le azioni che puó vedere

        //inizializzo la lista
    }

    private void setupListView() {
        // actionViewList.setCellFactory(new ActionPaneFactory());
        actionViewList.setCellFactory((listView) -> new ActionPane());
        actionViewList.setItems(studentList);
    }

    @FXML
    private void switchToPrimary() throws IOException {
        App.setRoot("primary");
    }
}