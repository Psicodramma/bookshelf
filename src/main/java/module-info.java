module com.psicodramma {
    requires javafx.controls;
    requires javafx.fxml;

    opens com.psicodramma to javafx.fxml;
    exports com.psicodramma;
}
