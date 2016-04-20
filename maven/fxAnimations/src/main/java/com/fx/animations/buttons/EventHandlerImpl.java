/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fx.animations.buttons;

import java.io.IOException;
import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.KeyValue;
import javafx.animation.RotateTransition;
import javafx.animation.Timeline;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Point3D;
import javafx.scene.Node;
import javafx.scene.input.MouseEvent;
import javafx.scene.transform.Rotate;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.util.Duration;
/**
 *
 * @author jlimachi
 */
public class EventHandlerImpl implements EventHandler {

    private boolean isRotate;
    private int typeD;
    private Stage stage;
    private String typeCorner;
    private Node node;
    private double escala;
    private Timeline timeline;

    public EventHandlerImpl() {

    }

    public EventHandlerImpl(boolean isRotate, int typeD, Node node, double escala) {
        this.isRotate = isRotate;
        this.typeD = typeD;
        this.node = node;
        this.escala = escala;
    }

    public EventHandlerImpl(Node node, Stage stageP, double escala) {
        this.node = node;
        this.stage = stageP;
        this.escala = escala;
    }

    public EventHandlerImpl(boolean isRotate, int typeD, Node node, Stage stageP, String typeCorner, double escala) {
        this.isRotate = isRotate;
        this.typeD = typeD;
        this.node = node;
        this.stage = stageP;
        this.typeCorner = typeCorner;
        this.escala = escala;
    }

    public EventHandlerImpl(Node node, Stage stage, String typeAction) {
        this.node = node;
        this.stage = stage;
        this.typeCorner = typeAction;
    }

    /**
     * The principal void method to use It controls all events requested by
     * ActionMethods Class.
     *
     * @param event
     */
    @Override
    public void handle(Event event) {
        if (event.getEventType().toString().equals(MouseEvent.MOUSE_ENTERED.getName())) {
            if (isRotate) {
                if (typeD == ActionMethods.TYPE_2D) {
                    createIncreaseWithRotation2D(event, node);
                }
                if (typeD == ActionMethods.TYPE_3D) {
                    createIncreaseWithRotation3D(event, node);
                }
            } else {
                if (typeD == ActionMethods.TYPE_2D) {
                    createIncreaseWithoutRotation2D(event, node);
                }
                if (typeD == ActionMethods.TYPE_3D) {
                    createIncreaseWithoutRotation3D(event, node);
                }
            }
        }
        if (event.getEventType().toString().equals(MouseEvent.MOUSE_EXITED.getName())) {
            if (isRotate) {
                if (typeD == ActionMethods.TYPE_2D) {
                    createDecreaseWithRotation2D(event, node);
                }
                if (typeD == ActionMethods.TYPE_3D) {
                    createDecreaseWithRotation3D(event, node);
                }
            } else {
                if (typeD == ActionMethods.TYPE_2D) {
                    createDecreaseWithoutRotation2D(event, node);
                }
                if (typeD == ActionMethods.TYPE_3D) {
                    createDecreaseWithoutRotation3D(event, node);
                }
            }
        }
        if (event.getEventType().toString().equals(MouseEvent.MOUSE_CLICKED.getName())) {
            if (typeCorner.equals(ActionMethods.TYPE_MINIMIZE)) {
                createMinimizeStage(event, stage);
            }
            if (typeCorner.equals(ActionMethods.TYPE_MAXIMIZE)) {
                createMaximizeStage(event, stage);
            }
            if (typeCorner.equals(ActionMethods.TYPE_CLOSE)) {
                createCloseStage(event, stage);
            }
        }
    }

    /**
     * This method reponses the peticion of 3D rotation
     *
     * @param windowEvent
     * @throws IOException
     */
    public void handle(WindowEvent windowEvent) throws IOException {
        if (windowEvent.getEventType().toString().equals(WindowEvent.WINDOW_SHOWING.getName())) {
            createRotator3D(windowEvent, node);
        } else {
            createRotator3D(windowEvent, node);
        }

    }

    /**
     * This method increases a node with a circular rotation in 2D and recevied
     * any javafx event.
     *
     * @param event
     * @param node
     */
    public void createIncreaseWithRotation2D(Event event, Node node) {
        //create a timeline for moving the circle
        timeline = new Timeline();
        timeline.setCycleCount(1);
        //You can add a specific action when each frame is started.
        //create a keyValue with factory: scaling the circle 1time
        KeyValue keyValueScaleX = new KeyValue(node.scaleXProperty(), escala);
        KeyValue keyValueScaleY = new KeyValue(node.scaleYProperty(), escala);
        KeyValue keyValueCircleRotation = new KeyValue(node.rotateProperty(), 90);
        //create a keyFrame, the keyValue is reached at time 0.15s
        Duration duration = Duration.millis(150);
        KeyFrame keyFrame = new KeyFrame(duration, keyValueScaleX, keyValueScaleY, keyValueCircleRotation);
        //add the keyframe to the timeline
        timeline.getKeyFrames().add(keyFrame);
        timeline.play();
    }

