/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.view;

import com.fx.common.view.Screen;
import com.fx.common.view.WindowMain;

/**
 *
 * @author aquispec
 */
public class WindowTecfarma extends WindowMain {

    public WindowTecfarma() {
        this.pathImage = "/com/tecfarma/view/image/";
        this.windows = new Screen[]{
            new Screen("Login.fxml", "LOGIN"),
            new Screen("Dashboard.fxml", "DASHBOARD")
        };
    }
}
