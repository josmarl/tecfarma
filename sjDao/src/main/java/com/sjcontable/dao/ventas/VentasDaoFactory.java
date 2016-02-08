/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.dao.ventas;

/**
 *
 * @author josmarl
 */
public class VentasDaoFactory {
    
    private VentasDaoFactory() {
    }
    
    public static VentasDaoFactory getInstance() {
        return VentasDaoFactoryHolder.INSTANCE;
    }
    
    private static class VentasDaoFactoryHolder {

        private static final VentasDaoFactory INSTANCE = new VentasDaoFactory();
    }
}
