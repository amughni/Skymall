
<%@ page import="skymall.Store" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-store" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-store" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list store">
			
				<g:if test="${storeInstance?.storeID}">
				<li class="fieldcontain">
					<span id="storeID-label" class="property-label"><g:message code="store.storeID.label" default="Store ID" /></span>
					
						<span class="property-value" aria-labelledby="storeID-label"><g:fieldValue bean="${storeInstance}" field="storeID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storeInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="store.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${storeInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storeInstance?.storeName}">
				<li class="fieldcontain">
					<span id="storeName-label" class="property-label"><g:message code="store.storeName.label" default="Store Name" /></span>
					
						<span class="property-value" aria-labelledby="storeName-label"><g:fieldValue bean="${storeInstance}" field="storeName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:storeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${storeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
