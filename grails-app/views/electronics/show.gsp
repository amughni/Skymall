
<%@ page import="skymall.Electronics"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'electronics.label', default: 'Electronics')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-electronics" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<g:if test="${storeID == null}">
				<g:set var="storeID" value="${electronicsInstance?.storeID}"
					scope="flash" />
			</g:if>

			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>

			<li><g:link controller="electronics" action="list"
					id="${electronicsInstance?.storeID}">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<g:if test="${session.user.userRole == 'Tenant'}">
				<li><g:link class="create" action="create">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
			</g:if>
			<g:if test="${session.user.userRole == 'Shopper'}">
				<li><g:link controller="cart" action="addProduct"
						params="[pid: electronicsInstance.id, uid: session.user.id]">
						<g:message code="Add to cart" args="[entityName]" />
					</g:link></li>
			</g:if>
		</ul>
	</div>
	<div id="show-electronics" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list electronics">
			<g:if test="${electronicsInstance?.image}">
				<li class="fieldcontain"><span id="image-label"
					class="property-label"><g:message
							code="electronics.image.label" default=" " /></span> <span
					class="property-value" aria-labelledby="image-label"><img
						class="image"
						src="${createLink(controller:'electronics', action:'getImage', id:electronicsInstance.id)}" />
				</span>
			</g:if>
			<g:if test="${electronicsInstance?.prodName}">
				<li class="fieldcontain"><span id="prodName-label"
					class="property-label"><g:message
							code="electronics.prodName.label" default="Prod Name" /></span> <span
					class="property-value" aria-labelledby="prodName-label"><g:fieldValue
							bean="${electronicsInstance}" field="prodName" /></span></li>
			</g:if>
			<g:if test="${electronicsInstance?.prodName}">
				<li class="fieldcontain"><span id="prodName-label"
					class="property-label"><g:message
							code="electronics.prodName.label" default="Prod Name" /></span> <span
					class="property-value" aria-labelledby="prodName-label"><g:fieldValue
							bean="${electronicsInstance}" field="prodName" /></span></li>
			</g:if>

			<g:if test="${electronicsInstance?.description}">
				<li class="fieldcontain"><span id="description-label"
					class="property-label"><g:message
							code="electronics.description.label" default="Description" /></span> <span
					class="property-value" aria-labelledby="description-label"><g:fieldValue
							bean="${electronicsInstance}" field="description" /></span></li>
			</g:if>

			<g:if test="${electronicsInstance?.model}">
				<li class="fieldcontain"><span id="model-label"
					class="property-label"><g:message
							code="electronics.model.label" default="Model" /></span> <span
					class="property-value" aria-labelledby="model-label"><g:fieldValue
							bean="${electronicsInstance}" field="model" /></span></li>
			</g:if>

			<g:if test="${electronicsInstance?.price}">
				<li class="fieldcontain"><span id="price-label"
					class="property-label"><g:message
							code="electronics.price.label" default="Price" /></span> <span
					class="property-value" aria-labelledby="price-label"><g:fieldValue
							bean="${electronicsInstance}" field="price" /></span></li>
			</g:if>

			<g:if test="${electronicsInstance?.variants}">
				<table>
					<thead>
						<tr>

							<g:sortableColumn property="name"
								title="${message(code: 'electronics.name.label', default: 'Product Feature')}" />

							<g:sortableColumn property="value"
								title="${message(code: 'electronics.value.label', default: 'Description')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${electronicsInstance?.variants}" status="i"
							var="variantInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td>
									${fieldValue(bean: variantInstance, field: "name")}
								</td>

								<td>
									${fieldValue(bean: variantInstance, field: "value")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
			</g:if>


		</ol>
		<g:form url="[resource:electronicsInstance, action:'delete']"
			method="DELETE">
			<g:if test="${session.user.userRole == 'Tenant'}">
				<fieldset class="buttons">
					<g:link class="edit" action="edit"
						resource="${electronicsInstance}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:if>
		</g:form>
	</div>
</body>
</html>
