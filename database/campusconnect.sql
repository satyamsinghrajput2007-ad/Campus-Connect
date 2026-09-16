CREATE DATABASE IF NOT EXISTS campusconnect CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE campusconnect;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS event_registrations, claims, events, lost_found_items, complaints, students, users;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE users (
 id INT PRIMARY KEY AUTO_INCREMENT,
 email VARCHAR(120) NOT NULL UNIQUE,
 password_hash VARCHAR(100) NOT NULL,
 role ENUM('ADMIN','STUDENT') NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 INDEX idx_users_role(role)
);
CREATE TABLE students (
 user_id INT PRIMARY KEY,
 student_id VARCHAR(30) NOT NULL UNIQUE,
 name VARCHAR(100) NOT NULL,
 phone VARCHAR(10) NOT NULL UNIQUE,
 department VARCHAR(100) NOT NULL,
 semester TINYINT NOT NULL,
 hostel_room VARCHAR(50) NOT NULL,
 registration_date DATE NOT NULL,
 CONSTRAINT fk_students_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
 CONSTRAINT chk_semester CHECK(semester BETWEEN 1 AND 8)
);
CREATE TABLE complaints (
 id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT NOT NULL,
 category ENUM('Electrical','Plumbing','Internet','Cleaning','Furniture','Other') NOT NULL,
 description TEXT NOT NULL,
 priority ENUM('Low','Medium','High','Critical') NOT NULL,
 status ENUM('Pending','In Progress','Resolved','Rejected') NOT NULL DEFAULT 'Pending',
 resolution_remarks VARCHAR(500),
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY(student_id) REFERENCES students(user_id) ON DELETE CASCADE,
 INDEX idx_complaints_student(student_id), INDEX idx_complaints_status(status)
);
CREATE TABLE lost_found_items (
 id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(120) NOT NULL,
 description TEXT NOT NULL,
 category ENUM('Electronics','Documents','Accessories','Books','Clothing','Other') NOT NULL,
 location VARCHAR(150) NOT NULL,
 item_date DATE NOT NULL,
 status ENUM('Lost','Found','Claimed','Returned') NOT NULL,
 posted_by INT NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(posted_by) REFERENCES students(user_id) ON DELETE CASCADE,
 INDEX idx_lost_category(category), INDEX idx_lost_status(status), INDEX idx_lost_posted(posted_by)
);
CREATE TABLE claims (
 id INT PRIMARY KEY AUTO_INCREMENT,
 item_id INT NOT NULL,
 student_id INT NOT NULL,
 status ENUM('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(item_id) REFERENCES lost_found_items(id) ON DELETE CASCADE,
 FOREIGN KEY(student_id) REFERENCES students(user_id) ON DELETE CASCADE,
 UNIQUE KEY uq_claim(item_id,student_id), INDEX idx_claim_status(status)
);
CREATE TABLE events (
 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(150) NOT NULL,
 description TEXT NOT NULL,
 venue VARCHAR(150) NOT NULL,
 event_date DATE NOT NULL,
 event_time TIME NOT NULL,
 capacity INT NOT NULL,
 organizer VARCHAR(120) NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 CHECK(capacity > 0), INDEX idx_events_date(event_date)
);
CREATE TABLE event_registrations (
 id INT PRIMARY KEY AUTO_INCREMENT,
 event_id INT NOT NULL,
 student_id INT NOT NULL,
 registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(event_id) REFERENCES events(id) ON DELETE CASCADE,
 FOREIGN KEY(student_id) REFERENCES students(user_id) ON DELETE CASCADE,
 UNIQUE KEY uq_event_student(event_id,student_id), INDEX idx_reg_event(event_id), INDEX idx_reg_student(student_id)
);

-- BCrypt hash below is for the demo password: password
INSERT INTO users(id,email,password_hash,role) VALUES
(1,'admin@campusconnect.com','$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy','ADMIN'),
(2,'student@campusconnect.com','$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy','STUDENT'),
(3,'aarav@campusconnect.com','$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy','STUDENT');
INSERT INTO students VALUES
(2,'CC001','Student Demo','9876543210','Computer Science',2,'B7-214','2026-07-20'),
(3,'CC002','Aarav Sharma','9876543211','Artificial Intelligence',2,'B6-112','2026-07-21');
INSERT INTO complaints(student_id,category,description,priority,status,resolution_remarks) VALUES
(2,'Internet','Wi-Fi disconnects repeatedly in hostel room.','High','Pending',NULL),
(3,'Electrical','Study lamp socket is not working.','Medium','Resolved','Socket replaced by maintenance team.');
INSERT INTO lost_found_items(title,description,category,location,item_date,status,posted_by) VALUES
('Black Wallet','Black leather wallet found near the library entrance.','Accessories','Central Library','2026-09-10','Found',3),
('USB Drive','Small black 64GB USB drive lost after lab session.','Electronics','AB2 Lab 204','2026-09-11','Lost',2);
INSERT INTO events(name,description,venue,event_date,event_time,capacity,organizer) VALUES
('Campus Tech Meetup','Student technology networking and mini talks.','Auditorium','2026-09-25','15:00:00',100,'EvolVIT'),
('Java Workshop','Hands-on Java OOP and JDBC workshop.','AB2 Lab 301','2026-09-28','10:00:00',60,'Programming Club'),
('Hackathon Orientation','Briefing and team formation for the next campus hackathon.','Innovation Hub','2026-10-03','11:00:00',80,'Innovation Cell');
INSERT INTO event_registrations(event_id,student_id) VALUES(1,2),(2,3);
