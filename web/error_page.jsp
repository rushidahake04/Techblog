<%-- 
    Document   : error_page
    Created on : Dec 12, 2020, 3:58:37 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="True"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry Some Thing Went Wrong</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid">
            <h3 class="display-3">Sorry ! Something Went wrong....</h3>
            <%=exception %>
            <button class="btn btn-primary mt-3" onclick="document.location='index.jsp'">Home</button>
            
        </div>
        
        
        
    </body>
</html>
