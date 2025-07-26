<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://cruisepassenger.com.au/wp-content/uploads/2024/10/Cruise-ships-in-Juneau-2-1536x865.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: flex-end; /* align to right side */
            align-items: center;
        }

        .signup-box {
    width: 400px;
    background-color: rgba(255, 255, 255, 0.3); /* ← More transparent */
    padding: 30px;
    margin-right: 60px;
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
    backdrop-filter: blur(15px); /* ← Adds a blur/glass effect */
    -webkit-backdrop-filter: blur(15px); /* Safari support */
    border: 1px solid rgba(255, 255, 255, 0.2);
}
        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.7);;
        }

        input:focus {
            border-color: #2100b3;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #483c8c;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2c1a78;
        }

        .login-link {
            text-align: center;
            margin-top: 10px;
        }

        .login-link a {
            color: #483c8c;
            text-decoration: none;
            font-size: 14px;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            body {
                justify-content: center;
                padding: 20px;
            }

            .signup-box {
                width: 100%;
                margin-right: 0;
            }
        }
    </style>
</head>
<body>
    <div class="signup-box">
        <h2>Signup</h2>
        <form action="UserController" method="post">
            <input type="hidden" name="action" value="signup">

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Signup</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>

