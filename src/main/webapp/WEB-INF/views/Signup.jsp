<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tracker App Signup</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #ffecd2, #fcb69f); /* soft pastel gradient */
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup-container {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(12px);
            border-radius: 25px;
            padding: 50px 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1s ease-in-out;
        }

        .signup-container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            animation: slideInDown 1s ease;
        }

        .form-control, .form-select {
            border-radius: 50px;
            padding: 15px 20px;
            border: none;
            margin-bottom: 20px;
            transition: 0.3s;
        }

        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 12px #000; /* black shadow focus */
            border: 1px solid #000;
            outline: none;
        }

        .btn-signup {
            width: 100%;
            border-radius: 50px;
            padding: 12px;
            background: linear-gradient(45deg, #ff6a88, #ffb88c); /* same cute gradient */
            border: none;
            transition: 0.3s;
            font-weight: bold;
            color: #fff;
        }

        .btn-signup:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .form-text {
            color: #333;
            text-align: center;
            margin-top: 10px;
        }

        .form-text a {
            color: #ff6a88;
            font-weight: 600;
            text-decoration: none;
        }

        .form-text a:hover {
            text-decoration: underline;
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInDown {
            0% {
                opacity: 0;
                transform: translateY(-50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Create Account</h2>
        <form action="saveuser" method="post">

            <!-- First Name -->
            <input type="text" name="firstName" class="form-control" placeholder="First Name" required>

            <!-- Last Name -->
            <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>

            <!-- Email -->
            <input type="email" name="email" class="form-control" placeholder="Email" required>



            <!-- Gender -->
            <select name="gender" class="form-select" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <!-- Password -->
            <input type="password" name="password" class="form-control" placeholder="Password" required>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-signup">Sign Up</button>
        </form>

        <p class="form-text">Already have an account? <a href="login">Login</a></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
