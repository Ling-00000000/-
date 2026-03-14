package com.entity;

public class Volunteer {
    private Integer id;
    private String name;
    private Integer age;
    private String phone;
    private String serviceType;
    private Integer serviceTime;

    // 无参、有参构造器
    public Volunteer() {}
    public Volunteer(String name, Integer age, String phone, String serviceType, Integer serviceTime) {
        this.name = name;
        this.age = age;
        this.phone = phone;
        this.serviceType = serviceType;
        this.serviceTime = serviceTime;
    }

    // getter和setter方法
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getServiceType() { return serviceType; }
    public void setServiceType(String serviceType) { this.serviceType = serviceType; }
    public Integer getServiceTime() { return serviceTime; }
    public void setServiceTime(Integer serviceTime) { this.serviceTime = serviceTime; }
}