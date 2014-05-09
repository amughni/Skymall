
<%@ page import="skymall.StoreTypes; skymall.Store" import="skymall.StoreTypes"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'store.label', default: 'Store')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-store" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<g:if
				test="${storeInstance?.storeType == StoreTypes.APPAREL.toString()}">
				<g:link controller="Apparel" action="list" id="${storeInstance.id}">Product List</g:link>
			</g:if>
			<g:elseif
				test="${storeInstance?.storeType == StoreTypes.ELECTRONICS.toString()}">
				<g:link controller="Electronics" action="list"
					id="${storeInstance.id}">Product List</g:link>
			</g:elseif>
			<g:elseif
				test="${storeInstance?.storeType == StoreTypes.BOOKS.toString()}">
				<g:link controller="Book" action="list" id="${storeInstance.id}">Product List</g:link>
			</g:elseif>
            <g:elseif
                    test="${storeInstance?.storeType == StoreTypes.AUTOMOBILE.toString()}">
                <g:link controller="Automobile" action="list" id="${storeInstance.id}">Product List</g:link>
            </g:elseif>
            <g:elseif
                    test="${storeInstance?.storeType == StoreTypes.SHOES.toString()}">
                <g:link controller="Shoe" action="list" id="${storeInstance.id}">Product List</g:link>
            </g:elseif>
		</ul>
	</div>
	<div id="show-store" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list store">

			<g:if test="${storeInstance?.storeName}">
				<li class="fieldcontain"><span id="storeName-label"
					class="property-label"><g:message
							code="store.storeName.label" default="Store Name" /></span> <span
					class="property-value" aria-labelledby="storeName-label"><g:fieldValue
							bean="${storeInstance}" field="storeName" /></span></li>
			</g:if>


			<g:if test="${storeInstance?.storeType}">
				<li class="fieldcontain"><span id="storeType-label"
					class="property-label"><g:message
							code="store.storeType.label" default="Store Type" /></span> <span
					class="property-value" aria-labelledby="storeType-label"><g:fieldValue
							bean="${storeInstance}" field="storeType" /></span></li>
			</g:if>
			<g:if test="${storeInstance?.addressLine}">
				<li class="fieldcontain"><span id="addressLine-label"
					class="property-label"><g:message
							code="store.addressLine.label" default="Address Line 1" /></span> <span
					class="property-value" aria-labelledby="addressLine-label"><g:fieldValue
							bean="${storeInstance}" field="addressLine" /></span></li>
			</g:if>
			<g:if test="${storeInstance?.city}">
				<li class="fieldcontain"><span id="city-label"
					class="property-label"><g:message code="store.city.label"
							default="City" /></span> <span class="property-value"
					aria-labelledby="city-label"><g:fieldValue
							bean="${storeInstance}" field="city" /></span></li>
			</g:if>

			<g:if test="${storeInstance?.state}">
				<li class="fieldcontain"><span id="state-label"
					class="property-label"><g:message code="store.state.label"
							default="State" /></span> <span class="property-value"
					aria-labelledby="state-label"><g:fieldValue
							bean="${storeInstance}" field="state" /></span></li>
			</g:if>

			<g:if test="${storeInstance?.zip}">
				<li class="fieldcontain"><span id="zip-label"
					class="property-label"><g:message code="store.zip.label"
							default="Zip" /></span> <span class="property-value"
					aria-labelledby="zip-label"><g:fieldValue
							bean="${storeInstance}" field="zip" /></span></li>
			</g:if>

			<g:if test="${storeInstance?.country}">
				<li class="fieldcontain"><span id="country-label"
					class="property-label"><g:message code="store.country.label"
							default="Country" /></span> <span class="property-value"
					aria-labelledby="country-label"><g:fieldValue
							bean="${storeInstance}" field="country" /></span></li>
			</g:if>
		</ol>
		<g:form url="[resource:storeInstance, action:'delete']"
			method="DELETE">
				<g:if test="${session.user.userRole == 'Tenant'}">
					
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${storeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				
				</g:if>
		</g:form>

	</div>
</body>
</html>
