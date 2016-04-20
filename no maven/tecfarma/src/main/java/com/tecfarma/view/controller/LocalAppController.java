package com.tecfarma.view.controller;

import java.util.Timer;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.TextField;
import com.fx.common.view.AppController;

/**
 *
 * @author josmarl
 */
public class LocalAppController extends AppController {

    public static Timer timer = null;

    protected ChangeListener<String> onlySomeCharacters(String restriccion, final TextField texto, final int length) {
        final StringProperty someRestrict = new SimpleStringProperty();
        someRestrict.set(restriccion);

        ChangeListener<String> result = new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if ((someRestrict.get() != null && !someRestrict.get().equals("") && !newValue.matches(someRestrict.get() + "*")) || newValue.length() > length) {
                    texto.setText(oldValue);
                }
            }
        };
        return result;
    }

    protected ChangeListener<String> onlySomeCharacters(String restriccion, final TextField texto) {
        final StringProperty someRestrict = new SimpleStringProperty();
        someRestrict.set(restriccion);

        ChangeListener<String> result = new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if ((someRestrict.get() != null && !someRestrict.get().equals("") && !newValue.matches(someRestrict.get() + "*"))) {
                    texto.setText(oldValue);
                }
            }
        };
        return result;
    }
}
