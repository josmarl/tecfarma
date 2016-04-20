/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fx.animations.buttons;

import javafx.event.EventType;
import javafx.geometry.Point3D;
import javafx.scene.Node;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 *
 * @author jlimachi
 */
public class ActionMethods {

    /**
     * All static variables for ActionMethods Class.
     */
    public static ActionMethods instance;
    public static final int TYPE_2D = 2;
    public static final int TYPE_3D = 3;
    public static final String TYPE_MINIMIZE = "minimize";
    public static final String TYPE_MAXIMIZE = "maximize";
    public static final String TYPE_CLOSE = "close";
    public static final boolean ENABLE_AUTOREVERSE = true;
    public static final boolean DISABLE_AUTOREVERSE = false;
    public static final boolean ENABLE_ROTATION = true;
    public static final boolean DISABLE_ROTATION = false;
    public static double NORMAL_ESCALE = 1.0;
    public static double NORMAL_ESCALE_TO_HOVER = 1.15;
    private Stage stage;
    public static final Point3D X_AXIS = new Point3D(1, 0, 0);
    public static final Point3D Y_AXIS = new Point3D(0, 1, 0);

    /**
     * It is The class contructor
     */
    private ActionMethods() {
    }

    /**
     * This is a singleton patron for ActionMethods Class.
     *
     * @return a instance ActionMethods
     */
    public static ActionMethods getInstance() {
        if (instance == null) {
            instance = new ActionMethods();
        }
        return instance;
    }

    public void actionPageButtonCorner(Node node, String typeAction) throws Exception {
        if (stage == null) {
            throw new Exception("The stage is not instanced");
        }
        node.setOnMouseClicked(new EventHandlerImpl(node, stage, typeAction));
    }

    public void actionRotationImage3D(Node node, Point3D axis) throws Exception {
        if (stage == null) {
            throw new Exception("The stage is not instanced");
        }
        WindowEvent event = new WindowEvent(stage, EventType.ROOT);
        new EventHandlerImpl().createRotator3D(event, node, axis);
    }

    public void actionPageButtonCorner(Node node, boolean isRotate, int typeD, String typeAction, boolean autoreverse, double escala) throws Exception {
        if (stage == null) {
            throw new Exception("The stage is not instanced");
        }

        if (autoreverse == true) {
            node.setOnMouseEntered(new EventHandlerImpl(isRotate, typeD, node, escala));
            node.setOnMouseExited(new EventHandlerImpl(isRotate, typeD, node, escala));
            node.setOnMouseClicked(new EventHandlerImpl(isRotate, typeD, node, stage, typeAction, escala));
        } else {
            node.setOnMouseEntered(new EventHandlerImpl(isRotate, typeD, node, escala));
            node.setOnMouseClicked(new EventHandlerImpl(isRotate, typeD, node, stage, typeAction, escala));
        }
    }

    public void actionPageButtonCorner(Node node, boolean isRotate, int typeD, String typeAction, boolean autoreverse) throws Exception {
        actionPageButtonCorner(node, isRotate, typeD, typeAction, autoreverse, NORMAL_ESCALE_TO_HOVER);
    }

    public void actionButtonHover(Node node, boolean isRotate, int typeD, boolean autoreverse, double escala) {
        if (autoreverse == true) {
            node.setOnMouseEntered(new EventHandlerImpl(isRotate, typeD, node, escala));
            node.setOnMouseExited(new EventHandlerImpl(isRotate, typeD, node, escala));
        } else {
            node.setOnMouseEntered(new EventHandlerImpl(isRotate, typeD, node, escala));
        }
    }

    public void actionButtonHover(Node node, boolean isRotate, int typeD, boolean autoreverse) {
        actionButtonHover(node, isRotate, typeD, autoreverse, NORMAL_ESCALE_TO_HOVER);
    }

    public Stage getStage() {
        return stage;
    }

    public void setStage(Stage stage) {
        this.stage = stage;
    }
}
