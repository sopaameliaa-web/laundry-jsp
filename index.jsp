<!DOCTYPE html>
<html>
<head>
    <title>Login Laundry</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #6c5ce7, #8e7cf0);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: white;
            padding: 30px;
            width: 320px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #6c5ce7;
        }

        .login-box input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 14px;
        }

        .login-box input:focus {
            outline: none;
            border-color: #6c5ce7;
            box-shadow: 0 0 4px rgba(108,92,231,0.6);
        }

        .login-box button {
            width: 100%;
            padding: 10px;
            background: #6c5ce7;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
        }

        .login-box button:hover {
            background: #5a4bdc;
        }
    </style>
</head>

<body>

<div class="login-box">
    <h2>Login Laundry</h2>

    <form action="login.jsp" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
