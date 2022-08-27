/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.service.impl;

import com.qldv.pojo.Seat;
import com.qldv.repository.TicketDetailRepository;
import com.qldv.service.TicketDetailService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class TicketDetailServiceImpl implements TicketDetailService{
    @Autowired
    private TicketDetailRepository ticketDetailRepository;

    @Override
    public List<Object[]> findTicketsByTripId(int tripId) {
        return this.ticketDetailRepository.findTicketsByTripId(tripId);
    }

    @Override
    public List<Seat> getSeat(String kw) {
        return this.ticketDetailRepository.getSeat(kw);
    }

    @Override
    public long countSeat(String kw) {
        return this.ticketDetailRepository.countSeat(kw);
    }

    @Override
    public Object getUsers(String uname) {
         return this.ticketDetailRepository.getUsers(uname);
    }

    @Override
    public boolean addReceipt(Map<Integer, Seat> seat, int uId, String method) {
        if(seat!=null){
            return this.ticketDetailRepository.addReceipt(seat, uId, method);
        }
        return false;
        
    }
}
