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
@Table(name = "glo_apertura_periodo")
@NamedQueries({
    @NamedQuery(name = "GloAperturaPeriodo.findAll", query = "SELECT g FROM GloAperturaPeriodo g")})
public class GloAperturaPeriodo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_apertura_periodo")
    private String idAperturaPeriodo;
    @Basic(optional = false)
    @Column(name = "id_periodo")
    private String idPeriodo;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @Basic(optional = false)
    @Column(name = "ip")
    private String ip;
    @Basic(optional = false)
    @Column(name = "id_personal_user")
    private String idPersonalUser;
    @JoinColumn(name = "id_configuracion", referencedColumnName = "id_configuracion")
    @ManyToOne(optional = false)
    private GloConfiguracion idConfiguracion;
    @JoinColumn(name = "id_empresa", referencedColumnName = "id_empresa")
    @ManyToOne(optional = false)
    private GloEmpresa idEmpresa;

    public GloAperturaPeriodo() {
    }

    public GloAperturaPeriodo(String idAperturaPeriodo) {
        this.idAperturaPeriodo = idAperturaPeriodo;
    }

    public GloAperturaPeriodo(String idAperturaPeriodo, String idPeriodo, String estado, String ip, String idPersonalUser) {
        this.idAperturaPeriodo = idAperturaPeriodo;
        this.idPeriodo = idPeriodo;
        this.estado = estado;
        this.ip = ip;
        this.idPersonalUser = idPersonalUser;
    }

    public String getIdAperturaPeriodo() {
        return idAperturaPeriodo;
    }

    public void setIdAperturaPeriodo(String idAperturaPeriodo) {
        this.idAperturaPeriodo = idAperturaPeriodo;
    }

    public String getIdPeriodo() {
        return idPeriodo;
    }

    public void setIdPeriodo(String idPeriodo) {
        this.idPeriodo = idPeriodo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getIdPersonalUser() {
        return idPersonalUser;
    }

    public void setIdPersonalUser(String idPersonalUser) {
        this.idPersonalUser = idPersonalUser;
    }

    public GloConfiguracion getIdConfiguracion() {
        return idConfiguracion;
    }

    public void setIdConfiguracion(GloConfiguracion idConfiguracion) {
        this.idConfiguracion = idConfiguracion;
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
        hash += (idAperturaPeriodo != null ? idAperturaPeriodo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GloAperturaPeriodo)) {
            return false;
        }
        GloAperturaPeriodo other = (GloAperturaPeriodo) object;
        if ((this.idAperturaPeriodo == null && other.idAperturaPeriodo != null) || (this.idAperturaPeriodo != null && !this.idAperturaPeriodo.equals(other.idAperturaPeriodo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.GloAperturaPeriodo[ idAperturaPeriodo=" + idAperturaPeriodo + " ]";
    }
    
}
