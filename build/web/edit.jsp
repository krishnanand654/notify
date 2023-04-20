<%-- 
    Document   : edit
    Created on : Apr 19, 2023, 11:19:48 AM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notify</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            out.print(id);
            
               
            String dbUrl = "jdbc:mysql://localhost:3306/test";
            String dbUser = "root";
            String dbPassword = "root";
            String query = "select * from users u, login l where u.author=l.id and u.id="+id;
  
  
   

  try {
    // Connect to the database and execute the query
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    if(conn == null){
     out.println("not connected");
    }
    
    // Output the YouTube video embed code for each video link
     
     RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
    sidebar.include(request, response);
     
    while (rs.next()) {
    String heading = rs.getString("name");
     String desc = rs.getString("subject");     
     String date = rs.getString("desc");
     String by = rs.getString("type");

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


        %>
        <form>
            <input type="text" value="<%=name%>"/>
        </form>
    </body>
</html>
