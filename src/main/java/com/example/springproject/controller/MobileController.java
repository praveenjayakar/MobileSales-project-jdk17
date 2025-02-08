package com.example.springproject.controller;

import com.example.springproject.model.Mobile;
import com.example.springproject.service.MobileService;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/mobiles")
public class MobileController {
    private final MobileService mobileService;

    public MobileController(MobileService mobileService) {
        this.mobileService = mobileService;
    }

    @GetMapping("/brands")
    public List<String> getAllBrands() {
        return mobileService.getAllBrands();
    }

    @GetMapping("/brand/{brandName}")
    public List<Mobile> getMobilesByBrand(@PathVariable String brandName) {
        return mobileService.getMobilesByBrand(brandName);
    }

    @GetMapping("/{id}")
    public Mobile getMobileById(@PathVariable int id) {
        return mobileService.getMobileById(id);
    }
}
