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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "trip")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Trip.findAll", query = "SELECT t FROM Trip t"),
    @NamedQuery(name = "Trip.findById", query = "SELECT t FROM Trip t WHERE t.id = :id"),
    @NamedQuery(name = "Trip.findByCoachname", query = "SELECT t FROM Trip t WHERE t.coachname = :coachname"),
    @NamedQuery(name = "Trip.findByDepartureday", query = "SELECT t FROM Trip t WHERE t.departureday = :departureday"),
    @NamedQuery(name = "Trip.findByDeparturetime", query = "SELECT t FROM Trip t WHERE t.departuretime = :departuretime"),
    @NamedQuery(name = "Trip.findByArrivaltime", query = "SELECT t FROM Trip t WHERE t.arrivaltime = :arrivaltime"),
    @NamedQuery(name = "Trip.findByEmptyseat", query = "SELECT t FROM Trip t WHERE t.emptyseat = :emptyseat"),
    @NamedQuery(name = "Trip.findByActive", query = "SELECT t FROM Trip t WHERE t.active = :active")})
public class Trip implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "coachname")
    private String coachname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "departureday")
    @Temporal(TemporalType.DATE)
    private Date departureday;
    @Basic(optional = false)
    @NotNull
    @Column(name = "departuretime")
    @Temporal(TemporalType.TIME)
    private Date departuretime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "arrivaltime")
    @Temporal(TemporalType.TIME)
    private Date arrivaltime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "emptyseat")
    private int emptyseat;
    @Column(name = "active")
    private Boolean active;
    @JoinColumn(name = "user_id_driver", referencedColumnName = "user_id_driver")
    @ManyToOne
    private Driver userIdDriver;
    @JoinColumns({
        @JoinColumn(name = "user_id_employee", referencedColumnName = "user_id_employee"),
        @JoinColumn(name = "user_id_employee", referencedColumnName = "user_id_employee")})
    @ManyToOne
    private Employee employee;
    @JoinColumn(name = "passengercar_id", referencedColumnName = "id")
    @ManyToOne
    private Passengercar passengercarId;
    @JoinColumns({
        @JoinColumn(name = "route_id", referencedColumnName = "id"),
        @JoinColumn(name = "route_id", referencedColumnName = "id")})
    @ManyToOne
    private Route route;
    @OneToMany(mappedBy = "trip")
    private Set<Comment> commentSet;
    @OneToMany(mappedBy = "trip")
    private Set<Ticketdetail> ticketdetailSet;

    public Trip() {
    }

    public Trip(Integer id) {
        this.id = id;
    }

    public Trip(Integer id, String coachname, Date departureday, Date departuretime, Date arrivaltime, int emptyseat) {
        this.id = id;
        this.coachname = coachname;
        this.departureday = departureday;
        this.departuretime = departuretime;
        this.arrivaltime = arrivaltime;
        this.emptyseat = emptyseat;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCoachname() {
        return coachname;
    }

    public void setCoachname(String coachname) {
        this.coachname = coachname;
    }

    public Date getDepartureday() {
        return departureday;
    }

    public void setDepartureday(Date departureday) {
        this.departureday = departureday;
    }

    public Date getDeparturetime() {
        return departuretime;
    }

    public void setDeparturetime(Date departuretime) {
        this.departuretime = departuretime;
    }

    public Date getArrivaltime() {
        return arrivaltime;
    }

    public void setArrivaltime(Date arrivaltime) {
        this.arrivaltime = arrivaltime;
    }

    public int getEmptyseat() {
        return emptyseat;
    }

    public void setEmptyseat(int emptyseat) {
        this.emptyseat = emptyseat;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Driver getUserIdDriver() {
        return userIdDriver;
    }

    public void setUserIdDriver(Driver userIdDriver) {
        this.userIdDriver = userIdDriver;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Passengercar getPassengercarId() {
        return passengercarId;
    }

    public void setPassengercarId(Passengercar passengercarId) {
        this.passengercarId = passengercarId;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    @XmlTransient
    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }

    @XmlTransient
    public Set<Ticketdetail> getTicketdetailSet() {
        return ticketdetailSet;
    }

    public void setTicketdetailSet(Set<Ticketdetail> ticketdetailSet) {
        this.ticketdetailSet = ticketdetailSet;
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
        if (!(object instanceof Trip)) {
            return false;
        }
        Trip other = (Trip) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qldv.pojo.Trip[ id=" + id + " ]";
    }
    
}
