/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.contable.view.controller;

import com.sjcontable.contable.service.FactoryService;
import com.sjcontable.model.contable.ContMaestroCuentas;
import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableView;

/**
 * FXML Controller class
 *
 * @author josmarl
 */
public class MaestroCuentasController implements Initializable {

    @FXML
    TableView tMaestroCuentas;

    FactoryService service = FactoryService.getInstance();

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        List<ContMaestroCuentas> listaMaestroCuentas = service.getMaestroCuentasService().findAll();
        listaMaestroCuentas.stream().forEach((m) -> {
            System.out.println(m.getCuenta());
        });
    }

}
