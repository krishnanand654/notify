///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.annotation.WebServlet;
//import java.io.File;
//import java.util.List;
//import java.sql.DriverManager;
//import java.sql.Connection;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Blob;
//import java.io.ByteArrayInputStream;
//import jakarta.servlet.jsp.JspWriter;
//
//
//
//
///**
// *
// * @author krish
// */
//@WebServlet("/retrieve-files")
//public class RetrieveFilesServlet extends HttpServlet {
//
//    
//    
//    
//    
//    
//    public class ByteArrayFile extends File {
//    private final ByteArrayInputStream byteArrayInputStream;
//
//    public ByteArrayFile(String name, ByteArrayInputStream byteArrayInputStream) {
//        super(name);
//        this.byteArrayInputStream = byteArrayInputStream;
//    }
//
//    public ByteArrayInputStream getByteArrayInputStream() {
//        return byteArrayInputStream;
//    }
//}
//    
//    
//    
//    
//    
//    private static final long serialVersionUID = 1L;
//    private final String url = "jdbc:mysql://localhost/test";
//    private final String user = "root";
//    private final String password = "root";
//    
//    
//    
//    
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        PrintWriter out = response.getWriter();
//        List<File> files = new ArrayList<>();
//        try{
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(url, user, password);
//            out.println("connected");
//            String sql = "SELECT * FROM users";
//            PreparedStatement statement = conn.prepareStatement(sql);
//            ResultSet resultSet = statement.executeQuery();
//            
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                Blob content = resultSet.getBlob("content");
//                if (content != null) {
//                     byte[] bytes = content.getBytes(1, (int) content.length());
//                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
//                ByteArrayFile file = new ByteArrayFile(name, byteArrayInputStream);
//                files.add(file);
//                }
//            }
//            
//            statement.close();
//            conn.close();
//        }catch(ClassNotFoundException | SQLException e){
//            
//        }
//         request.setAttribute("files", files);
//          request.getRequestDispatcher("files.jsp").forward(request, response);
//    }
//
//
//}


import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/retrieve-files")
public class ProfileServlet extends HttpServlet
{
   
    @Override
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
        sidebar.include(request, response);
        PrintWriter out = response.getWriter ();
     

        try
        {
            Class.forName ("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/test", "root", "root");
            
             HttpSession session = request.getSession();
            String userid = (String) session.getAttribute("userid");
             String username = (String) session.getAttribute("username");
            PreparedStatement ps =con.prepareStatement ("select * from users u, login l where u.author=l.id and l.id="+userid);
         
           

            // Use the username to display a personalized message or perform other actions
           if(userid !=null) {

            out.println("<div class='home-container'>");
            out.print ("<table width=50% border=1>");
            out.print ("<caption>Employee Details:</caption>");

            ResultSet rs = ps.executeQuery ();

            /* Printing column names */
            out.print ("</br></br>");
           
            out.print ("<tr>");
           
            out.print ("<th>name</th>");
                          
                          

         
            out.print ("</tr>");

            /* Printing result */
            while (rs.next ())
         {
            
             out.print ( "</td><td>" +  rs.getString (2) + " </td><td>" +"<td><a href= download?id="+ rs.getInt(1)  +">view</a></td>"+" </td><td>" +"<td><a href= download?id="+ rs.getInt(1)  +"&operation=download>Download</a></td>"+"<td><a href= delete?id="+ rs.getInt(1)  +"&operation=delete>Delete</a></td></tr>");
         }
            out.print ("</table></div>");
            out.print("<p>"+request.getParameter("message")+"</p>"  );
          }else{
               out.print("");
           }
        }
        catch (ClassNotFoundException | SQLException e2)
        {
            e2.printStackTrace ();
        }
        finally
        {
            out.close ();
        }
    }
}