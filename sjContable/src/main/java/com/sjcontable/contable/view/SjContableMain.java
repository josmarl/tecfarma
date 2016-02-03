package com.sjcontable.contable.view;

import com.sjcontable.contable.constant.AppConstant;
import java.net.URL;
import java.util.Properties;
import javafx.application.Application;
import static javafx.application.Application.launch;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.input.KeyCombination;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import com.sjcontable.common.SjConstant;
import com.sjcontable.common.view.AppController;
import com.sjcontable.common.view.Screen;
import com.sjcontable.contable.view.controller.LocalAppController;

/**
 *
 * @author Jose Limachi
 */
public class SjContableMain extends Application {

    private Properties systemProperties = new Properties(System.getProperties());
    private Stage mainStage;

    @Override
    public void start(Stage stage) throws Exception {
        this.mainStage = stage;
        LoadMainWindow();

    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }

    private void LoadMainWindow() throws Exception {
        SjConstant.PATH_APP = systemProperties.getProperty("user.dir");
        AppController.winSj = new WindowSjContable();
        AppController.winSj.pathFxml = getClass().getResource("fxml/").toString();
        AppController.winSj.mainStage = this.mainStage;

        if (SjConstant.MODE_PROD) {

            Screen screen = AppController.winSj.windows[AppConstant.PAGE_LOGIN];
            FXMLLoader loader = new FXMLLoader(new URL(AppController.winSj.pathFxml + screen.getFxmlWindow()));

            AppController.winSj.apMain = (AnchorPane) loader.load();
            Scene scene = new Scene(AppController.winSj.apMain);

            AppController.winSj.mainStage.setScene(scene);

            AppController.winSj.mainStage.setOnCloseRequest(new EventHandler<WindowEvent>() {

                @Override
                public void handle(WindowEvent event) {
                    if (LocalAppController.timer != null) {
                        LocalAppController.timer.cancel();
                        LocalAppController.timer.purge();
                    }

                }
            });

            Screen screenLogin = AppController.winSj.windows[AppConstant.PAGE_LOGIN];
            FXMLLoader loaderLogin = new FXMLLoader(new URL(AppController.winSj.pathFxml + screenLogin.getFxmlWindow()));
            AnchorPane newApWindow = (AnchorPane) loaderLogin.load();

            AppController.winSj.apMain.getChildren().add(0, newApWindow);

        } else {
            Screen screenLogin = AppController.winSj.windows[AppConstant.PAGE_LOGIN];
            FXMLLoader loaderLogin = new FXMLLoader(new URL(AppController.winSj.pathFxml + screenLogin.getFxmlWindow()));
            AppController.winSj.apMain = (AnchorPane) loaderLogin.load();
            Scene scene = new Scene(AppController.winSj.apMain);
            AppController.winSj.mainStage.setScene(scene);

        }

        AppController.winSj.mainStage.setOnCloseRequest(new EventHandler<WindowEvent>() {

            @Override
            public void handle(WindowEvent event) {
                if (LocalAppController.timer != null) {
                    LocalAppController.timer.cancel();
                    LocalAppController.timer.purge();
                }
            }
        });

        AppController.winSj.mainStage.setFullScreenExitHint("");
        AppController.winSj.mainStage.setFullScreenExitKeyCombination(KeyCombination.NO_MATCH);
        AppController.winSj.mainStage.getScene().addEventFilter(MouseEvent.MOUSE_RELEASED,
                new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent event) {
                        if (event.getButton() == MouseButton.SECONDARY) {
                            event.consume();
                        }
                    }
                });
        AppController.winSj.mainStage.setFullScreen(SjConstant.MODE_PROD);
        AppController.winSj.mainStage.show();
    }
}
