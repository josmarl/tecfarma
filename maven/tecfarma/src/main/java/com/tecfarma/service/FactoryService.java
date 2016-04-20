/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.service;

import com.tecfarma.service.iface.IUsuarioService;
import com.tecfarma.service.impl.UsuarioService;

/**
 *
 * @author josmarl
 */
public class FactoryService {

    private FactoryService() {
    }

    public static FactoryService getInstance() {
        return FactoryServiceHolder.INSTANCE;
    }

    private static class FactoryServiceHolder {

        private static final FactoryService INSTANCE = new FactoryService();
    }

    public IUsuarioService getUsuarioService() {
        return new UsuarioService();
    }
}
