package com.campusconnect.model;

public class User {
    private int id;
    private String email;
    private String passwordHash;
    private String role;
    public User() {}
    public User(int id,String email,String passwordHash,String role){this.id=id;this.email=email;this.passwordHash=passwordHash;this.role=role;}
    public int getId(){return id;} public void setId(int v){id=v;}
    public String getEmail(){return email;} public void setEmail(String v){email=v;}
    public String getPasswordHash(){return passwordHash;} public void setPasswordHash(String v){passwordHash=v;}
    public String getRole(){return role;} public void setRole(String v){role=v;}
}
