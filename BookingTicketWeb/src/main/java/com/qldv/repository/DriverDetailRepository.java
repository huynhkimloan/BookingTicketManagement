/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.repository;

import com.qldv.pojo.Driverdetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface DriverDetailRepository {

    List<Driverdetail> getDrivers(Map<String, String> params, int start, int limit);

    List<Driverdetail> getListNav(int start, int limit);

    boolean editDriver(Driverdetail d);
    
    boolean addDriver(Driverdetail d);
    
    boolean deleteDriver(int id);

    int totalItem();

    Driverdetail findById(int id);
}
