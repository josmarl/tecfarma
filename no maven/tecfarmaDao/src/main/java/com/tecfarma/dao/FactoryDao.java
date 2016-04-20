/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.dao;

import com.tecfarma.dao.iface.IUsuarioDao;
import com.tecfarma.dao.impl.UsuarioDao;

/**
 *
 * @author josmarl
 */
public class FactoryDao {

    private FactoryDao() {
    }

    public static FactoryDao getInstance() {
        return FactoryDaoHolder.INSTANCE;
    }

    private static class FactoryDaoHolder {

        private static final FactoryDao INSTANCE = new FactoryDao();
    }

    public IUsuarioDao getUsuarioDao() {
        return new UsuarioDao();
    }
}
