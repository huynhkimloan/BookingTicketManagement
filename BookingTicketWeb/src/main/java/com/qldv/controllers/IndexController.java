/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.pojo.Seat;
import com.qldv.pojo.User;
import com.qldv.service.CategoryService;
import com.qldv.service.RouteService;
import com.qldv.service.TripService;
import com.qldv.utils.Utils;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ASUS
 */
@Controller
@ControllerAdvice
public class IndexController {

    @Autowired
    private RouteService routeService;

    @Autowired
    private CategoryService categoryService;

    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("counter", Utils.count((Map<Integer, Seat>) session.getAttribute("seat")));
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam(required = false) Map<String, String> params) {
        String kw = params.getOrDefault("kw", null);
        String kw1 = params.getOrDefault("kw1", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("routes", this.routeService.getRoutes(kw, kw1, page));
        model.addAttribute("counter", this.routeService.countRoute());
        return "index";
    }

//    @RequestMapping ("/")
//    public String index(Model model, @RequestParam(value = "kw", required = false, defaultValue = "") String kw, 
//            @RequestParam(value = "kw1", required = false, defaultValue = "") String kw1,
//            @RequestParam(value = "kw", required = false, defaultValue = "1") int page) {
//        model.addAttribute("routes", this.routeService.getRoutes(kw, kw1, page));
//        return "index";
//    }
}
