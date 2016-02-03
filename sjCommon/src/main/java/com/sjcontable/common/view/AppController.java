/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.common.view;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Locale;
import java.util.ResourceBundle;
import javafx.animation.KeyFrame;
import javafx.animation.KeyValue;
import javafx.animation.Timeline;
import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Pane;
import javafx.util.Duration;

/**
 *
 * @author josmarl
 */
public class AppController {

    protected int timeAnimation = 200;
    private Integer defaultSpeed = 200;
    protected FXMLLoader loader;
    public static WindowMain winSj;

    @FXML
    protected void openWindows(int index) throws IOException {
        Screen screen = winSj.windows[index];
        loader = new FXMLLoader(new URL(winSj.pathFxml + screen.getFxmlWindow()));
        AnchorPane newApWindow = (AnchorPane) loader.load();
        newApWindow.setPrefWidth(winSj.apMain.getWidth());
        newApWindow.setPrefHeight(winSj.apMain.getHeight());
        winSj.apMain.getChildren().setAll(newApWindow);
    }

    @FXML
    protected void openWindows(int index, String packageLang) throws IOException {
        Screen screen = winSj.windows[index];
        loader = new FXMLLoader(new URL(winSj.pathFxml + screen.getFxmlWindow()));

        if (winSj.pathLang != null) {
            loader.setResources(ResourceBundle.getBundle(packageLang, Locale.ENGLISH));
        }

        AnchorPane newApWindow = (AnchorPane) loader.load();
        newApWindow.setPrefWidth(winSj.apMain.getWidth());
        newApWindow.setPrefHeight(winSj.apMain.getHeight());
        winSj.apMain.getChildren().setAll(newApWindow);
    }

    public FXMLLoader getLoader() {
        return loader;
    }

    @FXML
    protected AnchorPane loadFxml(int index) throws MalformedURLException, IOException {
        Screen screen = winSj.windows[index];
        AnchorPane ap;
        FXMLLoader loaderx;
        loaderx = new FXMLLoader(new URL(winSj.pathFxml + screen.getFxmlWindow()));
        ap = (AnchorPane) loaderx.load();
        return ap;
    }

    @FXML
    protected void close(ActionEvent event) {
        winSj.mainStage.close();
    }

    public void animationWidth(AnchorPane apNode, Double width, Integer speed, EventHandler<ActionEvent> finalEvent) {
        Timeline tlAnimation = new Timeline();
        tlAnimation.setCycleCount(1);
        tlAnimation.setAutoReverse(false);

        KeyValue kyNewLoad = new KeyValue(apNode.prefWidthProperty(), width);
        KeyFrame kfAnimation = new KeyFrame(Duration.millis(speed), finalEvent, kyNewLoad);

        tlAnimation.getKeyFrames().add(kfAnimation);
        tlAnimation.play();
    }

    public void animationWidth(Pane apNode, Double width, Integer speed, EventHandler<ActionEvent> finalEvent) {
        Timeline tlAnimation = new Timeline();
        tlAnimation.setCycleCount(1);
        tlAnimation.setAutoReverse(false);
        KeyValue kyNewLoad = new KeyValue(apNode.prefWidthProperty(), width);
        KeyFrame kfAnimation = new KeyFrame(Duration.millis(speed), finalEvent, kyNewLoad);
        tlAnimation.getKeyFrames().add(kfAnimation);
        tlAnimation.play();
    }

