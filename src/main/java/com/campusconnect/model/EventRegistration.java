package com.campusconnect.model;
import java.time.LocalDateTime;
public class EventRegistration { private int id,eventId,studentId; private String eventName,studentName; private LocalDateTime registeredAt;
 public int getId(){return id;} public void setId(int v){id=v;} public int getEventId(){return eventId;} public void setEventId(int v){eventId=v;} public int getStudentId(){return studentId;} public void setStudentId(int v){studentId=v;} public String getEventName(){return eventName;} public void setEventName(String v){eventName=v;} public String getStudentName(){return studentName;} public void setStudentName(String v){studentName=v;} public LocalDateTime getRegisteredAt(){return registeredAt;} public void setRegisteredAt(LocalDateTime v){registeredAt=v;}}
