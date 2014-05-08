<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>User Login</title>
</head>
<body>
	<div class="body">
		<g:form controller="user" action="authenticate">
			<div class="div-login">
                <div style="width: 220px">
                    <input type="text" class="login-text" name="email" placeholder="Username"/>
                    <input type="password" class="login-text" name="password" placeholder="Password" />
                </div>

                <div class="buttons">
                    <input class="formButton" type="submit" value="Login" />
                    <!--  span class="formButton"> <g:link controller="user" action="authenticate">Login</g:link>
                    </span-->
                </div>
                <div class="buttons">
                    <span class="formButton"> <g:link controller="user" action="create">Register</g:link>
                    </span>
                </div>
            </div>
		</g:form>
	</div>
</body>
</html>

