A simple and clean Online Book Store built using Java Servlets, JSP, JDBC, and MySQL. This project allows users to browse books, add them to a cart, and make purchases, while admins can manage the book inventory.
---
## Technologies Used
- *Frontend*: HTML, CSS, JSP
- *Backend*: Java Servlets, JDBC
- *Database*: MySQL
- *Server*: Apache Tomcat 11
- *Java EE*: Jakarta EE 10 (jakarta.servlet.*)
---
## Setup Instructions
1. *Clone the Repository*
2. *Open in Eclipse/IDE* with Apache Tomcat 11 configured
3. *Add MySQL Connector JAR*:  
   - Download from: [https://dev.mysql.com/downloads/connector/j/](https://dev.mysql.com/downloads/connector/j/)
   - Add to the lib folder or project build path
4. *Setup MySQL Database*:  
   - Create database onlinebookstore
   - Create necessary tables (users, admin, books, cart)
5. *Update DB Credentials* in DBConnection.java
6. *Deploy on Tomcat*
7. *Run in Browser*:  
   http://localhost:8080/OnlineBookStore/
---
