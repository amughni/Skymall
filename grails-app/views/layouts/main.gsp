<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Sky Mall"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<g:javascript src="jquery-1.3.2.min.js" />
		<g:javascript library="application"/>		
		<r:layoutResources />
	</head>
	<body>
		<div id="skymallLogo" role="banner"><a href="#"><img src="${resource(dir: 'images', file: 'logo_skymall.jpg')}" alt="SkyMall"/></a></div>
        <div class="header_line"></div>
		<div id="loginHeader">
			<g:if test="${session.user == null}">
				<g:link class="user" controller="user"  action="login">
					Login
				</g:link>
			</g:if>
			<g:if test="${session.user != null}">
				<label class="user" for="logoutLink">
					${session.user.userName}
				</label>
				<g:link name="logoutLink" class="user" controller="user" action="logout">
					Logout
				</g:link>
			</g:if>
  		</div>
		<g:layoutBody/>
		
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<r:layoutResources />
	</body>
</html>
