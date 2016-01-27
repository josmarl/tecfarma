package com.sjcontable.util.so.windows.test;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.sjcontable.util.so.windows.SanJavierRegistry;
import com.sjcontable.util.so.windows.WinRegistry;

/**
 *
 * @author josmarl
 */
public class WinRegistryTest {

    public WinRegistryTest() {
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
        readKey();
//        writeKey();
    }

    public void readKey() throws Exception {
        SanJavierRegistry onpeReg = SanJavierRegistry.getInstance();
        Boolean result = onpeReg.validateKey("SOFTWARE\\ONPE\\EVA", "KEY");
        
    }

    public void writeKey() throws Exception {
        WinRegistry.createKey(WinRegistry.HKEY_CURRENT_USER, "SEA\\VER");
        WinRegistry.writeStringValue(WinRegistry.HKEY_CURRENT_USER,
                "SEA\\VER",
                "KEY",
                "hOAmUNDO");
    }
}
