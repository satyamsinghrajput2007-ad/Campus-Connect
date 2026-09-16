package com.campusconnect.util;
import com.campusconnect.exception.ValidationException;
public final class ValidationUtil { private ValidationUtil(){}
 public static void required(String value,String field){if(value==null||value.isBlank())throw new ValidationException(field+" is required.");}
 public static void email(String value){required(value,"Email");if(!value.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"))throw new ValidationException("Enter a valid email address.");}
 public static void phone(String value){required(value,"Phone");if(!value.matches("[0-9]{10}"))throw new ValidationException("Phone must contain exactly 10 digits.");}
 public static void positive(int value,String field){if(value<=0)throw new ValidationException(field+" must be greater than zero.");}
 public static void semester(int value){if(value<1||value>8)throw new ValidationException("Semester must be between 1 and 8.");}
}
