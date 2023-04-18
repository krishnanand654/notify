import java.io.*;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;

import java.sql.PreparedStatement;

import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import java.util.Date;
import java.text.SimpleDateFormat;

@MultipartConfig
public class TestServlet extends HttpServlet {
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
         Date currentDate = new Date();
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         String formattedDate = dateFormat.format(currentDate);
        
        
        String url = "jdbc:mysql://localhost/test"; // replace "mydatabase" with your actual database name
        String user = "root"; // replace "root" with your actual database username
        String password = "root"; // replace "password" with your actual database password
        
        
      // replace "email" with the name of your input field
      
      
        String what = request.getParameter("what");
        String rdesc = request.getParameter("rdesc");

      
        String sub = request.getParameter("subject");
        String des = request.getParameter("desc");
        
        String phead = request.getParameter("phead");
        String plink = request.getParameter("plink");
        if("".equals(plink)){
            plink="0";
        }
        String pdesc = request.getParameter("pdesc");
       
           
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");
        String username = (String) session.getAttribute("username");
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String operation = request.getParameter("operation");
            if (operation == null) {
                out.println("null");
            }else if (operation.equals("insert")) {
                 Part filePart = request.getPart("file");
                    String fileName = filePart.getSubmittedFileName();
                    InputStream fileContent = filePart.getInputStream();

            String sql = "INSERT INTO users (`name`, `content`, `author`, `subject`, `desc`, `date` ) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement statement = conn.prepareStatement(sql)) {
                    statement.setString(1, fileName);
                    statement.setBlob(2, fileContent);
                    statement.setString(3, userid);
                    statement.setString(4, sub);
                    statement.setString(5, des);
                    statement.setString(6, formattedDate);
                    
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        
                        out.println("Data inserted successfully!");
                       
                        out.println("<button onclick=\"window.parent.document.querySelector('.popup').remove()\">Close</button>");
                        
                    }   }
            conn.close();
            }else if (operation.equals("insertpost")) {
               

                
                 
            String sql = "INSERT INTO posts (`headline`,`links`, `pdesc`, `currdate`,`by`) VALUES (?,?, ?, ?,?)";
                try (PreparedStatement statement = conn.prepareStatement(sql)) {
                    statement.setString(1, phead);
                    statement.setString(2, plink);
                    statement.setString(3, pdesc);
                    statement.setString(4, formattedDate);
                    statement.setString(5, userid);
                    
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        
                        out.println("Data inserted successfully!");
                       
                        out.println("<button onclick=\"window.parent.document.querySelector('.popup').remove()\">Close</button>");
                        
                    }   }
            conn.close();
            }else if(operation.equals("request")){
                
                
                 
            String sql = "INSERT INTO requests (`requestfor`,`rdesc`, `currdate`,`requestby`) VALUES (?,?,?,?)";
                try (PreparedStatement statement = conn.prepareStatement(sql)) {
                    statement.setString(1, what);
                    statement.setString(2, rdesc );
                    statement.setString(3, formattedDate);
                    statement.setString(4, userid);
                    
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        
                        out.println("Requested successfully!");
                        
                        session.setAttribute("recordAdded", true);
                        
                        out.println("<script> window.parent.document.querySelector('.popup').remove();</script>");
                       
                         }   }
            conn.close();
            }
        } catch (ClassNotFoundException |   SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
   

//
//public class MyServlet extends HttpServlet {
//    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        
//        String operation = request.getParameter("operation"); // the operation to perform (insert, update, or delete)
//        String url = "jdbc:mysql://localhost/mydatabase"; // replace "mydatabase" with your actual database name
//        String user = "root"; // replace "root" with your actual database username
//        String password = "password"; // replace "password" with your actual database password
//        
//        try {
//            Connection conn = DriverManager.getConnection(url, user, password);
//            PreparedStatement statement;
//            int rowsAffected;
//            
//            if (operation.equals("insert")) {
//                String name = request.getParameter("name");
//                String email = request.getParameter("email");
//                String sql = "INSERT INTO mytable (name, email) VALUES (?, ?)";
//                statement = conn.prepareStatement(sql);
//                statement.setString(1, name);
//                statement.setString(2, email);
//                rowsAffected = statement.executeUpdate();
//                out.println(rowsAffected + " row(s) inserted.");
//            } else if (operation.equals("update")) {
//                int id = Integer.parseInt(request.getParameter("id"));
//                String name = request.getParameter("name");
//                String email = request.getParameter("email");
//                String sql = "UPDATE mytable SET name=?, email=? WHERE id=?";
//                statement = conn.prepareStatement(sql);
//                statement.setString(1, name);
//                statement.setString(2, email);
//                statement.setInt(3, id);
//                rowsAffected = statement.executeUpdate();
//                out.println(rowsAffected + " row(s) updated.");
//            } else if (operation.equals("delete")) {
//                int id = Integer.parseInt(request.getParameter("id"));
//                String sql = "DELETE FROM mytable WHERE id=?";
//                statement = conn.prepareStatement(sql);
//                statement.setInt(1, id);
//                rowsAffected = statement.executeUpdate();
//                out.println(rowsAffected + " row(s) deleted.");
//            } else {
//                out.println("Invalid operation.");
//            }
//            
//            statement.close();
//            conn.close();
//        } catch (SQLException e) {
//            out.println("Error: " + e.getMessage());
//        }
//    }
//}


  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String url = "jdbc:mysql://localhost/test"; // replace "mydatabase" with your actual database name
        String user = "root"; // replace "root" with your actual database username
        String password = "root"; // replace "password" with your actual database password
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String operation = request.getParameter("operation");
            if (operation == null) {
                out.println("null");
            }else if (operation.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String sql = "DELETE FROM users WHERE id=?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, id);
                
                
                int rowsAffected = statement.executeUpdate();
//                out.println(rowsAffected + " row(s) deleted.");
                response.sendRedirect("profile?row(s) deleted.");
                          
                    }
            conn.close();
            
        } catch (ClassNotFoundException |   SQLException e) {
            out.println("Error: " + e.getMessage());
        }
}
}
