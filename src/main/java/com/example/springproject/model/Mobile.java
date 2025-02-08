package com.example.springproject.model;

public class Mobile {
    private int id;
    private String name;
    private String brand;
    private double price;

    public Mobile(int id, String name, String brand, double price) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.price = price;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getBrand() { return brand; }
    public double getPrice() { return price; }
}
