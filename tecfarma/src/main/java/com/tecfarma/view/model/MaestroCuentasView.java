/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.view.model;

import javafx.beans.property.SimpleStringProperty;

/**
 *
 * @author josmarl
 */
public class MaestroCuentasView {

    private final SimpleStringProperty id;
    private final SimpleStringProperty cuenta;
    private final SimpleStringProperty pcgr;
    private final SimpleStringProperty idAperturaPeriodo;

    private MaestroCuentasView(String id, String cuenta, String pcgr, String idAperturaPeriodo) {
        this.id = new SimpleStringProperty(id);
        this.cuenta = new SimpleStringProperty(cuenta);
        this.pcgr = new SimpleStringProperty(pcgr);
        this.idAperturaPeriodo = new SimpleStringProperty(idAperturaPeriodo);
    }

    public String getId() {
        return id.get();
    }

    public void setId(String id) {
        this.id.set(id);
    }

    public String getCuenta() {
        return cuenta.get();
    }

    public void setCuenta(String cuenta) {
        this.cuenta.set(cuenta);
    }

    public String getPcgr() {
        return pcgr.get();
    }

    public void setPcgr(String pcgr) {
        this.pcgr.set(pcgr);
    }

    public String getIdAperturaPeriodo() {
        return idAperturaPeriodo.get();
    }

    public void setIdAperturaPeriodo(String idAperturaPeriodo) {
        this.idAperturaPeriodo.set(idAperturaPeriodo);
    }

}
