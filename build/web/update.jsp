<%-- 
    Document   : update
    Created on : Dec 13, 2020, 8:35:51 PM
    Author     : ASUS
--%>

<%@page import="com.tech.entities.Message"%>
<%@page import="com.tech.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 User user=(User)session.getAttribute("currentUser");
 if(user==null)
 {
  response.sendRedirect("login_page.jsp");
 }



%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
         <%--Start of navbar--%>
        
        
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
      <a class="navbar-brand" href="#"><span class="fa fa-camera-retro"> TECHBLOG </span></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"> Home </a>
        </li>
        <li class="nav-item" >
          <a class="nav-link" href="#"> About</a>
        </li>
      </ul>
        <ul class="navbar-nav " >
         
         
        <li class="nav-item" >
             <a class="nav-link " href="LogoutServlet"> Logout</a>
        </li>      
        </ul>
      
            
        </ul>
        
        
    </div>
  </div>
</nav>
        
        
          <%--End of navbar--%>
    </head>
    
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
 
    
    
    
    
    
    
    
    
    
    
    <div class="container mt-5"  
    <body>
            <h1><center>Update Profile</center></h1>
            
            <div class="container text-center">
              <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width:150px;">
               <h5 class="modal-title mt-2" id="exampleModalLabel"><center><%=  user.getName() %></h5>
          </div> 
          <form id="reg-form" action="UpdateServlet" method="POST" enctype="multipart/form-data" style="center">
  <div class="row">
    <div class="col">
          <label for="inputname">Name</label>
          <input type="text" class="form-control" name="user_name"  value="<%=user.getName() %>" required>
    </div>
   
      
  </div>
    
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" name="user_email" value="<%=user.getEmail()%>" required>
    </div>
      <br>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="inputPassword4" name="user_password" value="<%=user.getPassword()%>" required>
    </div>
  </div>
    <div class="form-group col-md-6">
        <label for="inputPassword4">Gender :</label>&nbsp;&nbsp;<%=user.getGender()%>
     
    </div>

   
           
           
  <div class="form-group ">
    <label for="inputaddress">Address </label>
    <input type="text" class="form-control" id="inputaddress" name="user_address" value="<%=user.getAddress()%>" required >
  </div>
  
  <div class="form-group ">
    <label for="inputprofile">Profile Picture </label>
    <input type="file" class="form-control" name="user_profile" >
  </div>
  <button type="submit" class="btn btn-primary" > Update</button>
   
     
       
     <a href="profile.jsp"><input type="button" class="btn btn-primary" value="Cancel"></a>
      </div>   
     
  
</form>
    </div>
     

</body>
    </body>
</html>
