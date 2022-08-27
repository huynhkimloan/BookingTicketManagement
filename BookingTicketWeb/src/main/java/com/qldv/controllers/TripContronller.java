/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.service.RouteService;
import com.qldv.service.TripService;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dieuh
 */
@Controller
public class TripContronller {

   @Autowired
    private TripService tripService;
    @Autowired
    private RouteService routeService;

    @RequestMapping("/trip/{routeId}")
    public String trip(Model model, @PathVariable("routeId") int routeId, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        
        Date fromDate = null;
        String from = params.getOrDefault("kw", null);
        if(from != null)
            fromDate = f.parse(from);
        model.addAttribute("tripDeparturedays", this.tripService.getDeparturedayTrips(fromDate, routeId));
        return "trip";
    }
    
//    private void DayLimit(){
//        this.dtpBirthDate.setDayCellFactory(cf -> {
//            DatePicker dayNow = new DatePicker();
//            String date = LocalDate.now().toString();
//            int d = 0, m = 0, y = 0;
//            dayNow.setValue(Utils.getPreviousDay(date, d, m, y));
//            dtpBirthDate.setValue(Utils.getPreviousDay(date, d, m, y));
//            return new MaxDateCell(dayNow.valueProperty());
//        });
}
