<?php if (!defined('THINK_PATH')) exit();?><html>
<head>
   	<title>Online Payment System</title>
   	<link rel="stylesheet" href="../Public/css/bootstrap.css"/>
   	<link rel="stylesheet" href="../Public/css/index.css"/>
   	<link rel="stylesheet" href="../Public/css/sliding.form.css"/>
	<script src="../Public/js/jquery-1.9.1.js" type="text/javascript"></script>
	<script src="../Public/js/sliding.form.js" type="text/javascript"></script>
</head>

<body>
<!--
<div class = "header">
	<h1>Online Payment System/<span style="font-size:24px;">Login</span></h1>
</div>
-->
<div class="navbar navbar-inverse navbar-fixed-top">
<div class="navbar-inner">
  <div class="container">
  <a class="brand" href="__APP__/">Online Payment System</a>
    <div class="nav-collapse collapse">
      <ul class="nav">
        <li class="">
          <a href="__APP__/User/register">Register</a>
        </li>
        <li class="">
          <a href="__APP__/User/home">Home</a>
        </li>
      </ul>    
    </div>
  </div>
</div>
</div>

<div id = "container" style="margin-top:40px;width:600px;">
	<h3>Welcome to Join Online Payment System!</h3>
	<div id="wrapper">
		<div id="navigation" style="display:none;">
            <ul>
                <li class="selected">
                    <a href="#">Step 1</a>
                </li>
                <li>
                    <a href="#">Step 2</a>
                </li>
                <li>
                    <a href="#">Step 3</a>
                </li>
                <li>
                    <a href="#">Confirm</a>
                </li>
            </ul>
            <p style="margin-top:10px;"><span style="color:#ff0000; font-family:song">*</span>means necessary</p>
        </div>

		<div id="steps">
			<form id="formElem" name="fromElem" action="" method="post">	
				
				<fieldset class="step">
					<legend>Personal Basic Information</legend>
					<p>
						<label for="username">Username<span style="color:#ff0000; font-family:song">*</span>:</label>
						<input type="text" name="username" placeholder="Username" AUTOCOMPLETE=OFF>
					</p>
					<p>
						<label>Password for login<span style="color:#ff0000; font-family:song">*</span>:</label>
						<input type="password" name="password" placeholder="Password" AUTOCOMPLETE=OFF>
					</p>
					<p>	
						<label>Confirm your password<span style="color:#ff0000; font-family:song">*</span>:</label>
						<input type="password" name="confirmPassword" placeholder="Password" AUTOCOMPLETE=OFF>
					</p>
					<p>	
						<label>E-mail:</label>
						<input type="text" name="email" placeholder="email" AUTOCOMPLETE=OFF>
					</p>
					<p>
						<label>Phone Number:</label>
						<input type="text" name="phone" placeholder="phone" AUTOCOMPLETE=OFF>
					</p>
				</fieldset>
				
				<fieldset class="step">
					<legend>Choose a type you want to register</legend>
					<p>
					<select name="type">
						<option>Buyer</option>
						<option>Seller</option>
					</select>
					</p>
				</fieldset>
				
				<fieldset class="step">
					<legend>Create your password for payment or consignment</legend>
					<p>
					<label>Password<span style="color:#ff0000; font-family:song">*</span>:</label>
					<input type="password" name="password1" placeholder="Password">
					</p>
					<p>
					<label>Confirm your password<span style="color:#ff0000; font-family:song">*</span>:</label>
					<input type="password" name="confirmPassword1" placeholder="Password">
					<label></label>
					</p>
				</fieldset>

				<fieldset class="step">
					<legend>Confirm and Join Us!</legend>
					<p>
						Everything in the form have been filled
						correctly, please push the button to join us!
					</p>
					<label></label>
					<button type="submit" style="margin-left:250px; margin-top:50px;" class="btn btn-large btn-success inline">Register</button>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<div class="footer">
	<div id="footer-link">
		<a href="#">About </a>|
		<a href="#">Manage </a>|
		<a href="#">Contact Us </a>
		<p>All Copyright Reserved By Civi@2013</p>
	</div>
	
</div>
</body>
</html>