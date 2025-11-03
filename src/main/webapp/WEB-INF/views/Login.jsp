<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tracker App Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #ffecd2, #fcb69f); /* cute pastel gradient */
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(12px);
            border-radius: 25px;
            padding: 50px 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1s ease-in-out;
        }

        .login-container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            animation: slideInDown 1s ease;
        }

        .form-control {
            border-radius: 50px;
            padding: 15px 20px;
            border: none;
            margin-bottom: 20px;
            transition: 0.3s;
        }

        .form-control:focus {
            box-shadow: 0 0 12px #000; /* black focus shadow */
            border: 1px solid #000;
            outline: none;
        }

        .btn-login {
            width: 100%;
            border-radius: 50px;
            padding: 12px;
            background: linear-gradient(45deg, #ff6a88, #ffb88c); /* cute gradient button */
            border: none;
            transition: 0.3s;
            font-weight: bold;
            color: #fff;
        }

        .btn-login:hover {
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
        #e{
        color:red;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login to Tracker</h2>
        <form action="login" method="post">
            <input type="email" name="email" class="form-control" placeholder="Email" required>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <button type="submit" class="btn btn-login">Login</button>
             <p class="form-text text-center">
            <a href="forgetpassword">Forgot password?</a>
        </p>
        </form>
        <p class="form-text">Don't have an account? <a href="/">Sign Up</a></p>
                <p class="form-text"> <a href="/">${message }</a></p>
        
        <p id="e">${error }</p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
