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

    @Override
    public Usuario loginUsuario(Usuario usuario) {
        Usuario u = null;
        try {
            openConn();
            ps = oConnection.prepareStatement("select usuario,estado from usuario where usuario=? and password=?;");
            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getPassword());
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setUsuario(rs.getString("usuario"));
                u.setEstado(rs.getString("estado"));
            }
        } catch (Exception e) {
            Logger.getLogger(UsuarioDao.class.getName()).log(Level.OFF, e.getMessage());
        } finally {
            closeConn();
        }
        return u;
    }

}
