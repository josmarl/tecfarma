/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.dao.iface;

import com.tecfarmaModel.model.Usuario;
import java.util.List;

/**
 *
 * @author josmarl
 */
public interface IUsuarioDao {

    public List<Usuario> listaUsuario();

    public Usuario loginUsuario(Usuario usuario);

}
