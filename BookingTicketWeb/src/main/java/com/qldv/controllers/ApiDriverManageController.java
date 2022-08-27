/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.controllers;

import com.qldv.pojo.Driver;
import com.qldv.pojo.User;
import com.qldv.service.DriverService;
import com.qldv.service.UserService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
public class ApiDriverManageController {

    @Autowired
    private DriverService driverService;

    @Autowired
    private UserService userService;

    @PostMapping(path = "/api/admin/add-user", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<User> addUser(@RequestBody Map<String, String> params) {
        try {
            String name = params.get("name");
            String username = params.get("username");
            String password = params.get("password");
            String confirmPassword = params.get("confirmPassword");
            String email = params.get("email");
            String phone = params.get("phone");
            String avtUrl = params.get("avt");

            User newUser = new User();
            newUser.setName(name);
            newUser.setUsername(username);
            newUser.setPassword(password);
            newUser.setEmail(email);
            newUser.setPhone(phone);
            newUser.setAvatar(avtUrl);

            if (password.equals(confirmPassword)) {
                User u = this.userService.addU(newUser); 
                return new ResponseEntity<>(u, HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/api/admin/add-driver", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Driver> addDriver(@RequestBody Map<String, String> params) {
        try {

            String userIdDriver = params.get("userIdDriver");
            String identityCard = params.get("identityCard");
            String address = params.get("address");
            String dateOfBirth = params.get("dateOfBirth");
            String license = params.get("license");

            Driver drv = new Driver();
            
            drv.setUserIdDriver(Integer.parseInt(userIdDriver));
            drv.setIdentitycard(Integer.parseInt(identityCard));
            drv.setAddress(address);
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateOfBirth);
            drv.setDateofbirth(date);
            drv.setLicense(license);
            
            Driver newDrv = this.driverService.addD(drv);

            return new ResponseEntity<>(newDrv, HttpStatus.CREATED);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