    /**
     * This method increases a node with a circular rotation in 3D and recevied
     * any javafx event
     *
     * @param event
     * @param node
     */
    public void createIncreaseWithRotation3D(Event event, Node node) {
        //create a timeline for moving the circle
        timeline = new Timeline();
        timeline.setCycleCount(1);

        //You can rotate in 3D that node
        RotateTransition rotator = new RotateTransition(Duration.millis(300), node);
        rotator.setAxis(Rotate.Y_AXIS);

        rotator.setToAngle(180);
        rotator.setInterpolator(Interpolator.EASE_OUT);
        rotator.setCycleCount(1);

        //You can add a specific action when each frame is started.
        //create a keyValue with factory: scaling the circle 1time
        KeyValue keyValueScaleX = new KeyValue(node.scaleXProperty(), escala);
        KeyValue keyValueScaleY = new KeyValue(node.scaleYProperty(), escala);
        KeyValue keyValueCircleRotation = new KeyValue(node.rotationAxisProperty(), rotator.getAxis());
        //create a keyFrame, the keyValue is reached at time 0.15s
        Duration duration = Duration.millis(150);
        KeyFrame keyFrame = new KeyFrame(duration, keyValueScaleX, keyValueScaleY, keyValueCircleRotation);
        //add the keyframe to the timeline
        rotator.play();
        timeline.getKeyFrames().add(keyFrame);
        timeline.play();
    }

    /**
     * This method decreases a node with a circular rotation in 2D and recevied
     * any javafx event
     *
     * @param event
     * @param node
     */
    public void createDecreaseWithRotation2D(Event event, Node node) {
        //create a timeline for moving the circle
        timeline = new Timeline();
        timeline.setCycleCount(1);
        //You can add a specific action when each frame is started.
        //create a keyValue with factory: scaling the circle 1time
        KeyValue keyValueScaleX = new KeyValue(node.scaleXProperty(), ActionMethods.NORMAL_ESCALE);
        KeyValue keyValueScaleY = new KeyValue(node.scaleYProperty(), ActionMethods.NORMAL_ESCALE);
        KeyValue keyValueCircleRotation = new KeyValue(node.rotateProperty(), -90);
        //create a keyFrame, the keyValue is reached at time 0.15s
        Duration duration = Duration.millis(150);
        KeyFrame keyFrame = new KeyFrame(duration, keyValueScaleX, keyValueScaleY, keyValueCircleRotation);
        //add the keyframe to the timeline
        timeline.getKeyFrames().add(keyFrame);
        timeline.play();
    }

    /**
     * This method decreases a node with a circular rotation in 3D and recevied
     * any javafx event
     *
     * @param event
     * @param node
     */
    public void createDecreaseWithRotation3D(Event event, Node node) {
        //create a timeline for moving the circle
        timeline = new Timeline();
        timeline.setCycleCount(1);

        //You can rotate in 3D that node
        RotateTransition rotator = new RotateTransition(Duration.millis(300), node);
        rotator.setAxis(Rotate.Y_AXIS);
        rotator.setToAngle(-180);
        rotator.setInterpolator(Interpolator.EASE_OUT);
        rotator.setCycleCount(1);

        //You can add a specific action when each frame is started.
        //create a keyValue with factory: scaling the circle 1time
        KeyValue keyValueScaleX = new KeyValue(node.scaleXProperty(), ActionMethods.NORMAL_ESCALE);
        KeyValue keyValueScaleY = new KeyValue(node.scaleYProperty(), ActionMethods.NORMAL_ESCALE);
        KeyValue keyValueCircleRotation = new KeyValue(node.rotationAxisProperty(), rotator.getAxis());
        //create a keyFrame, the keyValue is reached at time 0.15s
        Duration duration = Duration.millis(150);
        KeyFrame keyFrame = new KeyFrame(duration, keyValueScaleX, keyValueScaleY, keyValueCircleRotation);
        //add the keyframe to the timeline
        rotator.play();
        timeline.getKeyFrames().add(keyFrame);
        timeline.play();

    }

