/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.animations.view;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import javafx.animation.FadeTransition;
import javafx.animation.TranslateTransition;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.util.Duration;
import com.sjcontable.animations.OnpeMessagesTypes;
import com.sjcontable.animations.model.OnpeNotification;
import com.sjcontable.animations.view.controller.ContextualBackController;
import com.sjcontable.animations.view.controller.LocalAppController;
import com.sjcontable.animations.view.controller.PopupController;
import com.sjcontable.animations.view.controller.ModalAutorizacionController;
import com.sjcontable.animations.view.controller.NotificationController;

/**
 *
 * @author aquispec
 */
public class OnpeAnimations extends Application {

    private static OnpeAnimations instance;

    private AnchorPane apMain;
    private Stage stageMain;
    private String mainPath;
    private String mainPathImages;
    private Double xOffset, yOffset;

    private static List<OnpeNotification> lstOnpeNotiTopLeft;
    private static List<OnpeNotification> lstOnpeNotiTopRight;
    private static List<OnpeNotification> lstOnpeNotiBottomLeft;
    private static List<OnpeNotification> lstOnpeNotiBottomRight;

    private boolean boolNot;

    private int maxNotification;
    private int timeNotification;

    private static List<Node> lstNodes;

    public int getTimeNotification() {
        return timeNotification;
    }

    public void setTimeNotification(int timeNotification) {
        this.timeNotification = timeNotification;
    }

    public int getMaxNotification() {
        return maxNotification;
    }

    public void setMaxNotification(int maxNotification) {
        this.maxNotification = maxNotification;
    }

    public void setApMain(AnchorPane apMain) {
        this.apMain = apMain;
    }

    public void setStageMain(Stage stageMain) {
        this.stageMain = stageMain;
    }

    public static void main(String[] args) {
        launch(args);
    }

    private OnpeAnimations() {
        mainPath = getClass().getResource("").toString();
        mainPathImages = mainPath + "image/";
        lstOnpeNotiTopLeft = new ArrayList<>();
        lstOnpeNotiTopRight = new ArrayList<>();
        lstOnpeNotiBottomLeft = new ArrayList<>();
        lstOnpeNotiBottomRight = new ArrayList<>();
        lstNodes = new ArrayList<>();
        boolNot = false;
    }

    public static OnpeAnimations getInstance() {
        if (instance == null) {
            instance = new OnpeAnimations();
        }

        return instance;
    }

    public static void closeTimers() {
        if (LocalAppController.timer != null) {
            LocalAppController.timer.cancel();
            LocalAppController.timer.purge();
        }
        if (LocalAppController.timerNotifications != null) {
            LocalAppController.timerNotifications.cancel();
            LocalAppController.timerNotifications.purge();
        }
    }

    private Image fetchImage(int TypeMessage) {
        Image image = null;
        switch (TypeMessage) {
            case OnpeMessagesTypes.TYPE_SUCCESS:
                image = new Image(mainPathImages + "popup_success.png");
                break;
            case OnpeMessagesTypes.TYPE_ERROR:
                image = new Image(mainPathImages + "popup_error.png");
                break;
            case OnpeMessagesTypes.TYPE_INFORMATION:
                image = new Image(mainPathImages + "popup_information.png");
                break;
            case OnpeMessagesTypes.TYPE_CONFIRMATION:
                image = new Image(mainPathImages + "popup_information.png");
            default:
                break;
        }
        return image;
    }

