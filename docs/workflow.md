# Application Workflow

1. User opens CampusConnect and sees the login screen.
2. Credentials are checked against the `users` table using a BCrypt password hash.
3. A session is created with the authenticated role.
4. Students enter the student dashboard and access profile, complaints, lost/found and events.
5. Administrators enter the admin dashboard and access statistics plus student/complaint/lost-found/event management.
6. Service classes validate input and apply business rules before DAO operations.
7. DAOs execute parameterized SQL and return model objects.
8. JavaFX controllers refresh tables/cards and show user-friendly alerts.
