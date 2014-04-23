
<%@ page import="skymall.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.prodID}">
				<li class="fieldcontain">
					<span id="prodID-label" class="property-label"><g:message code="product.prodID.label" default="Prod ID" /></span>
					
						<span class="property-value" aria-labelledby="prodID-label"><g:fieldValue bean="${productInstance}" field="prodID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.count}">
				<li class="fieldcontain">
					<span id="count-label" class="property-label"><g:message code="product.count.label" default="Count" /></span>
					
						<span class="property-value" aria-labelledby="count-label"><g:fieldValue bean="${productInstance}" field="count"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="product.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${productInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="product.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${productInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.storeID}">
				<li class="fieldcontain">
					<span id="storeID-label" class="property-label"><g:message code="product.storeID.label" default="Store ID" /></span>
					
						<span class="property-value" aria-labelledby="storeID-label"><g:fieldValue bean="${productInstance}" field="storeID"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
