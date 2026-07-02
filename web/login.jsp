
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Donor Login</title>
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
      top:0;
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
    nav a:hover { color: var(--light-pink); }

     /* Hero Section */
    .hero {
      height: 60vh;
      background: linear-gradient(rgba(181,34,52,0.6), rgba(165,0,52,0.6)),
        url("https://img.freepik.com/premium-vector/blood-donation-volunteer-patient-help-support-monocolor-outline-concept-medicine-emergency-transfusion-savings-with-rhesus-positive-negative-types-vector-illustration-volunteer-donor-drop_1995-786.jpg") center/cover no-repeat;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      color: var(--white);
      flex-direction: column;
      padding: 20px;
    }
    .hero h1 {
      font-size: 3em;
      margin-bottom: 10px;
      text-shadow: 2px 2px 5px black;
    }
    .hero p {
      font-size: 1.2em;
      text-shadow: 1px 1px 3px black;
    }

    /* Form Card */
    .form-card {
      max-width: 400px;
      margin: -60px auto 50px auto;
      background: var(--white);
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.2);
      position: relative;
      z-index: 1;
    }
    .form-card h2 {
      text-align: center;
      color: var(--strong-red);
      margin-bottom: 25px;
    }
    .form-card form {
      display: flex;
      flex-direction: column;
    }
    .form-card input, .form-card button {
      margin-bottom: 15px;
      padding: 12px;
      border-radius: 8px;
      border: 1px solid var(--primary-red);
      font-size: 1em;
    }
    .form-card button {
      background: var(--primary-red);
      color: var(--white);
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
    }
    .form-card button:hover {
      background: var(--strong-red);
    }

    /* Footer */
    footer {
      background: var(--strong-red);
      color: var(--white);
      text-align: center;
      padding: 20px;
    }

    /* Link under form */
    .form-card .links {
      text-align: center;
      margin-top: 10px;
    }
    .form-card .links a {
      color: var(--primary-red);
      text-decoration: none;
      font-weight: bold;
    }
    .form-card .links a:hover {
      color: var(--strong-red);
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

  <!-- Hero Section -->
  <section class="hero">
    <h1>Welcome Back Donor</h1>
    <p>Login to continue saving lives by donating blood.</p>
  </section>

  <!-- Login Form Card -->
  <div class="form-card">
    <h2>Donor Login</h2>
    <form action="LoginServlet" method="POST">
      <input type="email" name="email" placeholder="Email Address" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Login</button>
    </form>
    <div class="links">
      <p>Don't have an account? <a href="register.jsp">Register Here</a></p>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    &copy; 2025 BloodDonationMVC | Together, We Save Lives
  </footer>

</body>
</html>
