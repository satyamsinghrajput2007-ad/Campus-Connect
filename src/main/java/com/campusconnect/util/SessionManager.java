package com.campusconnect.util;
import com.campusconnect.model.User;
public final class SessionManager { private SessionManager(){} private static User currentUser; public static void login(User u){currentUser=u;} public static User getUser(){return currentUser;} public static boolean isAdmin(){return currentUser!=null&&"ADMIN".equals(currentUser.getRole());} public static void logout(){currentUser=null;} }
