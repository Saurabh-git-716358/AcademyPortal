# AcademyPortal
Contains code for Academy Portal project based on Spring MVC and Hibernate


Academy Portal is a web application created using Java, Spring MVC, JSP Pages, Hibernate and MYSQL.

Home Page

![Screenshot (177)](https://user-images.githubusercontent.com/90125484/134484299-6712cee1-1517-45c1-8ccc-e5ec555bb0c0.png)

Web Application comprises of Entities that are 

1.) Employee

2.) Faculty (who teaches employee)

3.) Admin (Manages all activities in system)

Basically a employee can register himself but will be approved by Admin and later enroll himself to Modules(Subjects) and Batches and learn new skills.

Employee Registration Page

![Screenshot (178)](https://user-images.githubusercontent.com/90125484/134484936-d1066148-d03a-42bd-873e-867ba52cac3a.png)

![Screenshot (179)](https://user-images.githubusercontent.com/90125484/134485158-6e6d14c3-2472-442b-b82e-db7df92aa5b0.png)

Faculty can register himself in portal and can add his skills to teach employee
Faculty has to choose different skill Family and skill list and provide proficiency.

Facultys Registration 

![Screenshot (180)](https://user-images.githubusercontent.com/90125484/134485347-ce9beff3-2cd9-4823-a0e4-5b9eb351a32a.png)

![Screenshot (181)](https://user-images.githubusercontent.com/90125484/134485544-3013859a-bec3-45c2-a053-dde8446b9015.png)

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