    /**
     * This method decreases a node withouth rotation and recevied any javafx
     * event
     *
     * @param event
     * @param node
     */
    public void createIncreaseWithoutRotation2D(Event event, Node node) {
        //create a timeline for moving the circle
        timeline = new Timeline();
        timeline.setCycleCount(1);
        //You can add a specific action when each frame is started.
        //create a keyValue with factory: scaling the circle 1time
        KeyValue keyValueScaleX = new KeyValue(node.scaleXProperty(), escala);
        KeyValue keyValueScaleY = new KeyValue(node.scaleYProperty(), escala);
        //create a keyFrame, the keyValue is reached at time 0.15s
        Duration duration = Duration.millis(150);
        KeyFrame keyFrame = new KeyFrame(duration, keyValueScaleX, keyValueScaleY);
        //add the keyframe to the timeline
        timeline.getKeyFrames().add(keyFrame);
        timeline.play();
    }

    /**
     * This method decreases a node withouth rotation and recevied any javafx
     * event
     *
     * @param event
     * @param node
     */
    public void createIncreaseWithoutRotation3D(Event event, Node node) {
        //create a timeline for moving the circle
        timeline = new Timeline();
        timeline.setCycleCount(1);

        //You can add a specific action when each frame is started.
        //create a keyValue with factory: scaling the circle 1time
        KeyValue keyValueScaleX = new KeyValue(node.scaleXProperty(), escala);
        KeyValue keyValueScaleY = new KeyValue(node.scaleYProperty(), escala);
        //create a keyFrame, the keyValue is reached at time 0.15s
        Duration duration = Duration.millis(150);
        KeyFrame keyFrame = new KeyFrame(duration, keyValueScaleX, keyValueScaleY);
        //add the keyframe to the timeline
        timeline.getKeyFrames().add(keyFrame);
        timeline.play();
    }

    /**
     * This method decreases a node withouth rotation and recevied any javafx
     * event
     *
     * @param event
     * @param node
     */
    public void createDecreaseWithoutRotation2D(Event event, Node node) {
        //create a timeline for moving the circle
        timeline = new Timeline();
        timeline.setCycleCount(1);
        //You can add a specific action when each frame is started.
        //create a keyValue with factory: scaling the circle 1time
        KeyValue keyValueScaleX = new KeyValue(node.scaleXProperty(), ActionMethods.NORMAL_ESCALE);
        KeyValue keyValueScaleY = new KeyValue(node.scaleYProperty(), ActionMethods.NORMAL_ESCALE);
        //create a keyFrame, the keyValue is reached at time 0.15s
        Duration duration = Duration.millis(150);
        KeyFrame keyFrame = new KeyFrame(duration, keyValueScaleX, keyValueScaleY);
        //add the keyframe to the timeline
        timeline.getKeyFrames().add(keyFrame);
        timeline.play();
    }

    /**
     * This method decreases a node withouth rotation and recevied any javafx
     * event
     *
     * @param event
     * @param node
     */
    public void createDecreaseWithoutRotation3D(Event event, Node node) {
        //create a timeline for moving the circle
        timeline = new Timeline();
        timeline.setCycleCount(1);

        //You can add a specific action when each frame is started.
        //create a keyValue with factory: scaling the circle 1time
        KeyValue keyValueScaleX = new KeyValue(node.scaleXProperty(), ActionMethods.NORMAL_ESCALE);
        KeyValue keyValueScaleY = new KeyValue(node.scaleYProperty(), ActionMethods.NORMAL_ESCALE);
        //create a keyFrame, the keyValue is reached at time 0.15s
        Duration duration = Duration.millis(150);
        KeyFrame keyFrame = new KeyFrame(duration, keyValueScaleX, keyValueScaleY);
        //add the keyframe to the timeline
        timeline.getKeyFrames().add(keyFrame);
        timeline.play();
    }

    public void createRotator3D(Event event, Node node) {
        RotateTransition rotator = new RotateTransition(Duration.millis(300), node);
        rotator.setAxis(Rotate.Y_AXIS);
        rotator.setToAngle(30);
        rotator.setInterpolator(Interpolator.EASE_OUT);
        rotator.setCycleCount(10);
        rotator.setAutoReverse(true);
        rotator.play();
    }

    public void createRotator3D(Event event, Node node, Point3D axis) {
        RotateTransition rotator = new RotateTransition(Duration.millis(300), node);
        rotator.setAxis(axis);
        rotator.setToAngle(30);
        rotator.setInterpolator(Interpolator.EASE_OUT);
        rotator.setCycleCount(10);
        rotator.setAutoReverse(true);
        rotator.play();
    }
    
    /**
     * This method minimizes any stage
     *
     * @param event
     * @param stage
     */
    public void createMinimizeStage(Event event, Stage stage) {
        stage.setIconified(true);
    }

    /**
     * This method maximizes any stage
     *
     * @param event
     * @param stage
     */
    public void createMaximizeStage(Event event, Stage stage) {
        stage.setMaximized(true);
    }

    /**
     * This method closes any stage
     *
     * @param event
     * @param stage
     */
    public void createCloseStage(Event event, Stage stage) {
        stage.close();
    }

}
