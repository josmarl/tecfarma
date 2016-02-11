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
@Table(name = "glo_empresa")
@NamedQueries({
    @NamedQuery(name = "GloEmpresa.findAll", query = "SELECT g FROM GloEmpresa g")})
public class GloEmpresa implements Serializable {
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEmpresa")
    private Collection<GloSucursal> gloSucursalCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_empresa")
    private String idEmpresa;
    @Basic(optional = false)
    @Column(name = "razonsocial")
    private String razonsocial;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "direccionleg")
    private String direccionleg;
    @Basic(optional = false)
    @Column(name = "direccionref")
    private String direccionref;
    @Basic(optional = false)
    @Column(name = "telefono")
    private String telefono;
    @Basic(optional = false)
    @Column(name = "celular")
    private String celular;
    @Basic(optional = false)
    @Column(name = "ruc")
    private String ruc;
    @Basic(optional = false)
    @Column(name = "paginaweb")
    private String paginaweb;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "logo")
    private String logo;
    @Basic(optional = false)
    @Column(name = "siglas")
    private String siglas;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEmpresa")
    private Collection<GloAperturaPeriodo> gloAperturaPeriodoCollection;

    public GloEmpresa() {
    }

    public GloEmpresa(String idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public GloEmpresa(String idEmpresa, String razonsocial, String descripcion, String direccionleg, String direccionref, String telefono, String celular, String ruc, String paginaweb, String email, String logo, String siglas) {
        this.idEmpresa = idEmpresa;
        this.razonsocial = razonsocial;
        this.descripcion = descripcion;
        this.direccionleg = direccionleg;
        this.direccionref = direccionref;
        this.telefono = telefono;
        this.celular = celular;
        this.ruc = ruc;
        this.paginaweb = paginaweb;
        this.email = email;
        this.logo = logo;
        this.siglas = siglas;
    }

    public String getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(String idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getRazonsocial() {
        return razonsocial;
    }

    public void setRazonsocial(String razonsocial) {
        this.razonsocial = razonsocial;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDireccionleg() {
        return direccionleg;
    }

    public void setDireccionleg(String direccionleg) {
        this.direccionleg = direccionleg;
    }

    public String getDireccionref() {
        return direccionref;
    }

    public void setDireccionref(String direccionref) {
        this.direccionref = direccionref;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getPaginaweb() {
        return paginaweb;
    }

    public void setPaginaweb(String paginaweb) {
        this.paginaweb = paginaweb;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getSiglas() {
        return siglas;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public Collection<GloAperturaPeriodo> getGloAperturaPeriodoCollection() {
        return gloAperturaPeriodoCollection;
    }

    public void setGloAperturaPeriodoCollection(Collection<GloAperturaPeriodo> gloAperturaPeriodoCollection) {
        this.gloAperturaPeriodoCollection = gloAperturaPeriodoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEmpresa != null ? idEmpresa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GloEmpresa)) {
            return false;
        }
        GloEmpresa other = (GloEmpresa) object;
        if ((this.idEmpresa == null && other.idEmpresa != null) || (this.idEmpresa != null && !this.idEmpresa.equals(other.idEmpresa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.GloEmpresa[ idEmpresa=" + idEmpresa + " ]";
    }

    public Collection<GloSucursal> getGloSucursalCollection() {
        return gloSucursalCollection;
    }

    public void setGloSucursalCollection(Collection<GloSucursal> gloSucursalCollection) {
        this.gloSucursalCollection = gloSucursalCollection;
    }
    
}
