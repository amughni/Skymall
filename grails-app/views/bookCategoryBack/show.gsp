
<%@ page import="skymall.BookCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bookCategory.label', default: 'BookCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bookCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bookCategory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bookCategory">
			
				<g:if test="${bookCategoryInstance?.bookSubCategories}">
				<li class="fieldcontain">
					<span id="bookSubCategories-label" class="property-label"><g:message code="bookCategory.bookSubCategories.label" default="Book Sub Categories" /></span>
					
						<g:each in="${bookCategoryInstance.bookSubCategories}" var="b">
						<span class="property-value" aria-labelledby="bookSubCategories-label"><g:link controller="bookSubCategory" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bookCategoryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bookCategory.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bookCategoryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookCategoryInstance?.storeID}">
				<li class="fieldcontain">
					<span id="storeID-label" class="property-label"><g:message code="bookCategory.storeID.label" default="Store ID" /></span>
					
						<span class="property-value" aria-labelledby="storeID-label"><g:fieldValue bean="${bookCategoryInstance}" field="storeID"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bookCategoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bookCategoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