    public void animationHeight(AnchorPane apNode, Double height, Integer speed) {
        Timeline tlAnimation = new Timeline();
        tlAnimation.setCycleCount(1);
        tlAnimation.setAutoReverse(false);

        KeyValue kyNewLoad = new KeyValue(apNode.prefHeightProperty(), height);
        KeyFrame kfAnimation = new KeyFrame(Duration.millis(speed), new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
            }
        }, kyNewLoad);

        tlAnimation.getKeyFrames().add(kfAnimation);
        tlAnimation.play();
    }

    public void animationHeight(Pane apNode, Double height, Integer speed) {
        Timeline tlAnimation = new Timeline();
        tlAnimation.setCycleCount(1);
        tlAnimation.setAutoReverse(false);

        KeyValue kyNewLoad = new KeyValue(apNode.prefHeightProperty(), height);
        KeyFrame kfAnimation = new KeyFrame(Duration.millis(speed), new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
            }
        }, kyNewLoad);

        tlAnimation.getKeyFrames().add(kfAnimation);
        tlAnimation.play();
    }

    public void fadeIn(Node node) {
        node.setVisible(true);
        fade(node, 1.0, defaultSpeed, null);
    }

    public void fadeOut(Node node) {
        fade(node, 0.0, defaultSpeed, null);
    }

    public void fadeIn(final Node node, Integer speed, EventHandler<ActionEvent> onFinished) {
        node.setVisible(true);
        fade(node, 1.0, speed, onFinished);
    }

    public void fadeOut(final Node node, Integer speed, EventHandler<ActionEvent> onFinished) {
        fade(node, 0.0, speed, onFinished);
    }

    public void fade(final Node node, final Double opacity, Integer speed, EventHandler<ActionEvent> onFinished) {
        Timeline tlAnimation = new Timeline();
        tlAnimation.setCycleCount(1);
        tlAnimation.setAutoReverse(false);

        if (onFinished == null) {
            onFinished = new EventHandler<ActionEvent>() {

                @Override
                public void handle(ActionEvent event) {
                    if (opacity == 0.0) {
                        node.setVisible(false);
                    }
                }
            };
        }

        final KeyValue kyNewLoad = new KeyValue(node.opacityProperty(), opacity);
        final KeyFrame kfAnimation = new KeyFrame(Duration.millis(speed), onFinished, kyNewLoad);

        tlAnimation.getKeyFrames().add(kfAnimation);
        tlAnimation.play();
    }

    public void moveY(Node node, Integer positionY, Integer speed, EventHandler<ActionEvent> onFinished) {
        Timeline tlAnimation = new Timeline();
        tlAnimation.setCycleCount(1);
        tlAnimation.setAutoReverse(false);

        final KeyValue kyNewLoad = new KeyValue(node.layoutYProperty(), positionY);
        final KeyFrame kfAnimation = new KeyFrame(Duration.millis(speed), onFinished, kyNewLoad);

        tlAnimation.getKeyFrames().add(kfAnimation);
        tlAnimation.play();
    }

    public void moveX(Node node, Integer positionX, Integer speed, EventHandler<ActionEvent> onFinished) {
        Timeline tlAnimation = new Timeline();
        tlAnimation.setCycleCount(1);
        tlAnimation.setAutoReverse(false);

        final KeyValue kyNewLoad = new KeyValue(node.layoutXProperty(), positionX);
        final KeyFrame kfAnimation = new KeyFrame(Duration.millis(speed), onFinished, kyNewLoad);

        tlAnimation.getKeyFrames().add(kfAnimation);
        tlAnimation.play();
    }

    public void counterNumber(Label lblCounter, Integer from, Integer to, Integer speed, String concat, EventHandler event) {
        IntegerProperty timeSeconds = new SimpleIntegerProperty(from);
        
        if (concat != null) {
            lblCounter.textProperty().bind(timeSeconds.asString().concat(concat));
        } else {
            lblCounter.textProperty().bind(timeSeconds.asString());
        }

        timeSeconds.set(from);
        Timeline timeline = new Timeline();
        timeline.getKeyFrames().add(
                new KeyFrame(Duration.millis(speed),
                        new KeyValue(timeSeconds, to)));
        timeline.setOnFinished(event);

        timeline.playFromStart();
    }

    public void counterNumber(Label lblCounter, Integer from, Integer to, Integer speed, EventHandler event) {
        counterNumber(lblCounter, from, to, speed, null, event);
    }

}
