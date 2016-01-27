package com.sjcontable.util.io.usb.test;

import java.nio.file.Path;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.sjcontable.util.io.usb.SanJavierUsb;

/**
 *
 * @author josmarl
 */
public class SanJavierUsbTest {

    public SanJavierUsbTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void main() throws Exception {
        getUsbPaths();
        getUsbPathsFastMode();
    }

    public void getUsbPaths() throws Exception {
        SanJavierUsb onpeUsb = SanJavierUsb.getInstance();

        List<Path> lstPaths = onpeUsb.getUsbPaths();
      
    }

    public void getUsbPathsFastMode() throws Exception {
        SanJavierUsb onpeUsb = SanJavierUsb.getInstance();

        List<Path> lstPaths = onpeUsb.getUsbPathsFastMode();
        
    }
}
