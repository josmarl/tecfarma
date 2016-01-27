package com.sjcontable.util.object.test;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.sjcontable.util.object.SanJavierCalendar;

/**
 *
 * @author josmarl
 */
public class DateTimeTest {

    public DateTimeTest() {
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
        stringToDate();
    }

    public void stringToDate() throws Exception {

        SanJavierCalendar cal = SanJavierCalendar.getInstance();
        String date = cal.toString("dd/MM/yyyy HH:mm:ss");        
    }
}
