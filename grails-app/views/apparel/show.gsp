
<%@ page import="skymall.Apparel"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'apparel.label', default: 'Apparel')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-apparel" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>

			<g:if test="${storeID == null}">
				<g:set var="storeID" value="${apparelInstance?.storeID}"
					scope="flash" />
			</g:if>

			<li><g:link controller="apparel" action="list"
					id="${apparelInstance?.storeID}">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>

			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-apparel" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list apparel">

			<g:if test="${apparelInstance?.prodName}">
				<li class="fieldcontain"><span id="prodName-label"
					class="property-label"><g:message
							code="apparel.prodName.label" default="Prod Name" /></span> <span
					class="property-value" aria-labelledby="prodName-label"><g:fieldValue
							bean="${apparelInstance}" field="prodName" /></span></li>
			</g:if>

			<g:if test="${apparelInstance?.color}">
				<li class="fieldcontain"><span id="color-label"
					class="property-label"><g:message code="apparel.color.label"
							default="Color" /></span> <span class="property-value"
					aria-labelledby="color-label"><g:fieldValue
							bean="${apparelInstance}" field="color" /></span></li>
			</g:if>

			<g:if test="${apparelInstance?.description}">
				<li class="fieldcontain"><span id="description-label"
					class="property-label"><g:message
							code="apparel.description.label" default="Description" /></span> <span
					class="property-value" aria-labelledby="description-label"><g:fieldValue
							bean="${apparelInstance}" field="description" /></span></li>
			</g:if>

			<g:if test="${apparelInstance?.price}">
				<li class="fieldcontain"><span id="price-label"
					class="property-label"><g:message code="apparel.price.label"
							default="Price" /></span> <span class="property-value"
					aria-labelledby="price-label"><g:fieldValue
							bean="${apparelInstance}" field="price" /></span></li>
			</g:if>

			<g:if test="${apparelInstance?.apparelSize}">
				<li class="fieldcontain"><span id="size-label"
					class="property-label"><g:message
							code="apparel.apparelSize.label" default="Size" /></span> <span
					class="property-value" aria-labelledby="size-label"><g:fieldValue
							bean="${apparelInstance}" field="apparelSize" /></span></li>
			</g:if>

			<g:if test="${apparelInstance?.variants}">
				<table>
					<thead>
						<tr>

							<g:sortableColumn property="name"
								title="${message(code: 'apparel.name.label', default: 'Apparel Feature')}" />

							<g:sortableColumn property="value"
								title="${message(code: 'apparel.value.label', default: 'Description')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${apparelInstance?.variants}" status="i"
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
		<g:form url="[resource:apparelInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${apparelInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
		
		<g:form url="[resource:apparelInstance, action:'addToCart']"
			method="">
			<fieldset class="buttons">
				<g:link class="add" action="add" resource="${apparelInstance}">
					<g:message code="default.button.add.label" default="Add to cart" />
				</g:link>
				<g:actionSubmit class="add" action="add"
					value="${message(code: 'default.button.add.label', default: 'Add to cart ')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
