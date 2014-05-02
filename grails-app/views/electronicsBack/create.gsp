<%@ page 
import="skymall.SpecificationsEnum"
%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'electronics.label', default: 'Electronics')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-electronics" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-electronics" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${electronicsInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${electronicsInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:electronicsInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
		
		<div id="select-specs" class="content scaffold-create" >
			<g:checkBox name="screenSize" value="${false}" />
			<label for="screenSize"> <g:message code="electronics.spec.screenSize"
			default="${SpecificationsEnum.SCREEN_SIZE}" /></label>
			
			<g:checkBox name="type" value="${false}" />
			<label for="type"> <g:message code="electronics.spec.type"
			default="${SpecificationsEnum.TYPE}" /></label>
			
			<g:checkBox name="warrantyLabor" value="${false}" />
			<label for="warrantyLabor"> <g:message code="electronics.spec.warrantyLabor"
			default="${SpecificationsEnum.WARRANTY_lABOR}" /></label>
			
			<g:checkBox name="warrantyParts" value="${false}" />
			<label for="warrantyParts"> <g:message code="electronics.spec.warrantyParts"
			default="${SpecificationsEnum.WARRANTY_PARTS}" /></label>
			
			<g:checkBox name="weight" value="${false}" />
			<label for="weight"> <g:message code="electronics.spec.weight"
			default="${SpecificationsEnum.WEIGHT}" /></label>
			
			<g:checkBox name="width" value="${false}" />
			<label for="width"> <g:message code="electronics.spec.width"
			default="${SpecificationsEnum.WIDTH}" /></label>
			
		</div>
	</body>
</html>
