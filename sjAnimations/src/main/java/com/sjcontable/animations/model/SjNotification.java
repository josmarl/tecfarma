/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.animations.model;

import java.util.List;

/**
 *
 * @author aquispec
 */
public class SjNotification {
    private int tipo;
    private String mensaje;
    private int position;
    private int orden;
    private List<String> lstStyle;

    public SjNotification(int tipo, String mensaje){
        this.tipo = tipo;
        this.mensaje = mensaje;
    }
    
    public SjNotification(int tipo, String mensaje, int position){
        this.tipo = tipo;
        this.mensaje = mensaje;
        this.position = position;
    }
    public SjNotification(int tipo, String mensaje, int position, List<String> lstStyle){
        this.tipo = tipo;
        this.mensaje = mensaje;
        this.position = position;
        this.lstStyle = lstStyle;
    }
    
    
    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }
    public List<String> getLstStyle() {
        return lstStyle;
    }

    public void setLstStyle(List<String> lstStyle) {
        this.lstStyle = lstStyle;
    }
}
