/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crypto.util.crypto.test;

import crypto.util.encription.Crypto;
import org.bouncycastle.crypto.CryptoException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author jlimachi
 */
public class CrytoTest {

    public CrytoTest() {
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
    public void Encriptar() throws CryptoException {

        Crypto crypto = Crypto.getInstance("");
        String data = "jjdbc:oracle:thin:EVA_VECINAL/EVA_VECINAL@192.168.49.149:1521:BDD3S4";
        String dataEncrypt = crypto.encrypt(data);
        System.out.println(dataEncrypt);
        System.out.println(crypto.decrypt(dataEncrypt));

    }

    public static void main(String[] args) throws CryptoException {

        Crypto crypto = Crypto.getInstance("");
//        String data = "[{\"id\":2,\"idCarga\":59,\"scope\":\"J30001\",\"scopeAlias\":\"LIMA\",\"type\":2,\"stAlias\":\"ODPE\",\"numSort\":0,\"address\":null,\"timeBegin\":\"18:29:19\",\"timeClose\":\"18:29:19\",\"phone\":null,\"status\":1,\"numElec\":0,\"idEleccion\":1,\"eleccion\":\"ELECCIONES MUNICIPALES 2015\",\"eleccionDesc\":\"ELECCIONES MUNICIPALES 2015\",\"puestaCero\":38,\"proceso\":\"ELECCIONES MUNICIPALES 2015\",\"webService\":\"http://172.16.91.74/evaWebService/\",\"audDateMod\":0,\"audUserMod\":22,\"centroComputo\":\"C30001\"}]";
//        String dataEncrypt = crypto.encrypt(data);
//        System.out.println(dataEncrypt);
                
        System.out.println(crypto.decrypt("pVH2pz5G9Tp52vadkgwQcOskrvowEQayG4aiX5GXfG/+UwjTvHrJ4jBc+IPjCXpETjdOe/1ivGqind3CYVNlgr8sGr/VDm2IpjSfAXpB0VE="));               
               
    }
}
