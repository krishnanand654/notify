<%-- 
    Document   : vedio
    Created on : Apr 10, 2023, 12:48:44 AM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

 <html>
    
          <head>
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
          </head>
          <body >
              
              <div><img class='background' src='https://mdbootstrap.com/img/new/textures/full/171.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'/> </div>
                  <div class="home-req-flex">
                  <div>
                  <div class='mag-ctn'>
                  <div class='top-links'>
                        <a class='head-list' href="folder.jsp">Notes</a>
                         <form action="retrieve-files" method="post">
                            <input type="hidden" name="type" value="assignment" />
                           <button class='head-list' type="submit">Assignment</button>
                         </form>
                        <a class='head-list' href="requestbar.jsp">Requests</a>
                    </div>
                      <% 
                            if (session.getAttribute("recordAdded") != null) { %>
                             
                            <div class="alert alert-success" role="alert">
                              New request available
                            </div>
                            <% session.removeAttribute("recordAdded"); %>
                          <% } %>
                  
                  <h1>Feeds</h1>
                  </div>
<%
  String dbUrl = "jdbc:mysql://localhost:3306/test";
  String dbUser = "root";
  String dbPassword = "root";
  String query = "SELECT * FROM posts p, login l where p.by = l.id order by currdate asc;";
  
  
   

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
    String heading = rs.getString("headline");
     String desc = rs.getString("pdesc");     
     String date = rs.getString("currdate");
     String by = rs.getString("username");

     
       String videoLink = rs.getString("links");
      String videoId = "";
      if (videoLink.contains("youtube.com")) {
        videoId = videoLink.substring(videoLink.indexOf("v=") + 2);
      } else if (videoLink.contains("youtu.be")) {
        videoId = videoLink.substring(videoLink.indexOf(".be/") + 4);
      }
      
   
      %>
     
    <div class='home-container1'>
     <%if(videoId != "" ){%>
        <div class="home-flex"> 
           <%}else{%> 
           <div class="home-flex2"> 
           <%}%>    
            <div class="head-desc">
                <div class='point-flex'>
                    
                    
                <%if(videoId == "" ){%>
                
                    <p class='point-icon'>::</p>
               <%}%>
               <h2><%=heading%></h2>
                </div>
                <div class='sub'>
            <p>On : <%=date%> </p>
            <p>By : <%=by%> </p>
            </div>
                
     
           <p><%=desc%> </p>
           

            </div>
              <%if(videoId == "" ){%>
            <div class='myElement'>
                
              <iframe style='display:none' width="380" height="210" src="https://www.youtube.com/embed/<%= videoId %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
             <%}else{%>
             <div class='myElement'>
                
              <iframe width="380" height="210" src="https://www.youtube.com/embed/<%= videoId %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            <%}%>
    </div>
            
    </div>
    </div>
        <%
    }

    // Close the database connection
    rs.close();
    stmt.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
    </div>
   
    </div>
</body>
</html>




