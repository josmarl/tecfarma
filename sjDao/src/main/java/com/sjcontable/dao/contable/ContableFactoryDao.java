/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.dao.contable;

import com.sjcontable.dao.contable.iface.IElementoDao;
import com.sjcontable.dao.contable.iface.IMaestroCuentasDao;
import com.sjcontable.dao.contable.impl.ElementoDao;
import com.sjcontable.dao.contable.impl.MaestroCuentasDao;

/**
 *
 * @author josmarl
 */
public class ContableFactoryDao {

    private ContableFactoryDao() {
    }

    public static ContableFactoryDao getInstance() {
        return ContableFactoryDaoHolder.INSTANCE;
    }

    private static class ContableFactoryDaoHolder {

        private static final ContableFactoryDao INSTANCE = new ContableFactoryDao();
    }

    public IElementoDao getElementoDao() {
        return new ElementoDao();
    }
    
    public IMaestroCuentasDao getMaestroCuentasDao(){
        return new MaestroCuentasDao();
    }
}
