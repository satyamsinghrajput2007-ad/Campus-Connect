package com.campusconnect;
import com.campusconnect.exception.ValidationException; import com.campusconnect.model.Complaint; import com.campusconnect.service.ComplaintService; import com.campusconnect.util.*; import org.junit.jupiter.api.Test; import static org.junit.jupiter.api.Assertions.*;
class ValidationTest {
 @Test void validEmailAndPhone(){assertDoesNotThrow(()->ValidationUtil.email("student@example.com"));assertDoesNotThrow(()->ValidationUtil.phone("9876543210"));}
 @Test void invalidEmailAndPhone(){assertThrows(ValidationException.class,()->ValidationUtil.email("bad-email"));assertThrows(ValidationException.class,()->ValidationUtil.phone("123"));}
 @Test void loginInputValidation(){assertThrows(ValidationException.class,()->ValidationUtil.email(""));assertThrows(ValidationException.class,()->ValidationUtil.required("","Password"));}
 @Test void eventCapacity(){assertTrue(EventCapacityUtil.canRegister(10,9));assertFalse(EventCapacityUtil.canRegister(10,10));assertFalse(EventCapacityUtil.canRegister(0,0));}
 @Test void complaintValidation(){Complaint c=new Complaint();c.setStudentId(1);assertThrows(ValidationException.class,()->new ComplaintService().create(c));}
}
