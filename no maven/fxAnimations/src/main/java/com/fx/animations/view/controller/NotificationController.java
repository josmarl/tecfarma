/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fx.animations.view.controller;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;
import javafx.animation.FadeTransition;
import javafx.animation.PauseTransition;
import javafx.animation.SequentialTransition;
import javafx.animation.TranslateTransition;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.util.Duration;
import com.fx.animations.FxMessagesTypes;

/**
 * FXML Controller class
 *
 * @author aquispec
 */
public class NotificationController extends LocalAppController implements Initializable {

    @FXML
    private AnchorPane apNotification, apNotification1;
    @FXML
    private Label lblMensaje;
    @FXML
    private ImageView imgNotification;
    
    private int timeOpen, timePause;
    private int INT_MOVIMIENTO_TOP, INT_MOVIMIENTO_BOTTOM;   
    public int countNotification;
    private double intAnchor;     
    private List<String> lstStyle;
    
    public NotificationController(int position, Image image, String message, List<String> lstStyle, String fxmlPath) {
        this.position = position;
        this.mainImage = image;
        this.message = message;
        this.fxmlPath = fxmlPath;      
        this.lstStyle = lstStyle;
        countNotification++;
    }
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        if (lstStyle != null) {
            apNotification.getStyleClass().addAll(lstStyle);
        }                
        intAnchor = 20.00;
        timeOpen = 1500;
        timePause = timeNotification;
       
        switch (position) {
            case FxMessagesTypes.POSITION_TOPLEFT:
                AnchorPane.setLeftAnchor(apNotification, intAnchor);
                AnchorPane.setTopAnchor(apNotification, intAnchor + (125.00 * (countNotification - 1)));
                AnchorPane.setTopAnchor(apNotification1, -130.00);
                INT_MOVIMIENTO_TOP = 130;
                INT_MOVIMIENTO_BOTTOM = -130;
                break;
            case FxMessagesTypes.POSITION_TOPRIGHT:
                AnchorPane.setRightAnchor(apNotification, intAnchor);
                AnchorPane.setTopAnchor(apNotification, intAnchor + (125.00 * (countNotification - 1)));
                AnchorPane.setTopAnchor(apNotification1, -130.00);
                INT_MOVIMIENTO_TOP = 130;
                INT_MOVIMIENTO_BOTTOM = -130;
                break;
            case FxMessagesTypes.POSITION_BOTTOMRIGHT:
                AnchorPane.setRightAnchor(apNotification, intAnchor);
                AnchorPane.setBottomAnchor(apNotification, intAnchor + (125.00 * (countNotification - 1)));
                AnchorPane.setBottomAnchor(apNotification1, -130.00);
                INT_MOVIMIENTO_TOP = -130;
                INT_MOVIMIENTO_BOTTOM = 130;
                break;
            case FxMessagesTypes.POSITION_BOTTOMLEFT:
                AnchorPane.setLeftAnchor(apNotification, intAnchor);
                AnchorPane.setBottomAnchor(apNotification, intAnchor + (125.00 * (countNotification - 1)));
                AnchorPane.setBottomAnchor(apNotification1, -130.00);
                INT_MOVIMIENTO_TOP = -130;
                INT_MOVIMIENTO_BOTTOM = 130;
                break;
            default:
                break;
        }
        imgNotification.setImage(mainImage);
        lblMensaje.setText(message);

        TranslateTransition apS = new TranslateTransition(Duration.millis(timeOpen), apNotification1);
        apS.setByY(INT_MOVIMIENTO_TOP);
        apS.setCycleCount(1);
        apS.setAutoReverse(true);
        apS.play();

        FadeTransition ft1 = new FadeTransition(Duration.millis(timeOpen), apNotification1);
        ft1.setFromValue(0);
        ft1.setToValue(1);
        ft1.setCycleCount(1);
        ft1.setAutoReverse(true);
        ft1.play();

        PauseTransition pt1 = new PauseTransition(Duration.millis(timeOpen));
        PauseTransition pt2 = new PauseTransition(Duration.millis(timePause));

        TranslateTransition ap1 = new TranslateTransition(Duration.millis(timeOpen), apNotification1);
        ap1.setByY(INT_MOVIMIENTO_BOTTOM);
        ap1.setCycleCount(1);
        ap1.setAutoReverse(true);

        SequentialTransition sq1 = new SequentialTransition(pt1, pt2, ap1);
        sq1.play();

        FadeTransition ft2 = new FadeTransition(Duration.millis(timeOpen), apNotification1);
        ft2.setFromValue(1);
        ft2.setToValue(0);
        ft2.setCycleCount(1);
        ft2.setAutoReverse(true);

        SequentialTransition sq2 = new SequentialTransition(pt1, pt2, ft2);
        sq2.play();

        TimerTask timerTask = new TimerTask() {
            public void run() {
                Platform.runLater(new Runnable() {
                    public void run() {
                        clearScene();
                        timerNC.cancel();
                        timerNC.purge();
                    }
                });
            }
        };

        timerNC = new Timer();
        timerNC.scheduleAtFixedRate(timerTask, 3000 + timePause, 10000);
    }

    private void clearScene() {
        AnchorPane group = (AnchorPane) apNotification.getParent();
        group.getChildren().remove(apNotification);
    }
}
