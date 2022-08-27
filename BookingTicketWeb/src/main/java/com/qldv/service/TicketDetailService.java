/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.service;

import com.qldv.pojo.Seat;
import com.qldv.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface TicketDetailService {

    List<Object[]> findTicketsByTripId(int tripId);

    List<Seat> getSeat(String kw);

    long countSeat(String kw);

    Object getUsers(String uname);

    boolean addReceipt(Map<Integer, Seat> seat, int uId, String method);
}
