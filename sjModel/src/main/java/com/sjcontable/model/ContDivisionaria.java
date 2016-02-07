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
@Table(name = "cont_divisionaria")
@NamedQueries({
    @NamedQuery(name = "ContDivisionaria.findAll", query = "SELECT c FROM ContDivisionaria c")})
public class ContDivisionaria implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_divisionaria")
    private String idDivisionaria;
    @Basic(optional = false)
    @Column(name = "cuenta")
    private String cuenta;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idDivisionaria")
    private Collection<ContSubdivisionaria> contSubdivisionariaCollection;
    @JoinColumn(name = "id_sub_cuenta", referencedColumnName = "id_sub_cuenta")
    @ManyToOne(optional = false)
    private ContSubCuenta idSubCuenta;

    public ContDivisionaria() {
    }

    public ContDivisionaria(String idDivisionaria) {
        this.idDivisionaria = idDivisionaria;
    }

    public ContDivisionaria(String idDivisionaria, String cuenta, String descripcion, String estado) {
        this.idDivisionaria = idDivisionaria;
        this.cuenta = cuenta;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public String getIdDivisionaria() {
        return idDivisionaria;
    }

    public void setIdDivisionaria(String idDivisionaria) {
        this.idDivisionaria = idDivisionaria;
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

    public Collection<ContSubdivisionaria> getContSubdivisionariaCollection() {
        return contSubdivisionariaCollection;
    }

    public void setContSubdivisionariaCollection(Collection<ContSubdivisionaria> contSubdivisionariaCollection) {
        this.contSubdivisionariaCollection = contSubdivisionariaCollection;
    }

    public ContSubCuenta getIdSubCuenta() {
        return idSubCuenta;
    }

    public void setIdSubCuenta(ContSubCuenta idSubCuenta) {
        this.idSubCuenta = idSubCuenta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDivisionaria != null ? idDivisionaria.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContDivisionaria)) {
            return false;
        }
        ContDivisionaria other = (ContDivisionaria) object;
        if ((this.idDivisionaria == null && other.idDivisionaria != null) || (this.idDivisionaria != null && !this.idDivisionaria.equals(other.idDivisionaria))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.ContDivisionaria[ idDivisionaria=" + idDivisionaria + " ]";
    }
    
}
