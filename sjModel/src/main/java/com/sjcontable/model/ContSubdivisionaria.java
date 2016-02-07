/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sjcontable.model;

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
@Table(name = "cont_subdivisionaria")
@NamedQueries({
    @NamedQuery(name = "ContSubdivisionaria.findAll", query = "SELECT c FROM ContSubdivisionaria c")})
public class ContSubdivisionaria implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_subdivisionaria")
    private String idSubdivisionaria;
    @Basic(optional = false)
    @Column(name = "cuenta")
    private String cuenta;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @JoinColumn(name = "id_divisionaria", referencedColumnName = "id_divisionaria")
    @ManyToOne(optional = false)
    private ContDivisionaria idDivisionaria;

    public ContSubdivisionaria() {
    }

    public ContSubdivisionaria(String idSubdivisionaria) {
        this.idSubdivisionaria = idSubdivisionaria;
    }

    public ContSubdivisionaria(String idSubdivisionaria, String cuenta, String descripcion, String estado) {
        this.idSubdivisionaria = idSubdivisionaria;
        this.cuenta = cuenta;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public String getIdSubdivisionaria() {
        return idSubdivisionaria;
    }

    public void setIdSubdivisionaria(String idSubdivisionaria) {
        this.idSubdivisionaria = idSubdivisionaria;
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

    public ContDivisionaria getIdDivisionaria() {
        return idDivisionaria;
    }

    public void setIdDivisionaria(ContDivisionaria idDivisionaria) {
        this.idDivisionaria = idDivisionaria;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSubdivisionaria != null ? idSubdivisionaria.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContSubdivisionaria)) {
            return false;
        }
        ContSubdivisionaria other = (ContSubdivisionaria) object;
        if ((this.idSubdivisionaria == null && other.idSubdivisionaria != null) || (this.idSubdivisionaria != null && !this.idSubdivisionaria.equals(other.idSubdivisionaria))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.ContSubdivisionaria[ idSubdivisionaria=" + idSubdivisionaria + " ]";
    }
    
}
