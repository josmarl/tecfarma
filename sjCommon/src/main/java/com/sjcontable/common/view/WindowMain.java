/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.common.view;

import java.io.InputStream;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

/**
 *
 * @author mpazo
 */
public abstract class WindowMain {

    public AnchorPane apMain;
    public Stage mainStage;
    public String pathFxml;
    public String pathImage;
    public Screen[] windows;
    public InputStream pathJrxml;
    public String pathLang;

}
