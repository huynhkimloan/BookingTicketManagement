/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.repository.impl;

import com.qldv.pojo.Passengercar;
import com.qldv.pojo.Trip;
import com.qldv.repository.PassengerRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
public class PassengerRepositoryImpl implements PassengerRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public Passengercar getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Passengercar.class, id);
    }

    @Override
    public List<Passengercar> getPassengercars(String kw) {
         Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Passengercar> query = builder.createQuery(Passengercar.class);
        Root root = query.from(Passengercar.class);
        query = query.select(root);

        if (kw != null && !kw.isEmpty()) {
            Predicate p1 = builder.like(root.get("name").as(String.class),
                    String.format("%%%s%%", kw));
            query = query.where(p1);
        }

        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
}
