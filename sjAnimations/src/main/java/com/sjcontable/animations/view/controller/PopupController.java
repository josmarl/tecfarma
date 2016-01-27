package com.sjcontable.animations.view.controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.animation.FadeTransition;
import javafx.animation.PauseTransition;
import javafx.animation.ScaleTransition;
import javafx.animation.SequentialTransition;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.scene.shape.Line;
import javafx.util.Duration;
import com.sjcontable.animations.OnpeMessagesTypes;

public class PopupController extends LocalAppController implements Initializable {

    @FXML
    private AnchorPane APCentral, APBotones, apMensaje, apNuevo;
    @FXML
    private Line lineOpen;
    @FXML
    private Label lblTitle, lblMessage;
    @FXML
    private ImageView imgEvaLogin;
    @FXML
    private HBox hbMensaje, hbContenido;
    @FXML
    private Button btnAceptar, btnCancelar, btnSI, btnNO;
    private int timeLinea, timeOpen, timeControls, timeClose;
    private int typeOpcion;
    private EventHandler eventMessage1;
    private EventHandler eventMessage2;
    private double mHeight;
    private String title;

    public PopupController(Image image, String message, String title, String fxmlPath) {
        this.mainImage = image;
        this.message = message;
        this.fxmlPath = fxmlPath;
        this.title = title;
    }

    public PopupController(Image image, String message, String title, String fxmlPath, double height) {
        this.mainImage = image;
        this.message = message;
        this.fxmlPath = fxmlPath;
        this.title = title;
        this.mHeight = height;
    }

    public PopupController(AnchorPane anchorPane, String fxmlPath) {
        this.apNuevo = anchorPane;
        this.fxmlPath = fxmlPath;
        this.title = title;
    }

    public PopupController(AnchorPane anchorPane, String fxmlPath, double height) {
        this.apNuevo = anchorPane;
        this.fxmlPath = fxmlPath;
        this.title = title;
        this.mHeight = height;
    }

    public PopupController(Image image, String message, String title, String fxmlPath, EventHandler event) {
        this.mainImage = image;
        this.message = message;
        this.fxmlPath = fxmlPath;
        this.title = title;
        this.eventMessage1 = event;
    }

    public PopupController(Image image, String message, String title, String fxmlPath, int typeOpcion, EventHandler event) {
        this.mainImage = image;
        this.message = message;
        this.fxmlPath = fxmlPath;
        this.title = title;
        this.typeOpcion = typeOpcion;
        this.eventMessage1 = event;
    }

    public PopupController(Image image, String message, String title, String fxmlPath, int typeOpcion, EventHandler event, double height) {
        this.mainImage = image;
        this.message = message;
        this.fxmlPath = fxmlPath;
        this.title = title;
        this.typeOpcion = typeOpcion;
        this.eventMessage1 = event;
        this.mHeight = height;
    }

    public PopupController(Image image, String message, String title, String fxmlPath, int typeOpcion, EventHandler event1, EventHandler event2) {
        this.mainImage = image;
        this.message = message;
        this.fxmlPath = fxmlPath;
        this.title = title;
        this.typeOpcion = typeOpcion;
        this.eventMessage1 = event1;
        this.eventMessage2 = event2;
    }

