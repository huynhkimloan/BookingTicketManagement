/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.pojo;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "ticketdetail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ticketdetail.findAll", query = "SELECT t FROM Ticketdetail t"),
    @NamedQuery(name = "Ticketdetail.findById", query = "SELECT t FROM Ticketdetail t WHERE t.id = :id"),
    @NamedQuery(name = "Ticketdetail.findBySeatposition", query = "SELECT t FROM Ticketdetail t WHERE t.seatposition = :seatposition"),
    @NamedQuery(name = "Ticketdetail.findByPaymentmethod", query = "SELECT t FROM Ticketdetail t WHERE t.paymentmethod = :paymentmethod"),
    @NamedQuery(name = "Ticketdetail.findByTotalprice", query = "SELECT t FROM Ticketdetail t WHERE t.totalprice = :totalprice"),
    @NamedQuery(name = "Ticketdetail.findByActive", query = "SELECT t FROM Ticketdetail t WHERE t.active = :active")})
public class Ticketdetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "seatposition")
    private String seatposition;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "paymentmethod")
    private String paymentmethod;
    @Basic(optional = false)
    @NotNull
    @Column(name = "totalprice")
    private long totalprice;
    @Column(name = "active")
    private Boolean active;
    @JoinColumns({
        @JoinColumn(name = "bookingticket_id", referencedColumnName = "id"),
        @JoinColumn(name = "bookingticket_id", referencedColumnName = "id")})
    @ManyToOne
    private Bookingticket bookingticket;
    @JoinColumns({
        @JoinColumn(name = "passengercar_id", referencedColumnName = "id"),
        @JoinColumn(name = "passengercar_id", referencedColumnName = "id")})
    @ManyToOne
    private Passengercar passengercar;
    @JoinColumns({
        @JoinColumn(name = "trip_id", referencedColumnName = "id"),
        @JoinColumn(name = "trip_id", referencedColumnName = "id")})
    @ManyToOne
    private Trip trip;

    public Ticketdetail() {
    }

    public Ticketdetail(Integer id) {
        this.id = id;
    }

    public Ticketdetail(Integer id, String seatposition, String paymentmethod, long totalprice) {
        this.id = id;
        this.seatposition = seatposition;
        this.paymentmethod = paymentmethod;
        this.totalprice = totalprice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSeatposition() {
        return seatposition;
    }

    public void setSeatposition(String seatposition) {
        this.seatposition = seatposition;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    public long getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(long totalprice) {
        this.totalprice = totalprice;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Bookingticket getBookingticket() {
        return bookingticket;
    }

    public void setBookingticket(Bookingticket bookingticket) {
        this.bookingticket = bookingticket;
    }

    public Passengercar getPassengercar() {
        return passengercar;
    }

    public void setPassengercar(Passengercar passengercar) {
        this.passengercar = passengercar;
    }

    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
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
        if (!(object instanceof Ticketdetail)) {
            return false;
        }
        Ticketdetail other = (Ticketdetail) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qldv.pojo.Ticketdetail[ id=" + id + " ]";
    }
    
}
