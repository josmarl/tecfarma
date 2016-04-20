/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.generic.util.net;

import com.generic.util.net.GenericNet;
import org.junit.Test;
import static com.generic.util.net.GenericNet.getInstance;

/**
 *
 * @author JLimachi
 */
public class InnetTest {

    @Test
    public void validateInternet() {
        GenericNet net = getInstance();
        //net.isInternetReachable("http://172.16.91.107/evaAdmin/");
    }

}
