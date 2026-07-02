<%-- 
    Document   : home
    Created on : 05-Oct-2025, 12:26:45 am
    Author     : Riya
--%>

<%@ page import="dto.UserDTO, model.UserModel" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Donor Dashboard</title>
    <style>
        :root {
            --light-pink: #F7C6C7;
            --primary-red: #D50032;
            --strong-red: #B22234;
            --deep-red: #A50034;
            --white: #FFFFFF;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--light-pink);
            color: var(--deep-red);
        }

        /* Navbar */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 25px;
            background: var(--strong-red);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        nav .logo {
            color: var(--white);
            font-weight: bold;
            font-size: 1.5em;
        }

        nav a {
            color: var(--white);
            margin-left: 15px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        nav a:hover {
            color: var(--light-pink);
        }

        /* Hero Section */
        .hero {
            height: 250px;
            background: linear-gradient(rgba(181,34,52,0.7), rgba(165,0,52,0.7)),
                        url("https://nevadanewsgroup.media.clients.ellingtoncms.com/img/photos/2024/01/10/AdobeStock_276718846_t670.jpeg?b3f6a5d7692ccc373d56e40cf708e3fa67d9af9d")
                        center/cover no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: var(--white);
        }

        .hero h1 {
            font-size: 2.5em;
            text-shadow: 2px 2px 5px black;
        }

        /* Dashboard Card */
        .dashboard-container {
            max-width: 900px;
            margin: -50px auto 50px auto;
            background: var(--white);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }

        .dashboard-container h2 {
            text-align: center;
            color: var(--strong-red);
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: var(--primary-red);
            color: var(--white);
        }

        tr:hover {
            background-color: var(--light-pink);
        }

        .logout {
            display: inline-block;
            float: right;
            background: var(--primary-red);
            color: var(--white);
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .logout:hover {
            background: var(--strong-red);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .dashboard-container {
                margin: -30px 20px 30px 20px;
                padding: 20px;
            }
            .hero h1 {
                font-size: 2em;
            }
        }
        /* Footer */
    footer {
      background: var(--strong-red);
      color: var(--white);
      text-align: center;
      padding: 20px;
    }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav>
        <div class="logo">BloodDonationMVC</div>
        <div>
            <a href="index.html">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="findblood.jsp">Find Blood</a>
            <a href="register.jsp">Register</a>
            <a href="login.jsp">Login</a>
        </div>
    </nav>

    <!-- Hero -->
    <section class="hero">
        <h1>Welcome Back Donor!</h1>
    </section>

    <!-- Dashboard -->
    <div class="dashboard-container">
        <a href="logout.jsp" class="logout">Logout</a>
        <%
            String email = (String) session.getAttribute("email");
            if(email == null || email.trim().equals("")) {
                response.sendRedirect("login.jsp");
            } else {
                UserModel model = new UserModel();
                UserDTO user = model.getUserByEmail(email);
        %>
        <h2>Hello, <%=user.getName()  %>  !</h2>
        <table>
            <tr><th>Donor ID</th><td><%= user.getDonorId() %></td></tr>
            <tr><th>Name</th><td><%= user.getName() %></td></tr>
            <tr><th>Email</th><td><%= user.getEmail() %></td></tr>
            <tr><th>Blood Group</th><td><%= user.getBloodGroup() %></td></tr>
            <tr><th>City</th><td><%= user.getCity() %></td></tr>
            <tr><th>Phone</th><td><%= user.getPhone() %></td></tr>
        </table>
        <% } %>
    </div>
 <!-- Footer -->
  <footer>
    &copy; 2025 BloodDonationMVC | Together, We Save Lives
  </footer>
</body>
</html>
