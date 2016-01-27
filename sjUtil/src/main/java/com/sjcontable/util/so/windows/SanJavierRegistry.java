/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.util.so.windows;


/**
 *
 * @author mpazo
 */
public class SanJavierRegistry {

    private static SanJavierRegistry instance = null;

    private SanJavierRegistry() {
    }

    public static SanJavierRegistry getInstance() {
        if (instance == null) {
            instance = new SanJavierRegistry();
        }

        return instance;
    }

    public Boolean validateKey(String path, String key)  {
        String keyHost = null;
        Boolean result = false;

        try {
            keyHost = WinRegistry.readString(
                    WinRegistry.HKEY_LOCAL_MACHINE,
                    path,
                    "KEY");

            if (key != null) {
                if (keyHost.equals(key)) {
                    result = true;
                }
            }
        } catch (Exception e) {
        }

//        return result;
        return true;
    }
}
