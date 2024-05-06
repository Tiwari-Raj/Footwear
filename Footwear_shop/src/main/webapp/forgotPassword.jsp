<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Forgot password</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
<style>
    body {
        background-position: center;
        background-color: #eee;
        background-repeat: no-repeat;
        background-size: cover;
        color: #505050;
        font-family: "Rubik", Helvetica, Arial, sans-serif;
        font-size: 14px;
        font-weight: normal;
        line-height: 1.5;
        text-transform: none;
    }

    .container {
        margin-top: 100px;
    }

    .lock-svg {
        margin-left: 50px;
        margin-top: 20px;
        fill: red;
    }

    .text-section {
        text-align: center;
    }

    .forgot-container {
        background-color: #c5c8d4;
        height: 400px;
        width: 500px;
        margin-left: 300px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .forgot-button {
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container" style="">
        <div class="forgot-container">
           <img src="All_Component/image/forgot_password.png" style="width:250px; height:180px;">

            <div class="text-section mt-4">
                <p><b><i>Forgot Password? Don't worry!<br>
                Follow some steps and reset your password...</i></b></p>
                
            </div>
            <button class="btn btn-success forgot-button" data-toggle="modal" data-target="#forgotPasswordModal">Forgot Password</button>
        </div>
    </div>

    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" role="dialog" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="forgotPasswordModalLabel">Forgot Password</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="forgotPassword" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="email-for-pass">Enter your email address</label>
                            <input class="form-control" type="text" name="email" id="email-for-pass" required="">
                            <small class="form-text text-muted">Enter the registered email address</small>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button class="btn btn-success" type="submit">Get New Password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
