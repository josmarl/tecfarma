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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author josmarl
 */
@Entity
@Table(name = "cont_cuenta")
@NamedQueries({
    @NamedQuery(name = "ContCuenta.findAll", query = "SELECT c FROM ContCuenta c")})
public class ContCuenta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_cuenta")
    private String idCuenta;
    @Basic(optional = false)
    @Column(name = "cuenta")
    private String cuenta;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCuenta")
    private Collection<ContSubCuenta> contSubCuentaCollection;
    @JoinColumn(name = "id_elemento", referencedColumnName = "id_elemento")
    @ManyToOne(optional = false)
    private ContElemento idElemento;

    public ContCuenta() {
    }

    public ContCuenta(String idCuenta) {
        this.idCuenta = idCuenta;
    }

    public ContCuenta(String idCuenta, String cuenta, String descripcion, String estado) {
        this.idCuenta = idCuenta;
        this.cuenta = cuenta;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public String getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(String idCuenta) {
        this.idCuenta = idCuenta;
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

    public Collection<ContSubCuenta> getContSubCuentaCollection() {
        return contSubCuentaCollection;
    }

    public void setContSubCuentaCollection(Collection<ContSubCuenta> contSubCuentaCollection) {
        this.contSubCuentaCollection = contSubCuentaCollection;
    }

    public ContElemento getIdElemento() {
        return idElemento;
    }

    public void setIdElemento(ContElemento idElemento) {
        this.idElemento = idElemento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCuenta != null ? idCuenta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContCuenta)) {
            return false;
        }
        ContCuenta other = (ContCuenta) object;
        if ((this.idCuenta == null && other.idCuenta != null) || (this.idCuenta != null && !this.idCuenta.equals(other.idCuenta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.ContCuenta[ idCuenta=" + idCuenta + " ]";
    }
    
}
