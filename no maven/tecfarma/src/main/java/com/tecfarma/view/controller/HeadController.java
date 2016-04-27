/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.view.controller;

import com.tecfarma.constant.AppConstant;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;

/**
 * FXML Controller class
 *
 * @author josmarl
 */
public class HeadController extends LocalAppController implements Initializable {

    @Override
    public void initialize(URL url, ResourceBundle rb) {

    }

    @FXML
    public void handleAcercaDe(ActionEvent event) {
        
    }
    @FXML
    public void cerrarSession(ActionEvent event) {
        try {
            openWindows(AppConstant.PAGE_LOGIN);
        } catch (IOException ex) {
            Logger.getLogger(HeadController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
