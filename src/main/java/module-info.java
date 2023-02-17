module com.psicodramma {
    requires javafx.controls;
    requires javafx.fxml;
    requires jakarta.persistence;
    requires java.sql;

    opens com.psicodramma to javafx.fxml;
    opens com.psicodramma.controller to javafx.fxml;
    opens com.psicodramma.UIControls to javafx.fxml;
    opens com.psicodramma.model to jakarta.persistence, org.eclipse.persistence.core, eclipselink;
    exports com.psicodramma;
}
