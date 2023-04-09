<%-- 
    Document   : sidebar
    Created on : Apr 7, 2023, 1:55:04 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="sidebar">
            
            
            
        <ul class="sidebar-list">
            
             <% if(session.getAttribute("username") != null) { 
            
            String username = (String) session.getAttribute("username");
            String usernameSubstring = username.substring(0,1);
            String logocap = usernameSubstring.toUpperCase();
            String usercap = username.substring(0, 1).toUpperCase() + username.substring(1);
            %>
             
            <div>
            <p class="sidebar-item"><span class="profile-logo"><%= logocap%></span><%= usercap%>'s Notify</p>
           
            
            </div>
            
           
            <li><a href="retrieve-files"><i class="fa-solid fa-magnifying-glass icons" style="color: rgba(55, 53, 47, 0.4);"></i>Search</a></li>
            <li><a href="retrieve-files"><i class="fa-solid fa-rss icons" style="color: rgba(55, 53, 47, 0.4);"></i>Feed</a></li>
            <li><a href="profile" ><i class="fa-solid fa-user icons" style="color: rgba(55, 53, 47, 0.4);"></i>Profile</a></li>
            <li><a href="profile" ><i class="fa-solid fa-book icons" style="color: rgba(55, 53, 47, 0.4);"></i>Works</a></li>
            
            
            
               
            
        </ul>
            
            <div class="new">
                <div>
            <a   onclick="showForm()" ><i class="fa-solid fa-plus icons-new" style="color: rgba(55, 53, 47, 0.4);"></i>New note</a></div>
            <div>
            <a  onclick="showForm2()" ><i class="fa-solid fa-plus icons-new" style="color: rgba(55, 53, 47, 0.4);"></i>New post</a>
            </div>
        </div>

            
        </div>
             <% }else{ %>
            <p>please login</p>
            <%}%>
    </body>
    <script >
        function showForm() {
                var popup = document.createElement('div');
                popup.classList.add('popup');
                popup.innerHTML = '<iframe src="index.html"></iframe>';
                document.body.appendChild(popup);
            }
            
        function showForm2() {
                var popup = document.createElement('div');
                popup.classList.add('popup');
                popup.innerHTML = '<iframe src="post.html"></iframe>';
                document.body.appendChild(popup);
            }

        </script>
</html>
