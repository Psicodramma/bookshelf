package com.psicodramma.controller;

import java.io.IOException;
import javafx.fxml.FXML;
import com.psicodramma.App;

public class SecondaryController {

    @FXML
    private void switchToPrimary() throws IOException {
        App.setRoot("primary");
    }
}