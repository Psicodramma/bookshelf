package com.psicodramma.controller;

import java.io.IOException;
import javafx.fxml.FXML;
import com.psicodramma.*;

public class PrimaryController {

    @FXML
    private void switchToSecondary() throws IOException {
        App.setRoot("secondary");
    }
}
