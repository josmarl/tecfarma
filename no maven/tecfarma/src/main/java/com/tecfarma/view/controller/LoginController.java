/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.view.controller;

import com.fx.animations.FxMessagesTypes;
import com.fx.animations.view.FxAnimations;
import com.tecfarma.constant.AppConstant;
import com.tecfarma.service.FactoryService;
import com.tecfarmaModel.model.Usuario;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;

/**
 *
 * @author josmarl
 */
public final class LoginController extends LocalAppController implements Initializable {

    @FXML
    TextField txtUsuario;
    @FXML
    PasswordField txtPassword;
    @FXML
    Button btnLogin;

    FactoryService factoryService = FactoryService.getInstance();
    FxAnimations animations = FxAnimations.getInstance();

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        EventHandler<KeyEvent> eventLogin = (KeyEvent event) -> {
            if (event.getCode() == KeyCode.ENTER) {
                handleLogin(null);
            }
        };
        txtUsuario.setOnKeyPressed(eventLogin);
        txtPassword.setOnKeyPressed(eventLogin);
        btnLogin.setOnKeyPressed(eventLogin);
    }

    public LoginController() {
    }

    @FXML
    protected void handleLogin(ActionEvent event) {

        Usuario usuario = new Usuario();
        usuario.setUsuario(txtUsuario.getText());
        usuario.setPassword(txtPassword.getText());

        if (!usuario.getUsuario().isEmpty()) {
            if (!usuario.getPassword().isEmpty()) {
                Usuario u = factoryService.getUsuarioService().loginUsuario(usuario);
                if (u != null) {
                    try {
                        openWindows(AppConstant.PAGE_DASHBOARD);
                    } catch (IOException ex) {
                        Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, ex.getMessage());
                    }
                } else {
                    animations.setApMain(winFx.apMain);
                    try {
                        animations.openPopup(AppConstant.MSG_LOGIN, FxMessagesTypes.TYPE_INFORMATION);
                    } catch (Exception ex) {
                        Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } else {
                animations.validate(txtPassword);
            }
        } else {
            animations.validate(txtUsuario);
        }

    }

}
