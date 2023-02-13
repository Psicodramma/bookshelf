package com.psicodramma.model;

public class Azione extends Interagibile{
    private int id;
    private Edizione edizione;
    private enum tipoAzione { letti, daLeggere, inLettura , accantonati};
    private tipoAzione azione;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Edizione getEdizione() {
        return edizione;
    }
    public void setEdizione(Edizione edizione) {
        this.edizione = edizione;
    }
    public tipoAzione getAzione() {
        return azione;
    }
    public void setAzione(tipoAzione azione) {
        this.azione = azione;
    }

}