    public void dragDropToolBar(Node oNode) {
        oNode.setOnMousePressed(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                xOffset = event.getSceneX();
                yOffset = event.getSceneY();
            }
        });
        oNode.setOnMouseDragged(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent event) {
                stageMain.setX(event.getScreenX() - xOffset);
                stageMain.setY(event.getScreenY() - yOffset);
            }
        });

    }

    public boolean validate(Node node) {
        return validateText(node, ".required", "", "", Pos.CENTER);
    }

    public boolean validate(Node node, String cssClass) {
        return validateText(node, cssClass, "", "", Pos.CENTER);
    }

    public boolean validate(Node node, Pos posAlignMessage) {
        return validateText(node, ".required", "", "", posAlignMessage);
    }

    public boolean validate(Node node, String message, Pos posAlignMessage) {
        return validateText(node, ".required", message, "", posAlignMessage);
    }

    public boolean validate(Node node, String cssClass, String message, Pos posAlignMessage) {
        return validateText(node, cssClass, message, "", posAlignMessage);
    }

    public boolean validate(Node node, String cssClass, String message, String cssMessage, Pos posAlignMessage) {
        return validateText(node, cssClass, message, cssMessage, posAlignMessage);
    }

    private boolean validateText(Node node, String cssClass, String message, String cssMessage, Pos posAlignMessage) {
        if (message.equals("")) {
            message = "Campo Obligatorio";
        }
        if (cssClass.equals("")) {
            cssClass = ".required";
        }
        for (Node nod : lstNodes) {
            AnchorPane anchorPane = (AnchorPane) nod.getParent();
            anchorPane.getChildren().remove(nod);
        }
        lstNodes.clear();

        for (Node nod : node.lookupAll(cssClass)) {
            if (nod.getClass() == TextField.class || nod.getClass() == PasswordField.class) {
                TextField textF = (TextField) nod;
                if (textF.getText().equals("")) {
                    Label lblMess = new Label();
                    lblMess.setText(message);
                    lblMess.setAlignment(posAlignMessage);
                    if (cssMessage.equals("")) {
                        lblMess.setStyle("-fx-background-color: #FF0000;"
                                + "-fx-text-fill: #FFFFFF;"
                                + "-fx-font-weight: bold;"
                                + "-fx-font-family: Arial Narrow;"
                                + "-fx-background-radius: 2px;"
                                + "-fx-pref-height: 20px;"
                                + "-fx-pref-width: "
                                + textF.getWidth() + "px;");
                    } else {
                        lblMess.setStyle(cssMessage);
                    }
                    AnchorPane anchorPane = (AnchorPane) nod.getParent();
                    anchorPane.getChildren().add(lblMess);
                    lblMess.setLayoutX(nod.getLayoutX());
                    lblMess.setLayoutY(nod.getLayoutY());
                    lblMess.setOpacity(0);

                    lstNodes.add(lblMess);
                    FadeTransition ft = new FadeTransition(Duration.millis(1000), lblMess);
                    ft.setFromValue(0);
                    ft.setToValue(0.7);
                    ft.setCycleCount(1);
                    ft.setAutoReverse(true);
                    ft.play();

                    TranslateTransition tt = new TranslateTransition(Duration.millis(800), lblMess);
                    tt.setByY(-23f);
                    tt.setCycleCount(1);
                    tt.setAutoReverse(true);
                    tt.play();
                }
            }
        }
        if (lstNodes.size() > 0) {
            return false;
        } else {
            return true;
        }

    }

    public void openModalAutorizacion(EventHandler event, String clave) throws Exception {
        ModalAutorizacionController cmodal = new ModalAutorizacionController(event, clave, mainPath);
        AnchorPane newApWindow = cmodal.load("ModalAutorizacion.fxml");
        apMain.getChildren().add(newApWindow);
    }

    public void openPopup(AnchorPane anchorPane) throws Exception {
        PopupController cMessage = new PopupController(anchorPane, mainPath);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void openPopup(AnchorPane anchorPane, double height) throws Exception {
        PopupController cMessage = new PopupController(anchorPane, mainPath, height);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void closePopups() {
        Set<Node> newApWindow = apMain.lookupAll(".onpe_animation_popup");

        for (Node nod : newApWindow) {
            apMain.getChildren().remove(nod);
        }
    }

    public void openPopup(String message, String title, int typeMessage) throws Exception {
        PopupController cMessage = new PopupController(fetchImage(typeMessage), message, title, mainPath);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void openPopup(String message, int typeMessage) throws Exception {
        PopupController cMessage = new PopupController(fetchImage(typeMessage), message, OnpeMessagesTypes.getTitle(typeMessage), mainPath);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void openPopup(String message, int typeMessage, double height) throws Exception {
        PopupController cMessage = new PopupController(fetchImage(typeMessage), message, OnpeMessagesTypes.getTitle(typeMessage), mainPath, height);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void openPopup(String message, int typeMessage, EventHandler event) throws Exception {
        PopupController cMessage = new PopupController(fetchImage(typeMessage), message, OnpeMessagesTypes.getTitle(typeMessage), mainPath, event);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }    

    public void openPopup(String message, int typeMessage, int typeOpcion, EventHandler event) throws Exception {
        PopupController cMessage = new PopupController(fetchImage(typeMessage), message, OnpeMessagesTypes.getTitle(typeMessage), mainPath, typeOpcion, event);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void openPopup(String message, int typeMessage, int typeOpcion, EventHandler event, double height) throws Exception {
        PopupController cMessage = new PopupController(fetchImage(typeMessage), message, OnpeMessagesTypes.getTitle(typeMessage), mainPath, typeOpcion, event, height);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void openPopup(String message, int typeMessage, int typeOpcion, EventHandler event1, EventHandler event2) throws Exception {
        PopupController cMessage = new PopupController(fetchImage(typeMessage), message, OnpeMessagesTypes.getTitle(typeMessage), mainPath, typeOpcion, event1, event2);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void openPopup(String message, int typeMessage, int typeOpcion, EventHandler event1, EventHandler event2, double height) throws Exception {
        PopupController cMessage = new PopupController(fetchImage(typeMessage), message, OnpeMessagesTypes.getTitle(typeMessage), mainPath, typeOpcion, event1, event2, height);
        AnchorPane newApWindow = cMessage.load("Popup.fxml");
        newApWindow.getStyleClass().add("onpe_animation_popup");
        apMain.getChildren().add(newApWindow);
    }

    public void openContextualBack(String message, int timePause, String backGroundColor) throws Exception {
        ContextualBackController cContex = new ContextualBackController(message, timePause, backGroundColor, mainPath);
        AnchorPane newApWindow = cContex.load("ContextualBack.fxml");
        apMain.getChildren().add(newApWindow);
    }

    public void openContextualBack(String message, int timePause, String backGroundColor, String textColor) throws Exception {
        ContextualBackController cContex = new ContextualBackController(message, timePause, backGroundColor, textColor, mainPath);
        AnchorPane newApWindow = cContex.load("ContextualBack.fxml");
        apMain.getChildren().add(newApWindow);
    }

    public void openNotification(OnpeNotification onpeNoti, int time) throws Exception {
        LocalAppController.timeNotification = time * 1000;
        maxNotification = 1;
        NotificationController cNotification = new NotificationController(onpeNoti.getPosition(), fetchImage(onpeNoti.getTipo()), onpeNoti.getMensaje(), onpeNoti.getLstStyle(), mainPath);
        AnchorPane newApWindow = cNotification.load("Notification.fxml");
        apMain.getChildren().add(newApWindow);
    }

    public void openMultiNotifications(List<OnpeNotification> lstOnpeNotification) throws Exception {
        LocalAppController.timeNotification = timeNotification * 1000;
        for (OnpeNotification onpeNot : lstOnpeNotification) {
            if (onpeNot.getPosition() == OnpeMessagesTypes.POSITION_TOPLEFT) {
                lstOnpeNotiTopLeft.add(onpeNot);
            } else if (onpeNot.getPosition() == OnpeMessagesTypes.POSITION_TOPRIGHT) {
                lstOnpeNotiTopRight.add(onpeNot);
            } else if (onpeNot.getPosition() == OnpeMessagesTypes.POSITION_BOTTOMRIGHT) {
                lstOnpeNotiBottomRight.add(onpeNot);
            } else if (onpeNot.getPosition() == OnpeMessagesTypes.POSITION_BOTTOMLEFT) {
                lstOnpeNotiBottomLeft.add(onpeNot);
            }
        }

        if (!boolNot) {
            boolNot = true;
            TimerTask timerTask = new TimerTask() {
                public void run() {
                    Platform.runLater(new Runnable() {
                        public void run() {
                            try {
                                loadNoti();
                            } catch (Exception ex) {
                                //Logger.getLogger(OnpeAnimations.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    });
                }
            };

            LocalAppController.timerNotifications = new Timer();
            LocalAppController.timerNotifications.scheduleAtFixedRate(timerTask, 0, 5000);
        }

    }

    private void loadNoti() throws Exception {
        int sizeTL = lstOnpeNotiTopLeft.size();
        int sizeTR = lstOnpeNotiTopRight.size();
        int sizeBR = lstOnpeNotiBottomRight.size();
        int sizeBL = lstOnpeNotiBottomLeft.size();

        if (sizeTL > 0 || sizeTR > 0 || sizeBR > 0 || sizeBL > 0) {
            int countTP = 0;
            int countTR = 0;
            int countBR = 0;
            int countBL = 0;

            for (int i = 0; i < maxNotification; i++) {
                if (i < sizeTL) {
                    NotificationController cNotification = new NotificationController(lstOnpeNotiTopLeft.get(i).getPosition(), fetchImage(lstOnpeNotiTopLeft.get(i).getTipo()), lstOnpeNotiTopLeft.get(i).getMensaje(), lstOnpeNotiTopLeft.get(i).getLstStyle(), mainPath);
                    countTP++;
                    cNotification.countNotification = countTP;
                    AnchorPane newApWindow = cNotification.load("Notification.fxml");
                    apMain.getChildren().add(newApWindow);
                }

                if (i < sizeTR) {
                    NotificationController cNotification = new NotificationController(lstOnpeNotiTopRight.get(i).getPosition(), fetchImage(lstOnpeNotiTopRight.get(i).getTipo()), lstOnpeNotiTopRight.get(i).getMensaje(), lstOnpeNotiTopRight.get(i).getLstStyle(), mainPath);
                    countTR++;
                    cNotification.countNotification = countTR;
                    AnchorPane newApWindow = cNotification.load("Notification.fxml");
                    apMain.getChildren().add(newApWindow);
                }

                if (i < sizeBR) {
                    NotificationController cNotification = new NotificationController(lstOnpeNotiBottomRight.get(i).getPosition(), fetchImage(lstOnpeNotiBottomRight.get(i).getTipo()), lstOnpeNotiBottomRight.get(i).getMensaje(), lstOnpeNotiBottomRight.get(i).getLstStyle(), mainPath);
                    countBR++;
                    cNotification.countNotification = countBR;
                    AnchorPane newApWindow = cNotification.load("Notification.fxml");
                    apMain.getChildren().add(newApWindow);
                }

                if (i < sizeBL) {
                    NotificationController cNotification = new NotificationController(lstOnpeNotiBottomLeft.get(i).getPosition(), fetchImage(lstOnpeNotiBottomLeft.get(i).getTipo()), lstOnpeNotiBottomLeft.get(i).getMensaje(), lstOnpeNotiBottomRight.get(i).getLstStyle(), mainPath);
                    countBL++;
                    cNotification.countNotification = countBL;
                    AnchorPane newApWindow = cNotification.load("Notification.fxml");
                    apMain.getChildren().add(newApWindow);
                }
            }
            for (int i = 0; i < countTP; i++) {
                lstOnpeNotiTopLeft.remove(0);
            }
            for (int i = 0; i < countTR; i++) {
                lstOnpeNotiTopRight.remove(0);
            }
            for (int i = 0; i < countBR; i++) {
                lstOnpeNotiBottomRight.remove(0);
            }
            for (int i = 0; i < countBL; i++) {
                lstOnpeNotiBottomLeft.remove(0);
            }
        } else {
            boolNot = false;
            LocalAppController.timerNotifications.cancel();
            LocalAppController.timerNotifications.purge();
        }
    }

    @Override
    public void start(Stage primaryStage) throws Exception {

    }
}
