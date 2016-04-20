/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.dao.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author josmarl
 */
public class DaoUtils {

    public static Properties readProperties(File file) {
        Properties properties = new Properties();
        try {
            InputStream input = new FileInputStream(file);
            properties.load(input);

        } catch (FileNotFoundException ex) {
            Logger.getLogger(DaoUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DaoUtils.class.getName()).log(Level.SEVERE, null, ex);
        }

        return properties;
    }
}