    public PopupController(Image image, String message, String title, String fxmlPath, int typeOpcion, EventHandler event1, EventHandler event2, double height) {
        this.mainImage = image;
        this.message = message;
        this.fxmlPath = fxmlPath;
        this.title = title;
        this.typeOpcion = typeOpcion;
        this.mHeight = height;
        this.eventMessage1 = event1;
        this.eventMessage2 = event2;
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        if (mHeight == 0) {
            mHeight = 450;
        }
        if (typeOpcion == OnpeMessagesTypes.OPCION_YES_NO) {
            btnAceptar.setVisible(false);
            btnCancelar.setVisible(false);
            btnSI.setOnAction(eventMessage1);
            if (eventMessage2!= null) {
                btnNO.setOnAction(eventMessage2);
            }            
        } else if (typeOpcion == OnpeMessagesTypes.OPCION_ACCEPT_CANCEL) {
            btnSI.setVisible(false);
            btnNO.setVisible(false);
            btnAceptar.setOnAction(eventMessage1);            
            if (eventMessage2!= null) {
                btnCancelar.setOnAction(eventMessage2);
            }
        } else {
            if (eventMessage1 != null) {
                btnAceptar.setOnAction(eventMessage1);
            }
            btnCancelar.setVisible(false);
            btnSI.setVisible(false);
            btnNO.setVisible(false);
            btnAceptar.setTranslateX(100);
            //btnAceptar.f            
            Platform.runLater(new Runnable() {
                @Override
                public void run() {
                    btnAceptar.requestFocus();
                }
            });
            btnAceptar.setOnKeyPressed(eventMessage1);
                        
            btnAceptar.focusTraversableProperty();            
        }
        if (apNuevo != null) {
            hbContenido.getChildren().clear();
            hbContenido.getChildren().add(apNuevo);
        } else {
            lblTitle.setText(this.title);
            lblMessage.setText(this.message);
            imgEvaLogin.setImage(this.mainImage);
        }
        timeLinea = 150;
        timeOpen = 100;

        PauseTransition pt1 = new PauseTransition(Duration.millis(timeLinea));

        ScaleTransition st1 = new ScaleTransition(Duration.millis(timeLinea), lineOpen);
        st1.setByX(500f);
        st1.setByY(0f);
        st1.setCycleCount(1);
        st1.setAutoReverse(true);
        st1.play();

        FadeTransition ft1 = new FadeTransition(Duration.millis(timeOpen), APCentral);
        ft1.setFromValue(0);
        ft1.setToValue(1);
        ft1.setCycleCount(1);
        ft1.setAutoReverse(true);

        SequentialTransition seqT1 = new SequentialTransition(pt1, ft1);
        seqT1.play();

        ScaleTransition apS = new ScaleTransition(Duration.millis(timeOpen), APCentral);
        apS.setByX(0f);
        apS.setByY(mHeight);
        apS.setCycleCount(1);
        apS.setAutoReverse(true);

        SequentialTransition seqT = new SequentialTransition(pt1, apS);
        seqT.play();

        timeControls = timeLinea + timeOpen;
        PauseTransition pt2 = new PauseTransition(Duration.millis(timeControls));

        if (apNuevo != null) {
            FadeTransition ftIV = new FadeTransition(Duration.millis(timeControls), apNuevo);
            ftIV.setFromValue(0);
            ftIV.setToValue(1);
            ftIV.setCycleCount(1);
            ftIV.setAutoReverse(true);

            SequentialTransition seqIV = new SequentialTransition(pt2, ftIV);
            seqIV.play();
        } else {
            FadeTransition ftIV = new FadeTransition(Duration.millis(timeControls), imgEvaLogin);
            ftIV.setFromValue(0);
            ftIV.setToValue(1);
            ftIV.setCycleCount(1);
            ftIV.setAutoReverse(true);

            SequentialTransition seqIV = new SequentialTransition(pt2, ftIV);
            seqIV.play();

            FadeTransition ftL = new FadeTransition(Duration.millis(timeControls), lblTitle);
            ftL.setFromValue(0);
            ftL.setToValue(1);
            ftL.setCycleCount(1);
            ftL.setAutoReverse(true);

            FadeTransition ftMessage = new FadeTransition(Duration.millis(timeControls), lblMessage);
            ftMessage.setFromValue(0);
            ftMessage.setToValue(1);
            ftMessage.setCycleCount(1);
            ftMessage.setAutoReverse(true);

            SequentialTransition seqL = new SequentialTransition(pt2, ftL);
            seqL.play();
            
            SequentialTransition seqMessage = new SequentialTransition(pt2, ftMessage);
            seqMessage.play();

            FadeTransition ftAPB = new FadeTransition(Duration.millis(timeControls), APBotones);
            ftAPB.setFromValue(0);
            ftAPB.setToValue(1);
            ftAPB.setCycleCount(1);
            ftAPB.setAutoReverse(true);

            SequentialTransition seqAPB = new SequentialTransition(pt2, ftAPB);
            seqAPB.play();
        }

    }

    @FXML
    private void close(ActionEvent event) throws IOException {
        cerrarPopup();
    }

    private void cerrarPopup() {
        timeControls = 100;
        timeClose = 100;

        PauseTransition pt1 = new PauseTransition(Duration.millis(timeControls));

        if (apNuevo != null) {
            FadeTransition ftIV = new FadeTransition(Duration.millis(timeClose), apNuevo);
            ftIV.setFromValue(1);
            ftIV.setToValue(0);
            ftIV.setCycleCount(1);
            ftIV.setAutoReverse(true);

            SequentialTransition seqIV = new SequentialTransition(pt1, ftIV);
            seqIV.play();
        } else {
            FadeTransition ftIV = new FadeTransition(Duration.millis(timeClose), imgEvaLogin);
            ftIV.setFromValue(1);
            ftIV.setToValue(0);
            ftIV.setCycleCount(1);
            ftIV.setAutoReverse(true);

            SequentialTransition seqIV = new SequentialTransition(pt1, ftIV);
            seqIV.play();

            FadeTransition ftL = new FadeTransition(Duration.millis(timeClose), lblTitle);
            ftL.setFromValue(1);
            ftL.setToValue(0);
            ftL.setCycleCount(1);
            ftL.setAutoReverse(true);

            FadeTransition ftMessage = new FadeTransition(Duration.millis(timeClose), lblMessage);
            ftMessage.setFromValue(1);
            ftMessage.setToValue(0);
            ftMessage.setCycleCount(1);
            ftMessage.setAutoReverse(true);

            SequentialTransition seqL = new SequentialTransition(pt1, ftL);
            seqL.play();
            
            SequentialTransition seqMessage = new SequentialTransition(pt1, ftMessage);
            seqMessage.play();

            FadeTransition ftAPB = new FadeTransition(Duration.millis(timeClose), APBotones);
            ftAPB.setFromValue(1);
            ftAPB.setToValue(0);
            ftAPB.setCycleCount(1);
            ftAPB.setAutoReverse(true);

            SequentialTransition seqAPB = new SequentialTransition(pt1, ftAPB);
            seqAPB.play();
        }

        timeLinea = timeControls + timeClose;
        PauseTransition pt2 = new PauseTransition(Duration.millis(timeLinea));

        ScaleTransition apS = new ScaleTransition(Duration.millis(timeLinea), APCentral);
        apS.setByX(0f);
        apS.setByY(-mHeight);
        apS.setCycleCount(1);
        apS.setAutoReverse(true);

        SequentialTransition seqT = new SequentialTransition(pt2, apS);
        seqT.play();

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

        timer.scheduleAtFixedRate(timerTask, 700, 10000);
    }

    private void clearScene() {
        AnchorPane group = (AnchorPane) apMensaje.getParent();
        group.getChildren().remove(apMensaje);
    }

}
