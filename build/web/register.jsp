<%-- 
    Document   : register
    Created on : Dec 9, 2020, 8:59:23 PM
    Author     : ASUS
--%>

<%@page import="com.tech.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <%@include file="normal_navbar.jsp" %>
    </head>
    
    
    <center>
        <h1>Registration </h1></center>
    <%
Message m=(Message)session.getAttribute("msg");
if(m!=null){

%>
<div class="alert alert-primary" role="alert">

 <%= m.getContent() %>
</div>

<%

     session.removeAttribute("msg");
     }

%>
 
    
    
   <body >
       <form id="reg-form" action="RegisterServlet" method="POST" style="center">
  <div class="row">
    <div class="col">
          <label for="inputEmail4">Name</label>
          <input type="text" class="form-control" name="user_name" placeholder=" Name" required>
    </div>
   
      
  </div>
    
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" name="user_email" placeholder="Email" required>
    </div>
      <br>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="inputPassword4" name="user_password" placeholder="Password" required>
    </div>
  </div>
  
   
       <div class="form-check form-check-inline">
           <label class="form-check-label" for="inlineRadio1">&nbsp Gender &nbsp; &nbsp;</label><br><br>        
     <input class="form-check-input" type="radio" id="inlineRadio1"  name="user_gender" value="Male" required>
  <label class="form-check-label" for="inlineRadio1">  Male</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio"  id="inlineRadio2" name="user_gender" value="Female">
  <label class="form-check-label" for="inlineRadio2">Female</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio"  id="inlineRadio3" name="user_gender" value="other" >
  <label class="form-check-label" for="inlineRadio3">Other</label>
</div>    
 </div>          
           
  <div class="form-group ">
    <label for="inputaddress">Address </label>
    <input type="text" class="form-control" id="inputaddress" name="user_address" placeholder="Apartment or floor" required >
  </div>
  
  <div class="form-group">
    <div class="form-check">
        <input class="form-check-input" type="checkbox" id="gridCheck" name="check">
      <label class="form-check-label" for="gridCheck">
        Accepeting all terms and conditions....
      </label>
    </div>
  </div>
  <button type="submit" class="btn btn-dark" >Register</button>
  
</form>

     

</body>
</html>
