|<p>**🤝Campus Connect**</p></p><p>👤 Author: Satyam Singh</p><p>🆔 Registration Number : 25BAI10144</p><p>🏫 VIT Bhopal University</p><p>📘 Course: CSE2006 — Programming In Java</p>|
| :-: |

# CampusConnect

CampusConnect is a desktop-based university campus management platform built with Java 21, JavaFX 21, Maven, MySQL and JDBC. It provides role-based student/admin access for student records, hostel complaints, lost & found posts and campus events.

## Overview
The application centralizes common campus services in one clean desktop interface while demonstrating object-oriented programming, MVC separation, JDBC CRUD, validation, exception handling, collections, password hashing and basic asynchronous dashboard loading.

## Problem Statement
Campus services are often spread across separate forms, notice boards and manual processes. Students need a simple way to report hostel issues, recover lost property and discover/register for events, while administrators need a single place to manage these records.

## Objectives
- Provide secure role-based authentication.
- Digitize hostel complaint tracking.
- Provide a searchable lost-and-found workflow.
- Manage campus events and capacity-aware registrations.
- Demonstrate university-level Java and database concepts.

## Features
- BCrypt password hashing and role-based access.
- Student profile and dashboard.
- Student CRUD for administrators.
- Complaint creation, filtering, status/priority updates and remarks.
- Lost/found posting, search, filtering and claim requests.
- Event CRUD, registration, cancellation and capacity validation.
- Admin statistics cards.
- PreparedStatements, validation and custom exceptions.

## Functional Modules
1. Authentication
2. Student Management
3. Hostel Complaint System
4. Lost & Found
5. Campus Events
6. Admin Dashboard

## Technologies Used
| Technology | Purpose |
|---|---|
| Java 21 | Application language |
| JavaFX 21 | Desktop GUI |
| Maven | Build/dependency management |
| MySQL | Relational database |
| JDBC | Database access |
| jBCrypt | Password hashing |
| JUnit 5 | Automated tests |

## Architecture
The application follows Model + DAO + Service + Controller + View separation. Controllers coordinate UI events, services enforce business rules, DAOs perform JDBC operations, and models represent domain data.

## Project Structure
```text
CampusConnect/
├── pom.xml
├── README.md
├── .gitignore
├── statement.md
├── database/campusconnect.sql
├── docs/
│   ├── architecture.md
│   ├── workflow.md
│   └── uml/
│       ├── use-case.md
│       ├── class-diagram.md
│       └── sequence-diagram.md
└── src/
    ├── main/java/com/campusconnect/...
    ├── main/resources/css/style.css
    └── main/resources/fxml/...
```

## Database Schema
Tables: `users`, `students`, `complaints`, `lost_found_items`, `claims`, `events`, `event_registrations`. Foreign keys connect users/students to operational records, and a unique `(event_id, student_id)` constraint prevents duplicate registrations.

## Installation
### Prerequisites
- JDK 21+
- Maven 3.9+
- MySQL 8.0+

### MySQL Setup
1. Open MySQL Workbench or the MySQL CLI.
2. Run `database/campusconnect.sql`.
3. By default the application uses `localhost:3306/campusconnect`.

### Configuration
Set environment variables when your MySQL account differs from the defaults:
```text
CAMPUS_DB_URL=jdbc:mysql://localhost:3306/campusconnect?useSSL=false&serverTimezone=UTC
CAMPUS_DB_USER=root
CAMPUS_DB_PASSWORD=your_password
```

## How to Run
```bash
mvn clean install
mvn javafx:run
```

## Demo Credentials
- Admin: `admin@campusconnect.com` / `password`
- Student: `student@campusconnect.com` / `password`

The SQL file stores BCrypt hashes, not plain-text passwords.

## Testing
Run:
```bash
mvn test
```
Tests cover email/phone validation, login input validation, event capacity logic and complaint validation.

## Future Enhancements
- Email/push notifications.
- Profile photo uploads.
- QR-based event check-in.
- Admin analytics charts.
- Cloud deployment and university SSO.
