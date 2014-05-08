
<%@ page import="skymall.Automobile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'automobile.label', default: 'Automobile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-automobile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message
                        code="default.home.label" /></a></li>

                <g:if test="${storeID == null}">
                    <g:set var="storeID" value="${automobileInstance?.storeID}"
                           scope="flash" />
                </g:if>

                <li><g:link controller="Automobile" action="list"
                            id="${automobileInstance?.storeID}">
                    <g:message code="default.list.label" args="[entityName]" />
                </g:link></li>

                <g:if test="${session.user.userRole == 'Tenant'}">
                    <li><g:link class="create" action="create">
                        <g:message code="default.new.label" args="[entityName]" />
                    </g:link></li>
                </g:if>

                %{--<g:if test="${session.user.userRole == 'Shopper'}">--}%
                    %{--<li><g:link controller="cart" action="addProduct"--}%
                                %{--params="[pid: automobileInstance.id, uid: session.user.id]">--}%
                        %{--<g:message code="Add to cart" args="[entityName]" />--}%
                    %{--</g:link></li>--}%
                %{--</g:if>--}%
            </ul>
		</div>
		<div id="show-automobile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list automobile">
			
				<g:if test="${automobileInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="automobile.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${automobileInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${automobileInstance?.storeID}">
				<li class="fieldcontain">
					<span id="storeID-label" class="property-label"><g:message code="automobile.storeID.label" default="Store ID" /></span>

						<span class="property-value" aria-labelledby="storeID-label"><g:fieldValue bean="${automobileInstance}" field="storeID"/></span>

				</li>
				</g:if>


				<g:if test="${automobileInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="automobile.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${automobileInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${automobileInstance?.manufacturer}">
				<li class="fieldcontain">
					<span id="manufacturer-label" class="property-label"><g:message code="automobile.manufacturer.label" default="Manufacturer" /></span>
					
						<span class="property-value" aria-labelledby="manufacturer-label"><g:fieldValue bean="${automobileInstance}" field="manufacturer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${automobileInstance?.warranty}">
				<li class="fieldcontain">
					<span id="warranty-label" class="property-label"><g:message code="automobile.warranty.label" default="Warranty" /></span>
					
						<span class="property-value" aria-labelledby="warranty-label"><g:fieldValue bean="${automobileInstance}" field="warranty"/></span>
					
				</li>
				</g:if>

				%{--<g:if test="${automobileInstance?.cart}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="cart-label" class="property-label"><g:message code="automobile.cart.label" default="Cart" /></span>--}%
					%{----}%
						%{--<g:each in="${automobileInstance.cart}" var="c">--}%
						%{--<span class="property-value" aria-labelledby="cart-label"><g:link controller="cart" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>--}%
						%{--</g:each>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%

				<g:if test="${automobileInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="automobile.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${automobileInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${automobileInstance?.variants}">
				<li class="fieldcontain">
					<span id="variants-label" class="property-label"><g:message code="automobile.variants.label" default="Variants" /></span>
					
						<g:each in="${automobileInstance.variants}" var="v">
						<span class="property-value" aria-labelledby="variants-label"><g:link controller="variant" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:automobileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${automobileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
