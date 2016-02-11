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
@Table(name = "cont_maestro_cuentas")
@NamedQueries({
    @NamedQuery(name = "ContMaestroCuentas.findAll", query = "SELECT c FROM ContMaestroCuentas c")})
public class ContMaestroCuentas implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_maestro_cuentas")
    private String idMaestroCuentas;
    @Basic(optional = false)
    @Column(name = "cuenta")
    private String cuenta;
    @Basic(optional = false)
    @Column(name = "pcgr")
    private String pcgr;
    @JoinColumn(name = "id_apertura_periodo", referencedColumnName = "id_apertura_periodo")
    @ManyToOne(optional = false)
    private GloAperturaPeriodo idAperturaPeriodo;

    public ContMaestroCuentas() {
    }

    public ContMaestroCuentas(String idMaestroCuentas) {
        this.idMaestroCuentas = idMaestroCuentas;
    }

    public ContMaestroCuentas(String idMaestroCuentas, String cuenta, String pcgr) {
        this.idMaestroCuentas = idMaestroCuentas;
        this.cuenta = cuenta;
        this.pcgr = pcgr;
    }

    public String getIdMaestroCuentas() {
        return idMaestroCuentas;
    }

    public void setIdMaestroCuentas(String idMaestroCuentas) {
        this.idMaestroCuentas = idMaestroCuentas;
    }

    public String getCuenta() {
        return cuenta;
    }

    public void setCuenta(String cuenta) {
        this.cuenta = cuenta;
    }

    public String getPcgr() {
        return pcgr;
    }

    public void setPcgr(String pcgr) {
        this.pcgr = pcgr;
    }

    public GloAperturaPeriodo getIdAperturaPeriodo() {
        return idAperturaPeriodo;
    }

    public void setIdAperturaPeriodo(GloAperturaPeriodo idAperturaPeriodo) {
        this.idAperturaPeriodo = idAperturaPeriodo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMaestroCuentas != null ? idMaestroCuentas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ContMaestroCuentas)) {
            return false;
        }
        ContMaestroCuentas other = (ContMaestroCuentas) object;
        if ((this.idMaestroCuentas == null && other.idMaestroCuentas != null) || (this.idMaestroCuentas != null && !this.idMaestroCuentas.equals(other.idMaestroCuentas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sjcontable.model.contable.ContMaestroCuentas[ idMaestroCuentas=" + idMaestroCuentas + " ]";
    }
    
}
