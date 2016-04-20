/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fx.animations.view.controller;

import java.net.URL;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;
import javafx.animation.PauseTransition;
import javafx.animation.SequentialTransition;
import javafx.animation.TranslateTransition;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.util.Duration;

/**
 * FXML Controller class
 *
 * @author aquispec
 */
public class ContextualBackController extends LocalAppController implements Initializable {

    @FXML
    private AnchorPane apContextualBack;
    @FXML
    private Label lblMensaje;
    private int timeOpen,timePause;
    private String backGroundColor;
    private String textColor;

    public ContextualBackController(String message, int timePause,String backGroundColor, String fxmlPath){
        this.message = message;
        this.timePause = timePause * 1000;
        this.fxmlPath = fxmlPath;
        this.backGroundColor = backGroundColor;        
    }
    
    public ContextualBackController(String message, int timePause,String backGroundColor, String textColor, String fxmlPath){
        this.message = message;
        this.timePause = timePause * 1000;
        this.fxmlPath = fxmlPath;
        this.backGroundColor = backGroundColor;        
        this.textColor = textColor;
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        timeOpen = 1000;
        AnchorPane.setTopAnchor(apContextualBack, -120.00);
        this.lblMensaje.setText(message);        
        
        this.apContextualBack.setStyle("-fx-background-color: "+ backGroundColor +";");
        if (textColor != null) {
            this.lblMensaje.setStyle("-fx-text-fill: "+ textColor +";");
        }        
        PauseTransition pt1 = new PauseTransition(Duration.millis(timeOpen));
        PauseTransition pt2 = new PauseTransition(Duration.millis(timePause));
        
        TranslateTransition ap1 = new TranslateTransition(Duration.millis(timeOpen), apContextualBack);
        ap1.setByY(120);
        ap1.setCycleCount(1);
        ap1.setAutoReverse(true);
        ap1.play();
        
        TranslateTransition ap2 = new TranslateTransition(Duration.millis(timeOpen), apContextualBack);
        ap2.setByY(-120);
        ap2.setCycleCount(1);
        ap2.setAutoReverse(true);
        
        SequentialTransition sq1 = new SequentialTransition(pt1, pt2, ap2);
        sq1.play();
        
        TimerTask timerTask = new TimerTask() {
            public void run() {
                Platform.runLater(new Runnable() {
                    public void run() {
                        clearScene();
                        timer.cancel();
                        timer.purge();
                    }
                });
            }
        };

        timer = new Timer();
        timer.scheduleAtFixedRate(timerTask, (timeOpen *2) + timePause, 10000);
        
    }    
    
    private void clearScene() {
        AnchorPane group = (AnchorPane) apContextualBack.getParent();
        group.getChildren().remove(apContextualBack);
    }
    
}
