# System Architecture

```mermaid
flowchart LR
  V[JavaFX FXML Views] --> C[Controllers]
  C --> S[Service Layer]
  S --> D[DAO Layer]
  D --> J[JDBC]
  J --> M[(MySQL)]
  S --> U[Utility / Validation / Session]
  D --> E[Custom Exceptions]
```

Controllers never contain SQL. Services contain business rules such as event capacity and duplicate registration prevention. DAOs use prepared statements and try-with-resources.
