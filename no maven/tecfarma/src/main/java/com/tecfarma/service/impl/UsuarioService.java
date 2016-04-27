/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.service.impl;

import com.tecfarma.dao.FactoryDao;
import com.tecfarma.service.iface.IUsuarioService;
import com.tecfarmaModel.model.Usuario;
import java.util.List;

/**
 *
 * @author josmarl
 */
public class UsuarioService implements IUsuarioService {

    FactoryDao factoryDao;

    public UsuarioService() {
        factoryDao = FactoryDao.getInstance();
    }

    @Override
    public List<Usuario> listaUsuario() {
        return factoryDao.getUsuarioDao().listaUsuario();
    }

    @Override
    public Usuario loginUsuario(Usuario usuario) {
        return factoryDao.getUsuarioDao().loginUsuario(usuario);
    }

}
