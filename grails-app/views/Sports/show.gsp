
<%@ page import="skymall.Sports"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'sports.label', default: 'Sports')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-sports" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>

			<g:if test="${storeID == null}">
				<g:set var="storeID" value="${sportsInstance?.storeID}"
					scope="flash" />
			</g:if>

			<li><g:link controller="sports" action="list"
					id="${sportsInstance?.storeID}">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>

				<g:if test="${session.user.userRole == 'Tenant'}">
					<li><g:link class="create" action="create">
							<g:message code="default.new.label" args="[entityName]" />
						</g:link></li>
				</g:if>

		</ul>
	</div>
	<div id="show-sports" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list sports">
	
			
				<g:if test="${sportsInstance?.prodType}">
				<li class="fieldcontain"><span id="prodType-label"
					class="property-label"><g:message
							code="sports.prodType.label" default="prodType" /></span> <span
					class="property-value" aria-labelledby="prodType-label"><g:fieldValue
							bean="${sportsInstance}" field="prodType" /></span></li>
			</g:if>
			
			<g:if test="${sportsInstance?.prodName}">
				<li class="fieldcontain"><span id="prodName-label"
					class="property-label"><g:message
							code="sports.prodName.label" default="Prod Name" /></span> <span
					class="property-value" aria-labelledby="prodName-label"><g:fieldValue
							bean="${sportsInstance}" field="prodName" /></span></li>
			</g:if>
  
			<g:if test="${sportsInstance?.accessories}">
				<li class="fieldcontain"><span id="accessories-label"
					class="property-label"><g:message code="sports.accessories.label"
							default="accessories" /></span> <span class="property-value"
					aria-labelledby="accessories-label"><g:fieldValue
							bean="${sportsInstance}" field="accessories" /></span></li>
			</g:if>

			<g:if test="${sportsInstance?.price}">
				<li class="fieldcontain"><span id="price-label"
					class="property-label"><g:message code="sports.price.label"
							default="Price" /></span> <span class="property-value"
					aria-labelledby="price-label"><g:fieldValue
							bean="${sportsInstance}" field="price" /></span></li>
			</g:if>

		

			<g:if test="${sportsInstance?.variants}">
				<table>
					<thead>
						<tr>

							<g:sortableColumn property="name"
								title="${message(code: 'sports.name.label', default: 'Sports Feature')}" />

							<g:sortableColumn property="value"
								title="${message(code: 'sports.value.label', default: 'Description')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${sportsInstance?.variants}" status="i"
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
		<g:form url="[resource:sportsInstance, action:'delete']"
			method="DELETE">
			<g:if test="${session.user.userRole == 'Tenant'}">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${sportsInstance}">
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
