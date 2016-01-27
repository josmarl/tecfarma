package com.sjcontable.util.io;

import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import static java.nio.file.StandardOpenOption.APPEND;
import static java.nio.file.StandardOpenOption.CREATE;
import static java.nio.file.StandardOpenOption.WRITE;
import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;
import org.apache.pdfbox.pdmodel.PDDocument;
import com.sjcontable.util.object.SanJavierCalendar;

/**
 *
 * @author Miguel Rodrigo Pazo Sánchez (http://miguelpazo.com/)
 */
public class SanJavierIO {

    private static SanJavierIO instance;

    private SanJavierIO() {
    }

    /**
     * Return a instance of OpenIO class.
     *
     * @return a instance of OpenIO
     */
    public static SanJavierIO getInstance() {
        if (instance == null) {
            instance = new SanJavierIO();
        }

        return instance;
    }

    /**
     * Only accept pdf files
     *
     * @param pdf PDF File
     * @throws IOException
     * @throws PrinterException
     */
    public void seamlessPdfPrint(File pdf) throws IOException, PrinterException {
        PDDocument document = PDDocument.load(pdf);
        PrinterJob printJob = PrinterJob.getPrinterJob();

        PageFormat pf = new PageFormat();
        pf.setOrientation(PageFormat.PORTRAIT);
        Paper paper = new Paper();
        paper.setSize(595, 842);
        paper.setImageableArea(43, 43, 509, 756);

        pf.setPaper(paper);
        printJob.validatePage(pf);
        printJob.setPrintable(null, pf);

        printJob.setJobName(pdf.getName());

        document.silentPrint(printJob);
    }

    public String readFileAsString(File filePath) throws java.io.IOException {
        StringBuffer fileData = new StringBuffer(1000);
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        char[] buf = new char[1024];
        int numRead = 0;

        while ((numRead = reader.read(buf)) != -1) {
            String readData = String.valueOf(buf, 0, numRead);
            fileData.append(readData);
            buf = new char[1024];
        }
        reader.close();

        return fileData.toString();
    }

    // StringBuilder with char[] buffer
    // + works if filesize is unknown
    // + pretty fast 
    public String readFile(String filePath) throws IOException {
        Reader reader = new FileReader(filePath);
        StringBuilder sb = new StringBuilder();
        char buffer[] = new char[16384];  // read 16k blocks
        int len; // how much content was read? 
        while ((len = reader.read(buffer)) > 0) {
            sb.append(buffer, 0, len);
        }
        reader.close();
        return sb.toString();
    }

    public void addFolderToZip(File zipFile, String pass, Path... directories) throws ZipException {
        ZipFile zipFileFinal = new ZipFile(zipFile);

        ZipParameters parameters = new ZipParameters();
        parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE); // set compression method to deflate compression
        parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
        parameters.setEncryptFiles(true);
        parameters.setEncryptionMethod(Zip4jConstants.ENC_METHOD_AES);
        parameters.setAesKeyStrength(Zip4jConstants.AES_STRENGTH_256);

        if (pass != null) {
            parameters.setPassword(pass);
        }

