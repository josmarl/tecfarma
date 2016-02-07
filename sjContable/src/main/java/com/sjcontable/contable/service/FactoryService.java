/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.contable.service;

import com.sjcontable.contable.service.iface.IElementoService;
import com.sjcontable.contable.service.impl.ElementoService;

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

    public IElementoService getElementoService() {
        return new ElementoService();
    }
}
