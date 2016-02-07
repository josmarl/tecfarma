/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.contable.service.impl;

import com.sjcontable.contable.service.iface.IElementoService;
import com.sjcontable.dao.contable.ContableFactoryDao;
import com.sjcontable.model.ContElemento;
import java.util.List;

/**
 *
 * @author josmarl
 */
public class ElementoService implements IElementoService {

    ContableFactoryDao dao = ContableFactoryDao.getInstance();

    @Override
    public List<ContElemento> listElemento() {
        return dao.getElementoDao().getListAll();
    }

}
