
<%@ page import="skymall.Electronics" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'electronics.label', default: 'Electronics')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-electronics" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-electronics" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list electronics">
			
				<g:if test="${electronicsInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="electronics.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${electronicsInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${electronicsInstance?.storeID}">
				<li class="fieldcontain">
					<span id="storeID-label" class="property-label"><g:message code="electronics.storeID.label" default="Store ID" /></span>
					
						<span class="property-value" aria-labelledby="storeID-label"><g:fieldValue bean="${electronicsInstance}" field="storeID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${electronicsInstance?.cart}">
				<li class="fieldcontain">
					<span id="cart-label" class="property-label"><g:message code="electronics.cart.label" default="Cart" /></span>
					
						<g:each in="${electronicsInstance.cart}" var="c">
						<span class="property-value" aria-labelledby="cart-label"><g:link controller="cart" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${electronicsInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="electronics.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${electronicsInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${electronicsInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="electronics.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${electronicsInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${electronicsInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="electronics.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${electronicsInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${electronicsInstance?.prodCount}">
				<li class="fieldcontain">
					<span id="prodCount-label" class="property-label"><g:message code="electronics.prodCount.label" default="Prod Count" /></span>
					
						<span class="property-value" aria-labelledby="prodCount-label"><g:fieldValue bean="${electronicsInstance}" field="prodCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${electronicsInstance?.variants}">
				<li class="fieldcontain">
					<span id="variants-label" class="property-label"><g:message code="electronics.variants.label" default="Variants" /></span>
					
						<g:each in="${electronicsInstance.variants}" var="v">
						<span class="property-value" aria-labelledby="variants-label"><g:link controller="variant" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:electronicsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${electronicsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
