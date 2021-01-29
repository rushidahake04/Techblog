/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.servlets;

import com.tech.dao.PostDao;
import com.tech.entities.Message;
import com.tech.entities.Post;
import com.tech.entities.User;
import com.tech.helper.ConnectionProvider;
import com.tech.helper.Helper;
import java.io.File;
import java.io.FileInputStream;
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
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            int cid=Integer.parseInt(request.getParameter("cid"));
            String pTitle=request.getParameter("pTitle");
            String pContent=request.getParameter("pContent");
            String pCode=request.getParameter("pCode");
            Part part=request.getPart("pPic");
            
           //getting current user id
           
           HttpSession session=request.getSession();
           User user=(User)session.getAttribute("currentUser");
           
            out.println("Your post Title is"+pTitle);
           
      
            out.println(request.getRealPath("/"));
            
            Post p=new Post(pTitle, pContent, pCode,part.getSubmittedFileName(),null, cid,user.getId());
            
            PostDao dao=new PostDao(ConnectionProvider.getConnection());
            if(dao.savePost(p))
            {
             String path=request.getRealPath("/")+"blog_pics" +File.separator + part.getSubmittedFileName();
             out.println(part.getSubmittedFileName());
             
             Message msg=new Message("Posted Successfully","success","alert-success");
                  HttpSession s=request.getSession();
                  s.setAttribute("msg",msg);
                     
              RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
              rs.forward(request,response);
            // Helper.saveFile((InputStream) part.getInputStream(), path);
             out.print("done");
            
             }
            else{
                  
             Message msg=new Message("Something went wrong please try again!!!","error","alert-error");
                  HttpSession s=request.getSession();
                  s.setAttribute("msg",msg);
                     
              RequestDispatcher rs = request.getRequestDispatcher("profile.jsp");
              rs.forward(request,response);
                out.print("error");
            
               }
            
            
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
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
