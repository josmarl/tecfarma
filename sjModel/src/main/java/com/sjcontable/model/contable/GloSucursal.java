/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.model.contable;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author josmarl
 */
@Entity
@Table(name = "glo_sucursal")
@NamedQueries({
    @NamedQuery(name = "GloSucursal.findAll", query = "SELECT g FROM GloSucursal g")})
public class GloSucursal implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_sucursal")
    private String idSucursal;
    @JoinColumn(name = "id_empresa", referencedColumnName = "id_empresa")
    @ManyToOne(optional = false)
    private GloEmpresa idEmpresa;

    public GloSucursal() {
    }

    public GloSucursal(String idSucursal) {
        this.idSucursal = idSucursal;
    }

    public String getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(String idSucursal) {
        this.idSucursal = idSucursal;
    }

    public GloEmpresa getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(GloEmpresa idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSucursal != null ? idSucursal.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GloSucursal)) {
            return false;
        }
        GloSucursal other = (GloSucursal) object;
        if ((this.idSucursal == null && other.idSucursal != null) || (this.idSucursal != null && !this.idSucursal.equals(other.idSucursal))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.contable.GloSucursal[ idSucursal=" + idSucursal + " ]";
    }
    
}
