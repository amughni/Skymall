<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>User Login</title>
</head>
<body>
	<div class="body div-login">
		<g:form controller="user" action="authenticate">
			<div style="width: 190px">
				<input type="text" name="email" class="login-text" placeholder="Username" />
				<input type="password" name="password" class="login-text" placeholder="Password" />
                <div class="buttons">
                    <input type="submit" value="Login" />
                    <g:link controller="user" action="create">Register</g:link>
                </div>

			</div>
		</g:form>
	</div>
</body>
</html>

