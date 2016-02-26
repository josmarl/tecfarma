/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fx.animations.view.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.layout.AnchorPane;

/**
 * FXML Controller class
 *
 * @author aquispec
 */
public class ModalAutorizacionController extends LocalAppController implements Initializable {

    /**
     * Initializes the controller class.
     */
    @FXML
    private AnchorPane apModal;
    @FXML
    private Button btnAceptar,btnSalir;
    @FXML
    private PasswordField txtClave;
    
    private EventHandler eventMessage;
    private String mClave;
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
    }    
    public ModalAutorizacionController(EventHandler event,String clave ,String fxmlPath) {
        this.eventMessage = event;
        this.fxmlPath = fxmlPath;
        this.mClave = clave;
        System.err.println(clave);
    }
    
    @FXML
    private void cancelar(ActionEvent event){ 
        AnchorPane group = (AnchorPane) apModal.getParent();
        group.getChildren().remove(apModal);
    }
    
    @FXML
    private void btnX(ActionEvent event){ 
        AnchorPane group = (AnchorPane) apModal.getParent();
        group.getChildren().remove(apModal);
    }
    
    @FXML
    private void aceptar(ActionEvent event){
        if (txtClave.getText().equals(mClave)) {
            btnX(event);
            eventMessage.handle(event);
        }        
    }
    
    
    
}
