<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.dao.UserDao"%>
<%@page import="com.tech.entities.Post"%>
<%@page import="com.tech.dao.PostDao"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page import="com.tech.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
 User user=(User)session.getAttribute("currentUser");
 if(user==null)
 {
  response.sendRedirect("login_page.jsp");
 }

%>

 <% 
     int postId= Integer.parseInt(request.getParameter("pid"));
    PostDao d =new PostDao(ConnectionProvider.getConnection());
     
     Post p=d.getPostByPostId(postId);
    

 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || TechBlog</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        
        .post-content{
            
            font-size: 18px;
        }
        .post-date{
            
            font-style: italic;
        }
        .row-user{
            border: 1px solid #e2e2e2;
            padding-top: 15px;
            
        }
        body{
            background: url(img/bg.jpg);
            background-size: cover;
            background-attachment: fixed;
            
        }
    </style>
    
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0" nonce="bbWgeUJA"></script>
    
    
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0" nonce="WTbUGqJm"></script>
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
            <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-home">&nbsp;Home</span></a>
        </li>
        <li class="nav-item" >
            <a class="nav-link" href="#"> <span class="fa fa-id-card">&nbsp;About</span></a>
        </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="post.jsp"><span class="fa fa-plus-square">&nbsp;Post</span></a>
        </li>
      </ul>
        <ul class="navbar-nav " >
         
         <li class="nav-item" >
            
             <a class="nav-link " href="profile.jsp" data-toggle="modal" data-target="#profile-model"><span class="fa fa-user-circle">&nbsp;Profile</span></a>
        </li>
        
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
     
     
     
     
     
     
     
     
   <!--- Main Content of body  -->
     
   <div class="container">
       <div class="row my-4">
           <div class="col-md-8 offset-md-2">
               <div class="card">
                   <div class="card-header bg-dark text-white">
                       <h4><%= p.getpTitle().toUpperCase() %></h4>
                   </div>
                   <div class="card-body">
                       <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>"  style="height: 400px" > 
                    
                       <div class="row my-3 row-user">
                           <div class=" col-md-8">
                               <% UserDao ud=new UserDao(ConnectionProvider.getConnection()); %>
                               <p class="post-user.info"><a href="#!"><%= ud.getUserByUserId(p.getUserId()).getName() %></a> Posted:</P>
                            
                           </div>
                           <div> 
                               <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
                           
                           </div>
                       </div>
                       
                       
                       <p class="post-content"><%= p.getPContent()%>  </p>
                   <br>
                   <br>
                   <div class="post-code">
                        <pre><%= p.getpCode() %></pre>
                   </div>
                   </div>
                   <div class="card-footer">
                   
                    <div class="card-footer bg-dark text-center">
           
                        <a href="#!    " class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span></span></i></a>
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span></span></i></a>
                    </div>
                   
                    <div class="card-footer">
                        <div class="fb-like" data-href="http://localhost:8080/TechBlog1/show_blog_page.jsp?pid=<%= p.getpId() %>" data-width="" data-layout="standard" data-action="like" data-size="large" data-share="true"></div>
                        <div class="fb-comments" data-href="http://localhost:8080/TechBlog1/show_blog_page.jsp?pid=<%= p.getpId() %>" data-width="" data-numposts="5"></div>
                        
                    </div>
                    
                   
                   </div>
                   
               </div>   
               </div>
           </div>
       </div>
   </div>    
          
          
          
          
          
          
          
          
          
          
          
   <!--- Main Content of body  -->
          
          
        <!-- Profile modal -->
<!-- Modal -->
<div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-dark text-white ">
          <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width:150px;">
               <h5 class="modal-title mt-2" id="exampleModalLabel"><center><%=  user.getName() %></h5>
          </div> 
               <!-- //User Data to Display -->

            <!-- //Table Start  -->
          
            <div id="profile-details">
          <table class="table">
 
           <tbody>
                <tr>
                        <th scope="row">User Id</th>
                        <td><%= user.getId() %></td>
      
                </tr>
                 <tr>
                        <th scope="row">Email Id</th>
                        <td><%= user.getEmail() %></td>
     
                </tr>
                 <tr>
                        <th scope="row">Gender</th>
                        <td><%= user.getGender() %></td>
      
                </tr>
                 <tr>
                        <th scope="row">Address</th>
                        <td><%=user.getAddress() %></td>
      
                </tr>
            </tbody>
            
          </table>
           <!-- //Table Ends  -->
          </div>
           <!-- //Profile Edit  -->
          <a href="update.jsp"><input type="button" class="btn btn-dark" value="Update"></a>
          
       
      
      </div>
    </div>   
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>
 <!-- Profile modal ends -->
 <!-- Post modal Start -->
 <!-- Post modal ends -->  
          
          
   
    
    </body>
</html>
    
    
    
    