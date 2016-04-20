package com.generic.util.io;

import static com.generic.util.io.constants.IOConstants.MESSAGERROREXPORTAR;
import static com.generic.util.io.constants.IOConstants.PASSWORT;
import static com.generic.util.io.constants.IOConstants.TIPOLETRA;
import static com.generic.util.io.constants.IOConstants.URLIEXPORTTEMPORAL;
import static com.generic.util.io.constants.IOConstants.URLIMPORTSECURY;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import org.apache.poi.hssf.record.crypto.Biff8EncryptionKey;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;

public class ExcelGenerator {

    // Excel work book
    private HSSFWorkbook workbook;

    // Fonts
    private HSSFFont headerFont;
    private HSSFFont contentFont;

    // Styles
    private HSSFCellStyle headerStyle;
    private HSSFCellStyle oddRowStyle;
    private HSSFCellStyle evenRowStyle;

    // Integer to store the index of the next row
    private int rowIndex;

    /**
     * Make a new excel workbook with sheet that contains a stylized table
     *
     * @param cabecera
     * @param cuerpo
     *
     */
    @SuppressWarnings("empty-statement")
    public void generateExcel(List cabecera, List cuerpo) {

        // Initialize rowIndex
        rowIndex = 0;

        // New Workbook
        workbook = new HSSFWorkbook();

        // Generate fonts
        headerFont = createFont(HSSFColor.WHITE.index, (short) 12, true);
        contentFont = createFont(HSSFColor.BLACK.index, (short) 10, false);

        // Generate styles
        headerStyle = createStyle(headerFont, HSSFCellStyle.ALIGN_CENTER, HSSFColor.BLUE_GREY.index, true, HSSFColor.WHITE.index);
        oddRowStyle = createStyle(contentFont, HSSFCellStyle.ALIGN_LEFT, HSSFColor.GREY_25_PERCENT.index, true, HSSFColor.GREY_80_PERCENT.index);
        evenRowStyle = createStyle(contentFont, HSSFCellStyle.ALIGN_LEFT, HSSFColor.GREY_40_PERCENT.index, true, HSSFColor.GREY_80_PERCENT.index);

        // New sheet
        HSSFSheet sheet = workbook.createSheet("Very Cool Sheet");

        // Table header
        HSSFRow headerRow = sheet.createRow(rowIndex++);
        List<String> headerValues = cabecera;

        HSSFCell headerCell = null;
        for (int i = 0; i < headerValues.size(); i++) {
            headerCell = headerRow.createCell(i);
            headerCell.setCellStyle(headerStyle);
            headerCell.setCellValue(headerValues.get(i));
        }

        // Table content
        HSSFRow contentRow = null;
        HSSFCell contentCell = null;

        // Obtain table content values
        List<List<String>> contentRowValues = cuerpo;
        for (List<String> rowValues : contentRowValues) {

            // At each row creation, rowIndex must grow one unit
            contentRow = sheet.createRow(rowIndex++);
            for (int i = 0; i < rowValues.size(); i++) {
                contentCell = contentRow.createCell(i);
                contentCell.setCellValue(rowValues.get(i));

                // Style depends on if row is odd or even
                contentCell.setCellStyle(rowIndex % 2 == 0 ? oddRowStyle : evenRowStyle);
            }
        }

        // Autosize columns
        for (int i = 0; i < headerValues.size(); sheet.autoSizeColumn(i++));
        try {
            OutputStream out = new FileOutputStream(URLIEXPORTTEMPORAL);
            workbook.write(out);
            workbook.close();
            out.flush();
            out.close();
        } catch (IOException e) {
            System.err.println(MESSAGERROREXPORTAR);
        }

    }

    public void secureExcel(String salida, List cabecera, List cuerpo) {
        generateExcel(cabecera, cuerpo);
        String fname = URLIMPORTSECURY;

        FileInputStream fileInput = null;
        BufferedInputStream bufferInput = null;
        POIFSFileSystem poiFileSystem = null;
        FileOutputStream fileOut = null;

        try {

            fileInput = new FileInputStream(fname);
            bufferInput = new BufferedInputStream(fileInput);
            poiFileSystem = new POIFSFileSystem(bufferInput);

            Biff8EncryptionKey.setCurrentUserPassword(PASSWORT);
            HSSFWorkbook excelBook = new HSSFWorkbook(poiFileSystem, true);
            HSSFSheet sheet = excelBook.getSheetAt(0);

            HSSFRow row = sheet.createRow(0);
            Cell cell = row.createCell(0);

            cell.setCellValue("THIS WORKS!");

            fileOut = new FileOutputStream(salida);
            excelBook.writeProtectWorkbook(Biff8EncryptionKey.getCurrentUserPassword(), "");
            excelBook.write(fileOut);

        } catch (Exception ex) {

            System.out.println(ex.getMessage());

        } finally {

            try {

                bufferInput.close();

            } catch (IOException ex) {

                System.out.println(ex.getMessage());

            }

            try {

                fileOut.close();

            } catch (IOException ex) {

                System.out.println(ex.getMessage());

            }
        }
    }

    /**
     * Create a new font on base workbook
     *
     * @param fontColor Font color (see {@link HSSFColor})
     * @param fontHeight Font height in points
     * @param fontBold Font is boldweight (<code>true</code>) or not
     * (<code>false</code>)
     *
     * @return New cell style
     */
    private HSSFFont createFont(short fontColor, short fontHeight, boolean fontBold) {

        HSSFFont font = workbook.createFont();
        font.setBold(fontBold);
        font.setColor(fontColor);
        font.setFontName(TIPOLETRA);
        font.setFontHeightInPoints(fontHeight);

        return font;
    }

    /**
     * Create a style on base workbook
     *
     * @param font Font used by the style
     * @param cellAlign Cell alignment for contained text (see
     * {@link HSSFCellStyle})
     * @param cellColor Cell background color (see {@link HSSFColor})
     * @param cellBorder Cell has border (<code>true</code>) or not
     * (<code>false</code>)
     * @param cellBorderColor Cell border color (see {@link HSSFColor})
     *
     * @return New cell style
     */
    private HSSFCellStyle createStyle(HSSFFont font, short cellAlign, short cellColor, boolean cellBorder, short cellBorderColor) {

        HSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);
        style.setAlignment(cellAlign);
        style.setFillForegroundColor(cellColor);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

        if (cellBorder) {
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

            style.setTopBorderColor(cellBorderColor);
            style.setLeftBorderColor(cellBorderColor);
            style.setRightBorderColor(cellBorderColor);
            style.setBottomBorderColor(cellBorderColor);
        }

        return style;
    }
}
