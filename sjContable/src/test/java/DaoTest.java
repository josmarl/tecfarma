/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sjcontable.contable.service.FactoryService;
import com.sjcontable.model.ContElemento;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author josmarl
 */
public class DaoTest {

    public DaoTest() {
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
    public void test() {
        FactoryService fs = FactoryService.getInstance();
        List<ContElemento> list = fs.getElementoService().listElemento();
        for (ContElemento ele : list) {
            System.out.println(ele.getCuenta());
        }
    }
}
