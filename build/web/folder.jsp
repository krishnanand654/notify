<%-- 
    Document   : folder
    Created on : Apr 14, 2023, 9:22:00 PM
    Author     : krish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <% 
            RequestDispatcher sidebar = request.getRequestDispatcher("sidebar.jsp");
            sidebar.include(request, response);
            %>
        <div class="folder">
            <h1>Theory</h1>
            <div class="card-flex">
            <div class='card'>
                
                <div class='card-content'>
                    <p><i class="fa-solid fa-folder fa-2xl" style="color: #6b6b6b;"></i><p>
                    <h2>Web Security and vulnerability Testing</h2>
                </div>
                <a href="retrieve-files?type=note&subject=java" > <img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png"/></a>
            </div>
             <div class='card'>
                 <div class='card-content'>
                    <p><i class="fa-solid fa-folder fa-2xl" style="color: #6b6b6b;"></i><p>
                    <h2>DBMS</h2>
                 </div>
                 <a href="retrieve-files?type=note&subject=dbms" > <img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png"/></a>
            </div>
             <div class='card'>
                 <div>
                <p><i class="fa-solid fa-folder fa-2xl" style="color: #6b6b6b;"></i><p>
                <h2>Distributed System</h2>
                 </div>
                <a href="retrieve-files?type=note&subject=distributed" > <img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png"/></a>
            </div> <div class='card'>
                <div>
                <p><i class="fa-solid fa-folder fa-2xl" style="color: #6b6b6b;"></i><p>
                <h2>Web and Database Security</h2>
                </div>
                <a href="retrieve-files?type=note&subject=web" > <img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png"/></a>
            </div>
            </div>
            
           
            <div class='line'></div>
            <h1>Lab</h1>
             <div class='card-flex'>
            <div class='card'>
                <div>
                <p><i class="fa-solid fa-folder fa-2xl" style="color: #6b6b6b;"></i><p>
                <h2>Java</h2>
                </div>
                <a href="retrieve-files?type=code&subject=java" > <img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png"/></a>
            </div>
            <div class='card'>
                <div>
                <p><i class="fa-solid fa-folder fa-2xl" style="color: #6b6b6b;"></i><p>
                <h2>DBMS lab</h2>
                </div>
                <a href="retrieve-files?type=note&subject=java" > <img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png"/></a>
            </div>
            <div class='card'>
                <div>
                <p><i class="fa-solid fa-folder fa-2xl" style="color: #6b6b6b;"></i><p>
                <h2>Web security lab</h2>
                </div>
                <a href="retrieve-files?type=note&subject=java" > <img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png"/></a>
            </div>
                 
        </div>
            <!--<img src="https://img.icons8.com/ios-filled/256/circled-chevron-right.png" class="fade-in">-->

        </div>
        
    </body>
    <script>
        const image = document.querySelector('.fade-in');
image.addEventListener('load', () => {
  image.classList.add('show');
});

        </script>
</html>

