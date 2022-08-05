/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "bookingticket")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bookingticket.findAll", query = "SELECT b FROM Bookingticket b"),
    @NamedQuery(name = "Bookingticket.findById", query = "SELECT b FROM Bookingticket b WHERE b.id = :id"),
    @NamedQuery(name = "Bookingticket.findByBookingdate", query = "SELECT b FROM Bookingticket b WHERE b.bookingdate = :bookingdate"),
    @NamedQuery(name = "Bookingticket.findByActive", query = "SELECT b FROM Bookingticket b WHERE b.active = :active")})
public class Bookingticket implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "bookingdate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date bookingdate;
    @Column(name = "active")
    private Boolean active;
    @OneToMany(mappedBy = "bookingticket")
    private Set<Ticketdetail> ticketdetailSet;
    @JoinColumns({
        @JoinColumn(name = "user_id", referencedColumnName = "id"),
        @JoinColumn(name = "user_id", referencedColumnName = "id")})
    @ManyToOne
    private User user;

    public Bookingticket() {
    }

    public Bookingticket(Integer id) {
        this.id = id;
    }

    public Bookingticket(Integer id, Date bookingdate) {
        this.id = id;
        this.bookingdate = bookingdate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getBookingdate() {
        return bookingdate;
    }

    public void setBookingdate(Date bookingdate) {
        this.bookingdate = bookingdate;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    @XmlTransient
    public Set<Ticketdetail> getTicketdetailSet() {
        return ticketdetailSet;
    }

    public void setTicketdetailSet(Set<Ticketdetail> ticketdetailSet) {
        this.ticketdetailSet = ticketdetailSet;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
        if (!(object instanceof Bookingticket)) {
            return false;
        }
        Bookingticket other = (Bookingticket) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qldv.pojo.Bookingticket[ id=" + id + " ]";
    }
    
}
