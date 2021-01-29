4<%-- 
    Document   : post
    Created on : Dec 16, 2020, 7:35:59 PM
    Author     : ASUS
--%>

<%@page import="com.tech.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.entities.Category"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page import="com.tech.dao.PostDao"%>
<%@page import="com.tech.entities.Message"%>
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
      
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

      <style>
    
     body{
            background: url(img/bg.jpg);
            background-size: cover;
            background-attachment: fixed;
            
        }
    
</style>   
    </head>
    <body>
        <%--Start of navbar--%>
         
        
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
     <a class="navbar-brand" href="index.jsp"><span class="fa fa-camera-retro"> TECHBLOG </span></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="profile.jsp"><span class="fa fa-home">&nbsp;Home</span></a>
        </li>
      
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="post.jsp"><span class="fa fa-plus-square">&nbsp;Post</span></a>
        </li>
      </ul>
        <ul class="navbar-nav " >
         
       
        
             <li class="nav-item" >
            <a class="nav-link " href="LogoutServlet"><span class="fa fa-power-off">&nbsp;Logout</span></a>
        </li> 
       
            
        </ul>
         </div> 
       </div>
            
        </ul>
        
        
    </div>
  </div>
</nav>
        
        
          <%--End of navbar--%>
         
    
        
    <div class="container mt-4"  
    <body>
            <h1><center><div class="text-white"> <span  class="fa fa-plus-square"  >Add New Post</span></div></center></h1>
           <center>  <div class="card bg-light mb-3" style="max-width: 40rem; max-height: 40rem;">
                 <center><div class="card-header">Details</div></center>
 
          <form id="reg-form" action="AddPostServlet" method="POST" enctype="multipart/form-data" style="center">
   
             
              <select class="form-control" name="cid">
                  <option selected disabled>---Select Category---</option>
                  <%
                  PostDao postd=new PostDao(ConnectionProvider.getConnection());
                  ArrayList<Category> list=postd.getAllCategories();
                  for(Category c:list){
                  
                  %>
                  <option value="<%=c.getCid()%>"><%=c.getName()%></option>
               <% }%> 
              </select>
                 
              
              
    <div class="row">
    <div class="col">
          <label for="inputname" class="mt-3">Title</label>
          <input type="text" class="form-control" name="pTitle"  value="" required>
    </div>  
  </div>
    
  <div class="form-row">
    <div class="form-group col-md-6 ">
        <label for="inputContent"class="mt-3" >Content</label>
      <textarea class="form-control"style="height: 200px" id="inputEmail4" name="pContent" value="" required></textarea>
    </div>
      <br>
       <div class="form-group col-md-6">
      <label for="inputCode"class="mt-3">Code (If Any)</label>
      <textarea class="form-control"style="height: 200px" id="inputEmail4" name="pCode" value="" required></textarea>
    </div>
   
  </div>
         
  <div class="form-group ">
      <label for="inputprofile"class="mt-3">Select Picture (If Any) : </label>
      
      <input type="file"  name="pPic" >
  </div>
              
  <button type="submit" class="btn btn-dark" > Post</button>
     <a href="profile.jsp"><input type="button" class="btn btn-dark" value="Cancel"></a>
      </div>   
     
  
</form>
               </div></center>
            
 
    </div>
     
   

    </body>
</html>
