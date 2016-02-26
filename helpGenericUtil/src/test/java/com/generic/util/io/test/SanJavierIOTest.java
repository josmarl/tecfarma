package com.generic.util.io.test;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import net.lingala.zip4j.core.ZipFile;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.generic.util.io.GenericIO;

/**
 *
 * @author josmarl
 */
public class SanJavierIOTest {

    private GenericIO onpeIO;
    private String mainPath = "D:\\__Proyectos\\EVA\\02_Proceso_de_Desarrollo\\10_Fuentes\\EVA_Nacion\\evaInstaller\\data\\";

    public SanJavierIOTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        onpeIO = GenericIO.getInstance();
    }

    @After
    public void tearDown() {
    }

    @Test
    public void main() throws Exception {
        /*
         formatUnid();
         cleanDirectory();
         writeFile();
         copyFile();
         writeLog();
         zip();
         addToZip();
         unzip();
         print();
         */
    }

    public void print() throws Exception {
        File oFile = new File("D:\\LISTA DE CONFIRMACIÓN DE PUESTA A CERO DEL PROCESO DE SELECCIÓN DE LOS 25 CANDIDATOS AL CARGO DE MIEMBROS DE MESA.pdf");
        onpeIO.seamlessPdfPrint(oFile);
    }

    public void unzip() throws Exception {
        File zFile = new File("data.zip");

        ZipFile zipFile = new ZipFile(zFile);
        zipFile.setPassword("123");
        zipFile.extractAll("data");
    }

    public void zip() throws Exception {
        Path mongo = Paths.get(mainPath + "db");
        Path db = Paths.get(mainPath + "mongo");
        File zip = new File(mainPath + "data.zip");
        String pass = "123";

        onpeIO.zipDirectories(zip, pass, mongo, db);

        File eva = new File(mainPath + "EVA.exe");
        File evaLauncher = new File(mainPath + "EVA_LAUNCHER.exe");

        onpeIO.addFilesToZip(zip, pass, eva, evaLauncher);
    }

    public void addToZip() throws Exception {
        Path db = Paths.get("mongo2");
        File zip = new File("data.zip");
        String pass = "123";

        onpeIO.addFolderToZip(zip, pass, db);
    }

    public void formatUnid() throws Exception {
        onpeIO.formatUnid(Paths.get("E:\\"), "EVA");
    }

    public void cleanDirectory() throws Exception {
        onpeIO.cleanDirectory(new File("E:\\"));
    }

    public void writeFile() throws Exception {
        File oFile = new File("E:\\hola\\mundo\\text.txt");
        String data = "hola mundo test";

        onpeIO.writeFile(data, oFile);
    }

    public void copyFile() throws Exception {
        File fromFile = new File("D:\\__Proyectos\\Propuesta v1.0.pdf");
        File toFile = new File("E:\\hola\\mundo\\text.pdf");

        onpeIO.copyFile(fromFile, toFile, true);
    }

    public void writeLog() throws Exception {
        File file = new File("D:\\Log.txt");
        onpeIO.writeLog("log 1", file);
    }
}
