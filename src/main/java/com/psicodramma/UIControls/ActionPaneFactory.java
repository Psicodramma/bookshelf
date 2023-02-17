package com.psicodramma.UIControls;

import javafx.util.Callback;
import com.psicodramma.model.Azione;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;

public class ActionPaneFactory implements Callback<ListView<Azione>, ListCell<Azione>> {

    @Override
    public ListCell<Azione> call(ListView<Azione> param) {
        return new ActionPane();
    }
}