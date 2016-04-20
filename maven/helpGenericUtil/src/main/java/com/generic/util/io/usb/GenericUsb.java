package com.generic.util.io.usb;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.swing.filechooser.FileSystemView;

/**
 *
 * @author Miguel Rodrigo Pazo Sánchez (http://miguelpazo.com/)
 */
public class GenericUsb {
    public static GenericUsb instance;
    private List<String> lstNoDisk;

    private GenericUsb() {
        lstNoDisk = new ArrayList<>();

        lstNoDisk.add("Disco extraíble");
        lstNoDisk.add("Disco extraí");
    }

    public static GenericUsb getInstance() {
        if (instance == null) {
            instance = new GenericUsb();
        }

        return instance;
    }

    /**
     * Its slower if the computer have so much usbs registered
     * in his registry
     * 
     * @return Paths of usbs connected from the FileSystemView
     * @throws Exception 
     */
    public List<Path> getUsbPaths() throws Exception {
        File unids[] = File.listRoots();
        ArrayList<Path> lstUnids = new ArrayList<>();

        for (int i = 0; i < unids.length; i++) {
            String typeUnid = FileSystemView.getFileSystemView().getSystemTypeDescription(unids[i]);
            String name = FileSystemView.getFileSystemView().getSystemDisplayName(unids[i]);

            if (lstNoDisk.contains(typeUnid) && !name.equals("")) {
                lstUnids.add(Paths.get(unids[i].toString()));
            }
        }

        return lstUnids;
    }

    /**
     * Its faster, but is necessary that computer do not have any
     * remote unid, these should be registry only the basic unids.
     * 
     * @return Paths of usbs connected by visible and storage attributes
     * @throws Exception 
     */
    public List<Path> getUsbPathsFastMode() throws Exception {
        File unids[] = File.listRoots();
        ArrayList<Path> lstUnids = new ArrayList<>();

        for (int i = 0; i < unids.length; i++) {
            if (!unids[i].isHidden() && unids[i].getTotalSpace() > 0) {
                lstUnids.add(Paths.get(unids[i].toString()));
            }
        }

        return lstUnids;
    }
}
