<%@page import="java.util.List"%>
<%@page import="com.tech.entities.Post"%>
<%@page import="com.tech.dao.PostDao"%>
<%@page import="com.tech.helper.ConnectionProvider"%>



<div class="row ">
<%
    PostDao dao=new PostDao(ConnectionProvider.getConnection());
    List<Post> posts=dao.getAllPosts();
    for(Post p:posts){     
  %>      
  
  <div class="col-md-6 mt-2">
        
    <div class="card ">
        <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" style="width: 350px"  > 
        <div class="card-body ">
        <b><%= p.getpTitle().toUpperCase() %></b>
        <p><%= p.getPContent()%></p>
        <pre><%= p.getpCode() %></pre>
        
      </div>
        <div class="card-footer bg-dark text-center">
           
            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span> 20</span></i></a>
            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span> 20</span></i></a>
            <a href="show_blog_page.jsp?pid=<%= p.getpId() %>" class="btn btn-outline-light btn-sm">Read More...</a>
        </div>
    </div>
 
  

 </div>

<%
}
%>
