package com.campusconnect.controller;
import com.campusconnect.exception.*; import com.campusconnect.model.User; import com.campusconnect.service.AuthService; import com.campusconnect.util.SessionManager; import javafx.fxml.FXML; import javafx.scene.control.*;
public class LoginController { @FXML private TextField emailField; @FXML private PasswordField passwordField; @FXML private Label messageLabel; private final AuthService auth=new AuthService();
 @FXML private void login(){try{User u=auth.authenticate(emailField.getText(),passwordField.getText());SessionManager.login(u);UiUtil.scene(emailField,"ADMIN".equals(u.getRole())?"admin-dashboard.fxml":"student-dashboard.fxml");}catch(AuthenticationException|ValidationException e){messageLabel.setText(e.getMessage());}catch(Exception e){messageLabel.setText("Unable to sign in. Check database configuration.");}}
}
