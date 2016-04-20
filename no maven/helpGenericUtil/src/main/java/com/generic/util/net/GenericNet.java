/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.generic.util.net;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.UnknownHostException;

/**
 *
 * @author JLimachi
 */
public class GenericNet {

    private GenericNet() {
    }

    public static GenericNet getInstance() {
        return OnpeNetHolder.INSTANCE;
    }

    private static class OnpeNetHolder {

        private static final GenericNet INSTANCE = new GenericNet();
    }

    public boolean isInternetReachable(String UrlStr) {
        try {
            //make a URL to a known source
            URL url = new URL(UrlStr);
            //open a connection to that source
            HttpURLConnection urlConnect = (HttpURLConnection) url.openConnection();
            //trying to retrieve data from the source. If there
            //is no connection, this line will fail
            Object objData = urlConnect.getContent();                        

        } catch (UnknownHostException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        return true;
    }

}
