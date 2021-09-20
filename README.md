# AcademyPortal
Contains code for Academy Portal project based on Spring MVC and Hibernate


Academy Portal is a web application created using Java, Spring MVC, JSP Pages, Hibernate and MYSQL.
Web Application comprises of Entities that are 

1.) Employee

2.) Faculty (who teaches employee)

3.) Admin (Manages all activities in system)

Basically a employee can register himself and enroll himself to Modules and Batches and learn new skills

Faculty can register himself in portal and can add his skills to teach employee

Admin has right to reject and Aprrove employee and Faculty based on data entered, he can add new modules in system, 
he can map a particular module to an Faculty and can create batch for employees

It is maven project and has some dependencies

1) Spring Webmvc

2) mysql-connector-java

3) spring-orm

4) hibernate-core

5) tomcat-jasper

6) servlet-api

7) jstl

When we run web application

It runs on Apache tomcat server 8.5
----->  Server Starts
----> it loads ---->Web.xml(here dispatcher servlet is configured)
---->tries to find (dispatcher-servlet.xml) Here all beans are declared and configured for ex- HibernateTemplate
----> If (dispatcher-servlet.xml) is found DispatcherServlet gets initialized successfully.

Further DispatcherServlet maps each request from jsp to corresponding controller classes and its corresponding request methods which again returns view and data.






