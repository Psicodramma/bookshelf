module com.psicodramma {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.persistence;

    opens com.psicodramma to javafx.fxml;
    opens com.psicodramma.controller to javafx.fxml;
    opens com.psicodramma.model to javax.persistence;
    exports com.psicodramma;
}
