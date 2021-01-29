<%-- 
    Document   : login_page
    Created on : Dec 9, 2020, 8:47:41 PM
    Author     : ASUS
--%>
<%@page import="com.tech.entities.Message"%>
<!-- JavaScript Bundle with Popper -->
<!-- CSS only -->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Log In</title>
  <style>
    
     body{
            background: url(img/s1.jpg);
            background-size: cover;
            background-attachment: fixed;
            
        }
    
</style>   
</head>

<body >

<center>
      <%@include file="normal_navbar.jsp" %>
     <div class="container text-center" >
<br><br><br>
      </div>
<!-- Invalid Details Error Msg  -->
<%
    
    
Message m=(Message)session.getAttribute("msg");
if(m!=null){

%>
<div class="alert alert-primary" role="alert">
    <%=m.getContent()%>
</div>

<%

     session.removeAttribute("msg");
     }

%>





<div class="card col-md-4 "  > 

<div class="card-header bg-dark text-white">
      <h1>Log In</h1>
</div>
    <div class="card-body  card-row-4 " >
<form action="LoginServlet" method="post" class="text-dark">
   
 <br>Email Id:   <input type="email" name="email" required><br>
<br>Password:    <input type="password" name="password" required><br>

</div>
     
     <div class="card-footer">
        <br><input type="submit" class="btn btn-dark" value="Log IN">
<a href="register.jsp"><input type="button" class="btn btn-dark" value="Register"></a>
</form>
</div>   
    </div>     
</center>
</body>
</html>