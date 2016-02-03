/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.animations;

/**
 *
 * @author aquispec
 */
public class SjMessagesTypes {

    public static final int TYPE_SUCCESS = 1;
    public static final int TYPE_ERROR = 2;
    public static final int TYPE_INFORMATION = 3;
    public static final int TYPE_CONFIRMATION = 4;

    public static final int POSITION_TOPLEFT = 1;
    public static final int POSITION_TOPRIGHT = 2;
    public static final int POSITION_BOTTOMRIGHT = 3;
    public static final int POSITION_BOTTOMLEFT = 4;

    public static final int OPCION_YES_NO = 1;
    public static final int OPCION_ACCEPT_CANCEL = 2;

    public static String getTitle(Integer id) {
        switch (id) {
            case TYPE_SUCCESS:
                return "INFORMACIÓN";
            case TYPE_ERROR:
                return "ATENCIÓN";
            case TYPE_INFORMATION:
                return "INFORMACIÓN";
            case TYPE_CONFIRMATION:
                return "CONFIRMACIÓN";
        }
        
        return null;
    }
}
