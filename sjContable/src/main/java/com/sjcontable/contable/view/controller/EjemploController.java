/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.contable.view.controller;

import com.sjcontable.animations.SjMessagesTypes;
import com.sjcontable.animations.view.SjAnimations;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;

/**
 * FXML Controller class
 *
 * @author noe
 */
public class EjemploController implements Initializable {

    
    SjAnimations pop = SjAnimations.getInstance();
    
    @FXML
    Button btnOtroEvento;
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {

        LocalAppController.winSj.apMain.setOnKeyPressed(new EventHandler<KeyEvent>() {
            @Override
            public void handle(KeyEvent event) {
                if (event.getCode() == KeyCode.F1) {
                    System.out.println("le di f1");
                }
                
                if (event.getCode() == KeyCode.F2) {
                    System.out.println("le di f2");
                }
               
            }
        });
        
    }

    @FXML
    protected void handleDecirHola(ActionEvent event){
        System.out.println("usted mando un saludo");
    }
    
    @FXML
    protected void handleOpenPop(ActionEvent event) throws Exception{
        pop.setApMain(LocalAppController.winSj.apMain);
        pop.openPopup("este es mi popup", SjMessagesTypes.TYPE_INFORMATION);
    }
    
}
