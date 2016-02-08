/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.model.contable;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author josmarl
 */
@Entity
@Table(name = "cont_elemento")
@NamedQueries({
    @NamedQuery(name = "ContElemento.findAll", query = "SELECT c FROM ContElemento c")})
public class ContElemento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_elemento")
    private String idElemento;
    @Basic(optional = false)
    @Column(name = "cuenta")
    private String cuenta;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idElemento")
    private Collection<ContCuenta> contCuentaCollection;

    public ContElemento() {
    }

    public ContElemento(String idElemento) {
        this.idElemento = idElemento;
    }

    public ContElemento(String idElemento, String cuenta, String descripcion, String estado) {
        this.idElemento = idElemento;
        this.cuenta = cuenta;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public String getIdElemento() {
        return idElemento;
    }

    public void setIdElemento(String idElemento) {
        this.idElemento = idElemento;
    }

    public String getCuenta() {
        return cuenta;
    }

    public void setCuenta(String cuenta) {
        this.cuenta = cuenta;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Collection<ContCuenta> getContCuentaCollection() {
        return contCuentaCollection;
    }

    public void setContCuentaCollection(Collection<ContCuenta> contCuentaCollection) {
        this.contCuentaCollection = contCuentaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idElemento != null ? idElemento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContElemento)) {
            return false;
        }
        ContElemento other = (ContElemento) object;
        if ((this.idElemento == null && other.idElemento != null) || (this.idElemento != null && !this.idElemento.equals(other.idElemento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.ContElemento[ idElemento=" + idElemento + " ]";
    }
    
}
