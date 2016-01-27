/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.common.view;

/**
 *
 * @author josmarl
 */
public class Screen {

    private String fxmlWindow;
    private String title;
    private Boolean vVersion = false;
    private Boolean datosMesa = true;
    private Boolean paneSteps = true;

    public Boolean isPaneSteps() {
        return paneSteps;
    }

    public void setPaneSteps(Boolean paneSteps) {
        this.paneSteps = paneSteps;
    }

    public Boolean isvVersion() {
        return vVersion;
    }

    public void setvVersion(Boolean vVersion) {
        this.vVersion = vVersion;
    }

    public Boolean isDatosMesa() {
        return datosMesa;
    }

    public void setDatosMesa(Boolean datosMesa) {
        this.datosMesa = datosMesa;
    }

    public String getFxmlWindow() {
        return fxmlWindow;
    }

    public void setFxmlWindow(String fxmlWindow) {
        this.fxmlWindow = fxmlWindow;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Screen(String xmlWindow, String title) {
        this.fxmlWindow = xmlWindow;
        this.title = title;
    }

    public Screen(String xmlWindow, String title, Boolean paneSteps) {
        this.fxmlWindow = xmlWindow;
        this.title = title;
        this.paneSteps = paneSteps;
    }

    public Screen(String xmlWindow, String title, Boolean vVersion, Boolean datosMesa) {
        this.fxmlWindow = xmlWindow;
        this.title = title;
        this.vVersion = vVersion;
        this.datosMesa = datosMesa;
        this.paneSteps = false;
    }
}
