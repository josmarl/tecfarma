/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.contable.view;

import com.sjcontable.common.view.Screen;
import com.sjcontable.common.view.WindowMain;

/**
 *
 * @author aquispec
 */
public class WindowSjContable extends WindowMain {

    public WindowSjContable() {
        this.pathImage = "/com/sjcontable/contable/view/image/";
        this.windows = new Screen[]{
            new Screen("Login.fxml", "LOGIN"),
            new Screen("Dashboard.fxml", "DASHBOARD"),
            new Screen("MaestroCuentas.fxml","MAESTRO DE CUENTAS")
        };
    }
}
