<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>User Login</title>
</head>
<body>
	<div class="body">
	      <h1>Login</h1>
	
		<g:form controller="user" action="authenticate">
			<div style="width: 220px">
				<label>Email Address </label> <input type="text" name="email" /> 
				<label>Password</label> <input type="text" name="password" /> 
			</div>

			<div class="buttons">
				<input class="formButton" type="submit" value="Login" />
				<!--  span class="formButton"> <g:link controller="user" action="authenticate">Login</g:link>
				</span-->
			</div>
			
			
		</g:form>
		
		<div class="buttons">
				<span class="formButton"> <g:link controller="user" action="create">Register</g:link>
				</span>
		</div>
	</div>
</body>
</html>
