/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.util.net;

import org.junit.Test;
import static com.sjcontable.util.net.SanJavierNet.getInstance;

/**
 *
 * @author JLimachi
 */
public class InnetTest {

    @Test
    public void validateInternet() {
        SanJavierNet net = getInstance();
        //net.isInternetReachable("http://172.16.91.107/evaAdmin/");
    }

}
