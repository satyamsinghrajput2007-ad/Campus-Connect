package com.campusconnect.util;
public final class EventCapacityUtil { private EventCapacityUtil(){} public static boolean canRegister(int capacity,int registered){return capacity>0&&registered>=0&&registered<capacity;} }
