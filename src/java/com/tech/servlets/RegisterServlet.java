/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.servlets;

import com.sun.java.swing.plaf.windows.resources.windows;
import com.tech.dao.UserDao;
import com.tech.entities.Message;
import com.tech.entities.User;
import com.tech.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */

public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {
      
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         

            String check=request.getParameter("check");
            if(check==null)
            {
            //out.println("please check condition");
             Message msg=new Message("Please Check Condition...!! ","check","alert-error");
                   HttpSession s=request.getSession();
                   s.setAttribute("msg", msg);
                    response.sendRedirect("register.jsp");
            
            
            
            }
            else{
                String name=request.getParameter("user_name");
                String email=request.getParameter("user_email");
                String password=request.getParameter("user_password");
                String gender=request.getParameter("user_gender");
                String address=request.getParameter("user_address");
                
                //create user object
                User user=new User(name,email,password,gender,address);
                
                
                
                
                //create user dao object
                UserDao dao=new UserDao(ConnectionProvider.getConnection());
                if(dao. saveUser(user))
                {
                  Message msg=new Message("Successfully  Register...Please Login!!!","success","alert-success");
                   HttpSession ss=request.getSession();
                   ss.setAttribute("msg", msg);
                    
               //     out.print("Done");
                  
                   response.sendRedirect("login_page.jsp");
                }
                else
                {
                   Message msg=new Message("Registration Error Please TRy Again...!! ","error","alert-error");
                   HttpSession s1=request.getSession();
                   s1.setAttribute("msg", msg);
                    response.sendRedirect("register.jsp");
                
                }
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
