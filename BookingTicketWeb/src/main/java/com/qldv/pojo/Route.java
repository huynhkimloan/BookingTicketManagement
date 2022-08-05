/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "route")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Route.findAll", query = "SELECT r FROM Route r"),
    @NamedQuery(name = "Route.findById", query = "SELECT r FROM Route r WHERE r.id = :id"),
    @NamedQuery(name = "Route.findByRoutename", query = "SELECT r FROM Route r WHERE r.routename = :routename"),
    @NamedQuery(name = "Route.findByStartingpoint", query = "SELECT r FROM Route r WHERE r.startingpoint = :startingpoint"),
    @NamedQuery(name = "Route.findByDestination", query = "SELECT r FROM Route r WHERE r.destination = :destination"),
    @NamedQuery(name = "Route.findByPrice", query = "SELECT r FROM Route r WHERE r.price = :price")})
public class Route implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "routename")
    private String routename;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "startingpoint")
    private String startingpoint;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "destination")
    private String destination;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private long price;
    @OneToMany(mappedBy = "route")
    private Set<Trip> tripSet;

    public Route() {
    }

    public Route(Integer id) {
        this.id = id;
    }

    public Route(Integer id, String routename, String startingpoint, String destination, long price) {
        this.id = id;
        this.routename = routename;
        this.startingpoint = startingpoint;
        this.destination = destination;
        this.price = price;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoutename() {
        return routename;
    }

    public void setRoutename(String routename) {
        this.routename = routename;
    }

    public String getStartingpoint() {
        return startingpoint;
    }

    public void setStartingpoint(String startingpoint) {
        this.startingpoint = startingpoint;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    @XmlTransient
    public Set<Trip> getTripSet() {
        return tripSet;
    }

    public void setTripSet(Set<Trip> tripSet) {
        this.tripSet = tripSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Route)) {
            return false;
        }
        Route other = (Route) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qldv.pojo.Route[ id=" + id + " ]";
    }
    
}
