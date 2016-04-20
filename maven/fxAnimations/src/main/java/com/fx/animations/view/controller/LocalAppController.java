/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fx.animations.view.controller;

import java.net.URL;
import java.util.Timer;
import javafx.fxml.FXMLLoader;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;

/**
 *
 * @author mpazo
 */
public class LocalAppController {

    protected int position;
    protected Image mainImage;
    protected String message;
    protected String mainPath;
    protected String fxmlPath;    
    
    public static Timer timer  = null;    
    protected Timer timerNC  = null;  
    public static Timer timerNotifications  = null;  
    public static int timeNotification;
    
    public AnchorPane load(String strFxml) throws Exception {
        
        FXMLLoader loader = new FXMLLoader(new URL(this.fxmlPath + "fxml/"+ strFxml));
        loader.setController(this);
        AnchorPane newApWindow = (AnchorPane) loader.load();

        return newApWindow;
    }
}
