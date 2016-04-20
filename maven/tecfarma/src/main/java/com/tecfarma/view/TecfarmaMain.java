package com.tecfarma.view;

import com.tecfarma.constant.AppConstant;
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
import com.fx.common.FxConstant;
import com.fx.common.view.AppController;
import com.fx.common.view.Screen;
import com.tecfarma.view.controller.LocalAppController;

/**
 *
 * @author Jose Limachi
 */
public class TecfarmaMain extends Application {

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
        FxConstant.PATH_APP = systemProperties.getProperty("user.dir");
        AppController.winFx = new WindowTecfarma();
        AppController.winFx.pathFxml = getClass().getResource("fxml/").toString();
        AppController.winFx.mainStage = this.mainStage;

        if (FxConstant.MODE_PROD) {

            Screen screen = AppController.winFx.windows[AppConstant.PAGE_LOGIN];
            FXMLLoader loader = new FXMLLoader(new URL(AppController.winFx.pathFxml + screen.getFxmlWindow()));

            AppController.winFx.apMain = (AnchorPane) loader.load();
            Scene scene = new Scene(AppController.winFx.apMain);

            AppController.winFx.mainStage.setScene(scene);

            AppController.winFx.mainStage.setOnCloseRequest(new EventHandler<WindowEvent>() {

                @Override
                public void handle(WindowEvent event) {
                    if (LocalAppController.timer != null) {
                        LocalAppController.timer.cancel();
                        LocalAppController.timer.purge();
                    }

                }
            });

            Screen screenLogin = AppController.winFx.windows[AppConstant.PAGE_LOGIN];
            FXMLLoader loaderLogin = new FXMLLoader(new URL(AppController.winFx.pathFxml + screenLogin.getFxmlWindow()));
            AnchorPane newApWindow = (AnchorPane) loaderLogin.load();

            AppController.winFx.apMain.getChildren().add(0, newApWindow);

        } else {
            Screen screenLogin = AppController.winFx.windows[AppConstant.PAGE_LOGIN];
            FXMLLoader loaderLogin = new FXMLLoader(new URL(AppController.winFx.pathFxml + screenLogin.getFxmlWindow()));
            AppController.winFx.apMain = (AnchorPane) loaderLogin.load();
            Scene scene = new Scene(AppController.winFx.apMain);
            AppController.winFx.mainStage.setScene(scene);

        }

        AppController.winFx.mainStage.setOnCloseRequest(new EventHandler<WindowEvent>() {

            @Override
            public void handle(WindowEvent event) {
                if (LocalAppController.timer != null) {
                    LocalAppController.timer.cancel();
                    LocalAppController.timer.purge();
                }
            }
        });

        AppController.winFx.mainStage.setFullScreenExitHint("");
        AppController.winFx.mainStage.setFullScreenExitKeyCombination(KeyCombination.NO_MATCH);
        AppController.winFx.mainStage.getScene().addEventFilter(MouseEvent.MOUSE_RELEASED,
                new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent event) {
                        if (event.getButton() == MouseButton.SECONDARY) {
                            event.consume();
                        }
                    }
                });
        AppController.winFx.mainStage.setFullScreen(FxConstant.MODE_PROD);
        AppController.winFx.mainStage.show();
    }
}
