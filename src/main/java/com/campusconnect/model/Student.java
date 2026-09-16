package com.campusconnect.model;
import java.time.LocalDate;
public class Student extends User {
    private String studentId,name,phone,department,hostelRoom; private int semester; private LocalDate registrationDate;
    public Student() { super(); }
    public Student(int id,String email,String hash,String role,String studentId,String name,String phone,String department,int semester,String hostelRoom,LocalDate registrationDate){super(id,email,hash,role);this.studentId=studentId;this.name=name;this.phone=phone;this.department=department;this.semester=semester;this.hostelRoom=hostelRoom;this.registrationDate=registrationDate;}
    public String getStudentId(){return studentId;} public void setStudentId(String v){studentId=v;} public String getName(){return name;} public void setName(String v){name=v;} public String getPhone(){return phone;} public void setPhone(String v){phone=v;} public String getDepartment(){return department;} public void setDepartment(String v){department=v;} public int getSemester(){return semester;} public void setSemester(int v){semester=v;} public String getHostelRoom(){return hostelRoom;} public void setHostelRoom(String v){hostelRoom=v;} public LocalDate getRegistrationDate(){return registrationDate;} public void setRegistrationDate(LocalDate v){registrationDate=v;}
}
