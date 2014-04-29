
<%@ page import="skymall.Apparel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'apparel.label', default: 'Apparel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-apparel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-apparel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list apparel">
			
				<g:if test="${apparelInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="apparel.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${apparelInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apparelInstance?.cart}">
				<li class="fieldcontain">
					<span id="cart-label" class="property-label"><g:message code="apparel.cart.label" default="Cart" /></span>
					
						<g:each in="${apparelInstance.cart}" var="c">
						<span class="property-value" aria-labelledby="cart-label"><g:link controller="cart" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${apparelInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="apparel.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${apparelInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apparelInstance?.prodCount}">
				<li class="fieldcontain">
					<span id="count-label" class="property-label"><g:message code="apparel.prodCount.label" default="Product Count" /></span>
					
						<span class="property-value" aria-labelledby="count-label"><g:fieldValue bean="${apparelInstance}" field="prodCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apparelInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="apparel.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${apparelInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apparelInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="apparel.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${apparelInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apparelInstance?.apparelSize}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="apparel.apparelSize.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${apparelInstance}" field="apparelSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${apparelInstance?.storeID}">
				<li class="fieldcontain">
					<span id="storeID-label" class="property-label"><g:message code="apparel.storeID.label" default="Store ID" /></span>
					
						<span class="property-value" aria-labelledby="storeID-label"><g:fieldValue bean="${apparelInstance}" field="storeID"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:apparelInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${apparelInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
