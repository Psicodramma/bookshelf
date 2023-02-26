package com.psicodramma.model.enums;

public enum TipoAzione {
    LETTO("ha letto", "Letti"), 
    DALEGGERE("vuole leggere", "Da leggere"), 
    INLETTURA("sta leggendo", "In lettura") , 
    ACCANTONATO("ha accantonato", "Accantonati");

    public final String azione, raccolta;

    private TipoAzione(String azione, String raccolta){
        this.azione=azione;
        this.raccolta=raccolta;
    }
}
