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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author josmarl
 */
@Entity
@Table(name = "glo_configuracion")
@NamedQueries({
    @NamedQuery(name = "GloConfiguracion.findAll", query = "SELECT g FROM GloConfiguracion g")})
public class GloConfiguracion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_configuracion")
    private String idConfiguracion;
    @Basic(optional = false)
    @Column(name = "id_cuenta_igv")
    private String idCuentaIgv;
    @Basic(optional = false)
    @Column(name = "porcent_igv")
    private double porcentIgv;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idConfiguracion")
    private Collection<GloAperturaPeriodo> gloAperturaPeriodoCollection;

    public GloConfiguracion() {
    }

    public GloConfiguracion(String idConfiguracion) {
        this.idConfiguracion = idConfiguracion;
    }

    public GloConfiguracion(String idConfiguracion, String idCuentaIgv, double porcentIgv) {
        this.idConfiguracion = idConfiguracion;
        this.idCuentaIgv = idCuentaIgv;
        this.porcentIgv = porcentIgv;
    }

    public String getIdConfiguracion() {
        return idConfiguracion;
    }

    public void setIdConfiguracion(String idConfiguracion) {
        this.idConfiguracion = idConfiguracion;
    }

    public String getIdCuentaIgv() {
        return idCuentaIgv;
    }

    public void setIdCuentaIgv(String idCuentaIgv) {
        this.idCuentaIgv = idCuentaIgv;
    }

    public double getPorcentIgv() {
        return porcentIgv;
    }

    public void setPorcentIgv(double porcentIgv) {
        this.porcentIgv = porcentIgv;
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
        hash += (idConfiguracion != null ? idConfiguracion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GloConfiguracion)) {
            return false;
        }
        GloConfiguracion other = (GloConfiguracion) object;
        if ((this.idConfiguracion == null && other.idConfiguracion != null) || (this.idConfiguracion != null && !this.idConfiguracion.equals(other.idConfiguracion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.GloConfiguracion[ idConfiguracion=" + idConfiguracion + " ]";
    }
    
}
