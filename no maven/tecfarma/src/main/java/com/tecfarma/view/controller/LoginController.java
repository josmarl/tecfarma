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
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;

/**
 *
 * @author josmarl
 */
public class LoginController extends LocalAppController implements Initializable {

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

    @FXML
    protected void handleLogin(ActionEvent event) throws IOException {
        openWindows(AppConstant.PAGE_DASHBOARD);
    }
}
