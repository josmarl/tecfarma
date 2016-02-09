/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.contable.service.iface;

import com.sjcontable.model.contable.ContMaestroCuentas;
import java.util.List;

/**
 *
 * @author josmarl
 */
public interface IMaestroCuentasService {
    
    public List<ContMaestroCuentas> findAll();
    
}
