/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.model;

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
@Table(name = "cont_sub_cuenta")
@NamedQueries({
    @NamedQuery(name = "ContSubCuenta.findAll", query = "SELECT c FROM ContSubCuenta c")})
public class ContSubCuenta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_sub_cuenta")
    private String idSubCuenta;
    @Basic(optional = false)
    @Column(name = "cuenta")
    private String cuenta;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @JoinColumn(name = "id_cuenta", referencedColumnName = "id_cuenta")
    @ManyToOne(optional = false)
    private ContCuenta idCuenta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idSubCuenta")
    private Collection<ContDivisionaria> contDivisionariaCollection;

    public ContSubCuenta() {
    }

    public ContSubCuenta(String idSubCuenta) {
        this.idSubCuenta = idSubCuenta;
    }

    public ContSubCuenta(String idSubCuenta, String cuenta, String descripcion, String estado) {
        this.idSubCuenta = idSubCuenta;
        this.cuenta = cuenta;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public String getIdSubCuenta() {
        return idSubCuenta;
    }

    public void setIdSubCuenta(String idSubCuenta) {
        this.idSubCuenta = idSubCuenta;
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

    public ContCuenta getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(ContCuenta idCuenta) {
        this.idCuenta = idCuenta;
    }

    public Collection<ContDivisionaria> getContDivisionariaCollection() {
        return contDivisionariaCollection;
    }

    public void setContDivisionariaCollection(Collection<ContDivisionaria> contDivisionariaCollection) {
        this.contDivisionariaCollection = contDivisionariaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSubCuenta != null ? idSubCuenta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContSubCuenta)) {
            return false;
        }
        ContSubCuenta other = (ContSubCuenta) object;
        if ((this.idSubCuenta == null && other.idSubCuenta != null) || (this.idSubCuenta != null && !this.idSubCuenta.equals(other.idSubCuenta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.ContSubCuenta[ idSubCuenta=" + idSubCuenta + " ]";
    }
    
}
