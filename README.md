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

Common Sign Up Page for (Admin, Employee and Faculty)

![Screenshot (182)](https://user-images.githubusercontent.com/90125484/134493040-8e845ee0-ef79-4da2-97e4-9224069194a4.png)


Admin has right to reject and Aprrove employee and Faculty based on data entered, he can add new modules in system, 
he can map a particular module to an Faculty and can create batch for employees

Admins Dashboard on Login successfully

![Screenshot (183)](https://user-images.githubusercontent.com/90125484/134493153-f6ac6140-273c-41f5-93bc-8b29de2f0556.png)

![Screenshot (184)](https://user-images.githubusercontent.com/90125484/134493185-87d4bf7d-88a0-4adc-8c39-147ead2fbbd3.png)

![Screenshot (187)](https://user-images.githubusercontent.com/90125484/134493537-852b8752-6418-48fc-b7e6-d0419c74215b.png)

Admin can add new Module to system

![Screenshot (185)](https://user-images.githubusercontent.com/90125484/134493276-7ffa0c7b-0f19-4036-bc8e-104f8e551232.png)

Admin can add new Batch for respective Module

![Screenshot (195)](https://user-images.githubusercontent.com/90125484/134495074-3384f54b-8f75-41a5-a04e-240f16bf6e0a.png)

Facultys Dashboard
Faculty can approve or reject Module assigned for Admin.

![Screenshot (194)](https://user-images.githubusercontent.com/90125484/134495115-e5280037-9b66-4006-bb4a-033c8b6969a2.png)

![Screenshot (190)](https://user-images.githubusercontent.com/90125484/134493717-ae678dcd-a172-4346-9224-e21e6cf8cc41.png)

Employee's Dashboard
Employee can see all Modules added
Employee can register in a Batch until it is full.

![Screenshot (191)](https://user-images.githubusercontent.com/90125484/134493881-c9e6cbce-2384-4b6f-9827-fa9c1b0d7d0c.png)

![Screenshot (192)](https://user-images.githubusercontent.com/90125484/134493925-ba8f6b9c-71e9-4420-b2d9-a687c85ce63a.png)

Database Used is Mysql
Database Name - ap

![Screenshot (193)](https://user-images.githubusercontent.com/90125484/134494046-7a6ee7e8-ad54-410e-a65b-56cbc03933b2.png)




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






