/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.view.controller;

import com.tecfarma.service.FactoryService;
import com.tecfarmaModel.model.Usuario;
import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;

/**
 * FXML Controller class
 *
 * @author josmarl
 */
public class DashboardController implements Initializable {

    @FXML
    Button btxxxx;

    FactoryService factoryService;

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        btxxxx.setOnAction((ActionEvent event) -> {
            factoryService = FactoryService.getInstance();
            List<Usuario> listaUsuario = factoryService.getUsuarioService().listaUsuario();
            listaUsuario.stream().forEach((u) -> {
                System.out.println(u.getUsuario());
            });
        });

    }

}
