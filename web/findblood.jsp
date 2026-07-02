<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@page import="java.util.ArrayList"%>
<%@page import="dto.DonorDTO"%>

<%
    String bloodGroup = request.getParameter("blood_group") != null ? request.getParameter("blood_group") : "";
    String city = request.getParameter("city") != null ? request.getParameter("city") : "";
    ArrayList<DonorDTO> donors = (ArrayList<DonorDTO>) request.getAttribute("donors");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Find Blood - BloodDonationMVC</title>
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
        font-family: "Segoe UI", sans-serif;
        background-color: var(--light-pink); 
        color: var(--deep-red); 
        overflow-x: hidden; 
    }

    nav { display: flex;
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

    .hero { 
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: center;
        gap: 40px;
        padding: 60px 10%;
        background: var(--white);
        border-radius: 15px;
        margin: 30px 0;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    
    }
    
    .hero .hero-text {
        flex: 1 1 400px; 
    }
    
    .hero .hero-text h1 { font-size: 3em;
                   color: var(--strong-red);
                   margin-bottom: 20px;
    }
    
    .hero .hero-text p {
        font-size: 1.2em;
        line-height: 1.5;
        margin-bottom: 25px; 
    }
    
    .hero img { 
          flex: 1 1 400px;
          border-radius: 15px; 
    }

    .cards-container { 
            display: flex; 
          flex-wrap: wrap; 
           justify-content: center;
          gap: 30px;
           padding: 50px 10%; 
    }
    
    .card { 
        flex: 1 1 300px; 
         background: var(--white); 
         border-radius: 15px; 
         padding: 25px; 
         text-align: center;
         box-shadow: 0 5px 15px rgba(0,0,0,0.1);
         transition: transform 0.3s, box-shadow 0.3s;
    }
    .card img { 
        width: 100%; 
         height: 180px; 
         object-fit: cover;
         border-radius: 12px;
         margin-bottom: 15px; 
    }
    .card h3 {
        color: var(--strong-red);
        margin-bottom: 10px;
    }
    .card p { 
        font-size: 1em; 
        line-height: 1.5;
    }
    .card:hover {
        transform: translateY(-5px); 
        box-shadow: 0 12px 25px rgba(0,0,0,0.2);
    }

    .search-form { 
        background: var(--white); 
        padding: 30px;
        margin: 50px 10%;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        display: flex; 
        gap: 15px; 
        flex-wrap: wrap;
        justify-content: center; 
        align-items: center; 
    }
    .search-form select, .search-form input { 
        padding: 12px; 
        border-radius: 8px; 
        border: 1px solid #ccc;
        font-size: 1em;
        flex: 1 1 200px; 
    }
    .search-form button {
        padding: 12px 30px; 
        background: var(--strong-red);
        color: var(--white); 
        border: none;
        border-radius: 8px; 
        cursor: pointer; 
        font-weight: bold;
        transition: 0.3s; 
    }
    .search-form button:hover {
        background: var(--deep-red); 
    }

    .donor-cards { 
        display: flex;
        flex-wrap: wrap; 
        gap: 20px;
        justify-content: center; 
        padding: 20px 10%;
    }
    .donor-card { 
        flex: 1 1 250px; 
        background: var(--white); 
        border-radius: 12px; 
        padding: 20px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .donor-card h3 {
        margin: 0 0 10px 0; 
        color: var(--strong-red);
    }
    .donor-card p {
        margin: 5px 0; 
        font-size: 0.95em; 
    }

    footer { 
        background: var(--strong-red);
        color: var(--white);
        text-align: center;
        padding: 20px;
    }
    
  </style>
</head>
<body>

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

<section class="hero">
  <div class="hero-text">
    <h1>Need Blood? We Can Help</h1>
    <p>Connect instantly with registered blood donors nearby.</p>
  </div>
  <img src="https://img.freepik.com/free-vector/blood-donation-symbol-with-hand-blood-bag_1308-115904.jpg" alt="Blood Donation">
</section>

<form class="search-form" method="GET" action="FindBloodServlet">
  <select name="blood_group" required>
    <option value="">Select Blood Group</option>
    <option value="A+" <%= "A+".equals(bloodGroup) ? "selected" : "" %>>A+</option>
    <option value="A-" <%= "A-".equals(bloodGroup) ? "selected" : "" %>>A-</option>
    <option value="B+" <%= "B+".equals(bloodGroup) ? "selected" : "" %>>B+</option>
    <option value="B-" <%= "B-".equals(bloodGroup) ? "selected" : "" %>>B-</option>
    <option value="O+" <%= "O+".equals(bloodGroup) ? "selected" : "" %>>O+</option>
    <option value="O-" <%= "O-".equals(bloodGroup) ? "selected" : "" %>>O-</option>
    <option value="AB+" <%= "AB+".equals(bloodGroup) ? "selected" : "" %>>AB+</option>
    <option value="AB-" <%= "AB-".equals(bloodGroup) ? "selected" : "" %>>AB-</option>
  </select>
  <input type="text" name="city" placeholder="Enter City" required value="<%= city %>">
  <button type="submit">Search</button>
</form>

<div class="donor-cards">
<%
    if (donors != null && !donors.isEmpty()) {
        for (DonorDTO donor : donors) {
%>
  <div class="donor-card">
      <h3><%= donor.getName() %></h3>
      <p><strong>Blood Group:</strong> <%= donor.getBloodGroup() %></p>
      <p><strong>City:</strong> <%= donor.getCity() %></p>
      <p><strong>Contact:</strong> <%= donor.getPhone() %></p>
  </div>
<%
        }
    } else {
%>
  <p style="text-align:center; color: red; font-weight:bold;">No donors found</p>
<%
    }
%>
</div>

<footer>
  &copy; 2025 BloodDonationMVC | Together, We Save Lives
</footer>

</body>
</html>
