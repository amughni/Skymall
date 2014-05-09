
<%@ page import="skymall.Shoe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shoe.label', default: 'Shoe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-shoe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<g:if test="${session.user.userRole == 'Tenant'}">
				
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</g:if>
			</ul>
		</div>
		<div id="show-shoe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shoe">
			
				<g:if test="${shoeInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="shoe.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${shoeInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoeInstance?.storeID}">
				<li class="fieldcontain">
					<span id="storeID-label" class="property-label"><g:message code="shoe.storeID.label" default="Store ID" /></span>
					
						<span class="property-value" aria-labelledby="storeID-label"><g:fieldValue bean="${shoeInstance}" field="storeID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoeInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label">
					<g:message code="shoe.image.label" default="Image" /></span>
					
					<img class="image"
						src="${createLink(controller:'shoe', action:'getImage', id:shoeInstance.id)}" />
				</li>
				</g:if>
			
			
				<g:if test="${shoeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="shoe.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${shoeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoeInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="shoe.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${shoeInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoeInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="shoe.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${shoeInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoeInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="shoe.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${shoeInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoeInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="shoe.size.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${shoeInstance}" field="size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shoeInstance?.variants}">
				<li class="fieldcontain">
					<span id="variants-label" class="property-label"><g:message code="shoe.variants.label" default="Variants" /></span>
					
						<g:each in="${shoeInstance.variants}" var="v">
						<span class="property-value" aria-labelledby="variants-label"><g:link controller="variant" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:shoeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:if test="${session.user.userRole == 'Tenant'}">
						<g:link class="edit" action="edit" resource="${shoeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
