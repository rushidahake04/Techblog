/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.servlets;

import com.tech.dao.UserDao;
import com.tech.entities.Message;
import com.tech.entities.User;
import com.tech.helper.ConnectionProvider;
import com.tech.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.omg.CORBA.portable.InputStream;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class UpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
         {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");

            //fetch all data
            
        String userName=request.getParameter("user_name");
        String userEmail=request.getParameter("user_email");
        String userPassword=request.getParameter("user_password");
        //String userGender=request.getParameter("user_Gender");
        String userAddress=request.getParameter("user_address");
        Part part=request.getPart("user_profile");
        String imageName=part.getSubmittedFileName();
            
        //get session  
        HttpSession s=request.getSession();
        User user=(User)s.getAttribute("currentUser");
        
        user.setName(userName);
        user.setEmail(userEmail);
        user.setPassword(userPassword);
        user.setAddress(userAddress);
        String oldFile=user.getProfile();
        user.setProfile(imageName);
        
        //Update Database
        UserDao userDao=new UserDao(ConnectionProvider.getConnection());        
        boolean ans=userDao.updateUser(user);
        if(ans)
        {
            out.println("Updated To Database");
            String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
           
                //delete old file
          String patholdFile=request.getRealPath("/")+"pics"+File.separator+oldFile;

          if(!oldFile.equals("default.png"))
          {
              Helper.deleteFile(patholdFile);
     Message msg=new Message("Updated SuccessFully","success","alert-success");
                  s.setAttribute("msg",msg);
              
              
              RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
              rs.forward(request,response);
                 
             
          }
           
            
            
            if( Helper.saveFile((InputStream) part.getInputStream(), path))
            {
                   
                out.println("Profile Updated");
             
            } else {
                }
        
        
        }
        else
        {
            out.println("Not Updated");
        }  
          
       // response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
