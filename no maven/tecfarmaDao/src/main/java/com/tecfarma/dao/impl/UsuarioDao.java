/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.dao.impl;

import com.tecfarma.dao.ConnDatabase;
import com.tecfarma.dao.iface.IUsuarioDao;
import com.tecfarmaModel.model.Usuario;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author josmarl
 */
public class UsuarioDao extends ConnDatabase implements IUsuarioDao {

    @Override
    public List<Usuario> listaUsuario() {

        List<Usuario> lista = new ArrayList<>();
        Usuario usuario;

        try {
            openConn();
            ps = oConnection.prepareStatement("select * from usuario");
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setPassword(rs.getString("password"));
                usuario.setEstado(rs.getString("estado"));
                lista.add(usuario);
            }
        } catch (Exception e) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.SEVERE, e.getMessage());
        } finally {
            closeConn();
        }

        return lista;
    }

}
