/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.contable.view.controller;

import com.sjcontable.contable.constant.AppConstant;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
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
    protected void goToMantMaestroCuentas(ActionEvent event) throws IOException {
        openWindows(AppConstant.PAGE_MC_MANTENANCE);
    }

}
