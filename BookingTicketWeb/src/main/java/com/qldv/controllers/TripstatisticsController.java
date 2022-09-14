/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.service.TripstatisticsService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author dieuh
 */
@Controller

public class TripstatisticsController {
    @Autowired
    private TripstatisticsService tripstatisticsService; 
   
    @RequestMapping("/admin/tripstatistics")
    public String tripstatistics(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);
        
        Date fromDate = null;
        String from = params.getOrDefault("fromDate", null);
        if(from != null)
            fromDate = f.parse(from);
        
        Date toDate = null;
        String to = params.getOrDefault("toDate", null);
        if(to != null)
            toDate = f.parse(to);
        
        model.addAttribute("tripstatistics", this.tripstatisticsService.tripStatsByRouteId());
        model.addAttribute("turnovertatisticsbytrip", this.tripstatisticsService.tripStats(kw, fromDate, toDate));
        
        return "tripstatistics";
    }
    
    @RequestMapping("/admin/tripsmonthstats")
    public String tripsmonthstats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        
        Date fromDate = null;
        String from = params.getOrDefault("fromDate", null);
        if(from != null)
            fromDate = f.parse(from);
        
        Date toDate = null;
        String to = params.getOrDefault("toDate", null);
        if(to != null)
            toDate = f.parse(to);
        
        
        model.addAttribute("tripMonthStats", this.tripstatisticsService.tripMonthStats(fromDate, toDate));
        
        return "tripsmonthstats";
    }
    @RequestMapping("/admin/tripsyearstats")
    public String tripsyearstats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        
        Date fromDate = null;
        String from = params.getOrDefault("fromDate", null);
        if(from != null)
            fromDate = f.parse(from);
        
        Date toDate = null;
        String to = params.getOrDefault("toDate", null);
        if(to != null)
            toDate = f.parse(to);
        
        
        model.addAttribute("tripYearStats", this.tripstatisticsService.tripYearStats( fromDate, toDate));
        
        return "tripsyearstats";
    }
    @RequestMapping("/admin/tripsquarterstats")
    public String tripsquarterstats(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        
        Date fromDate = null;
        String from = params.getOrDefault("fromDate", null);
        if(from != null)
            fromDate = f.parse(from);
        
        Date toDate = null;
        String to = params.getOrDefault("toDate", null);
        if(to != null)
            toDate = f.parse(to);
        
        
        model.addAttribute("tripQuarterStats", this.tripstatisticsService.tripQuarterStats( fromDate, toDate));
        
        return "tripsquarterstats";
    }
}