        for (Path directory : directories) {
            zipFileFinal.addFolder(directory.toString(), parameters);
        }
    }

    public void zipDirectories(File zipFile, String pass, Path... directories) throws ZipException {
        if (zipFile.exists()) {
            zipFile.delete();
        }

        addFolderToZip(zipFile, pass, directories);
    }

    public void addFilesToZip(File zipFile, String pass, File... files) throws ZipException {
        ZipFile zipFileFinal = new ZipFile(zipFile);

        ZipParameters parameters = new ZipParameters();
        parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE); // set compression method to deflate compression
        parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
        parameters.setEncryptFiles(true);
        parameters.setEncryptionMethod(Zip4jConstants.ENC_METHOD_AES);
        parameters.setAesKeyStrength(Zip4jConstants.AES_STRENGTH_256);

        if (pass != null) {
            parameters.setPassword(pass);
        }

        for (File file : files) {
            zipFileFinal.addFile(file, parameters);
        }
    }

    public void extractZip(File zipFile, String pass, Path... directories) throws ZipException {

        ZipFile zipFileFinal = new ZipFile(zipFile);

        if (zipFile.exists()) {
            zipFileFinal.setPassword(pass);
            for (Path file : directories) {
                zipFileFinal.extractAll(file.toString());
            }
        }
    }

    /**
     * Write a log file with a string and auto added a date and time of this
     * registry. If the log file exists then this function only add a new line
     * to the file.
     *
     * @param log Log data to want to save.
     * @param file File where have want to save the log.
     * @throws Exception Error if the file can't open or write.
     */
    public void writeLog(String log, File file) throws Exception {
        FileWriter fichero = null;
        PrintWriter pw = null;
        SanJavierCalendar calendar = SanJavierCalendar.getInstance();

        try {
            fichero = new FileWriter(file.getPath(), true);
            pw = new PrintWriter(fichero);
            pw.println("[" + calendar.toString("dd/mm/yyyy hh:mm") + "] " + log);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fichero != null) {
                fichero.close();
            }
            try {
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    /**
     *
     *
     * @param fromFile File from copy.
     * @param toFile File to copy.
     * @param replace True if you want replace the original file, false do not.
     * @throws Exception
     */
    public void copyFile(File fromFile, File toFile, boolean replace) throws Exception {
        Path pFrom = Paths.get(fromFile.toString());
        Path pTo = Paths.get(toFile.toString());
        File path = new File(pTo.getParent().toString());

        if (!path.exists()) {
            path.mkdirs();
        }

        CopyOption[] options = null;

        if (replace) {
            options = new CopyOption[]{
                StandardCopyOption.REPLACE_EXISTING,
                StandardCopyOption.COPY_ATTRIBUTES
            };
        } else {
            options = new CopyOption[]{
                StandardCopyOption.COPY_ATTRIBUTES
            };
        }

        Files.copy(pFrom, pTo, options);
    }

    /**
     * If the directory do not exist, then this function create the directory
     *
     * @param data Data to enter into the file
     * @param oFile File name
     * @throws IOException
     */
    public void writeFile(String data, File oFile) throws IOException {
        Path pathFile = Paths.get(oFile.toString());
        File path = new File(pathFile.getParent().toString());

        if (!path.exists()) {
            path.mkdirs();
        }

        FileWriter fw = new FileWriter(oFile.getAbsoluteFile());
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write(data);
        bw.close();
    }

    /**
     *
     * @param fromPath Path from copy data
     * @param toPath Path to copy data
     * @param options Option to copy
     * @throws IOException
     */
    public void directoryCopy(Path fromPath, Path toPath, CopyOption[] options) throws IOException {
        File oToPath = new File(toPath.toString());

        if (!oToPath.exists()) {
            oToPath.mkdir();
        }

        File oFromPath = new File(fromPath.toString());

        File[] contentPath = oFromPath.listFiles();

        for (int i = 0; i < contentPath.length; i++) {
            if (contentPath[i].isFile()) {
                Files.copy(Paths.get(fromPath.toString() + "\\" + contentPath[i].getName()), Paths.get(toPath.toString() + "\\" + contentPath[i].getName()), options);
            } else {
                directoryCopy(Paths.get(fromPath.toString() + "\\" + contentPath[i].getName()),
                        Paths.get(toPath.toString() + "\\" + contentPath[i].getName()), options);
            }
        }
    }

    /**
     *
     * @param fromPath Path from copy data
     * @param toPath Path to copy data
     * @throws IOException
     */
    public void directoryCopy(Path fromPath, Path toPath) throws IOException {
        CopyOption[] options = new CopyOption[]{
            StandardCopyOption.REPLACE_EXISTING,
            StandardCopyOption.COPY_ATTRIBUTES
        };

        directoryCopy(fromPath, toPath, options);
    }

    /**
     * This function only clean the input directory (not format). Is slower.
     *
     * @param directory Path to clean
     * @throws Exception
     */
    public void cleanDirectory(File directory) throws Exception {
        File[] ficheros = directory.listFiles();

        if (ficheros != null) {
            for (int i = 0; i < ficheros.length; i++) {
                if (ficheros[i].isDirectory()) {
                    cleanDirectory(ficheros[i]);
                }

                ficheros[i].delete();
            }
        }
    }

    public void deleteDirectory(Path directory) throws Exception {
        if (directory.toFile().exists()) {
            cleanDirectory(directory.toFile());

            directory.toFile().delete();
        }
    }

    /**
     * This function format the input unid
     *
     * @param oUnid Unid to format
     * @param nameVolume New name of volume
     * @throws Exception
     */
    public void formatUnid(Path oUnid, String nameVolume) throws Exception {
        String systemFile = "exFAT";
        formatUnid(oUnid, nameVolume, systemFile);
    }

    /**
     * This function format the input unid
     *
     * @param oUnid Unid to format
     * @param nameVolume New name of volume
     * @param systemFile File system to format unid
     * @throws Exception
     */
    public void formatUnid(Path oUnid, String nameVolume, String systemFile) throws Exception {
        String unid = oUnid.toString().substring(0, 1);
        String command = "format " + unid + ": /q /y /fs:" + systemFile + " /v:" + nameVolume;
        execCommand(command);
    }

    public Boolean execCommand(String command) throws IOException {
        ProcessBuilder builder = new ProcessBuilder(
                "cmd.exe", "/c", command);
        builder.redirectErrorStream(true);
        Process p = builder.start();
        BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
        Boolean success = true;
        String line;

        while (true) {
            line = r.readLine();            
            if (line == null) {
                break;
            } else {
                if (line.contains("error") || line.contains("EXP-00019") || line.contains("EXP-00000")) {
                    success = false;
                }
            }
        }

        return success;
    }

    public void excuteCommand(String[] cmd) throws IOException {
        ProcessBuilder pb = new ProcessBuilder(cmd);
        Process p = pb.start();
        BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String s = null;
        while ((s = stdInput.readLine()) != null) {
            
        }
    }

    public void excuteCommand(String[] cmd, File directory) throws IOException {
        ProcessBuilder pb = new ProcessBuilder(cmd);
        pb.directory(directory);
        pb.redirectErrorStream(true);
        Process p = pb.start();
        BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String s = null;
        while ((s = stdInput.readLine()) != null) {
            
        }
    }

    public void writteFile(String strData, String pathFile) {
        // Convert the string to a
        // byte array.
        String s = strData;
        byte data[] = s.getBytes();
        Path p = Paths.get(pathFile);

        try (OutputStream out = new BufferedOutputStream(
                Files.newOutputStream(p, CREATE, APPEND, WRITE))) {
            out.write(data, 0, data.length);
        } catch (IOException x) {
            System.err.println(x);
        }

    }

    public void garbageCollector() {
        Runtime r = Runtime.getRuntime();
        r.gc();        
    }

    public long freeMemoryJvm() {
        return Runtime.getRuntime().freeMemory();
    }

}
