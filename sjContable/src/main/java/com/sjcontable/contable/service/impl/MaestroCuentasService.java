/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.contable.service.impl;

import com.sjcontable.contable.service.iface.IMaestroCuentasService;
import com.sjcontable.dao.contable.ContableFactoryDao;
import com.sjcontable.model.contable.ContMaestroCuentas;
import java.util.List;

/**
 *
 * @author josmarl
 */
public class MaestroCuentasService implements IMaestroCuentasService {

    ContableFactoryDao dao;

    public MaestroCuentasService() {
        dao = ContableFactoryDao.getInstance();
    }

    @Override
    public List<ContMaestroCuentas> findAll() {
        return dao.getMaestroCuentasDao().getListAll();
    }

}
