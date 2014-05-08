
<%@ page import="skymall.Automobile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'automobile.label', default: 'Automobile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-automobile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-automobile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prodName" title="${message(code: 'automobile.prodName.label', default: 'Prod Name')}" />
					
						<g:sortableColumn property="storeID" title="${message(code: 'automobile.storeID.label', default: 'Store ID')}" />
					
						<g:sortableColumn property="image" title="${message(code: 'automobile.image.label', default: 'Image')}" />
					
						<g:sortableColumn property="imageType" title="${message(code: 'automobile.imageType.label', default: 'Image Type')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'automobile.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="manufacturer" title="${message(code: 'automobile.manufacturer.label', default: 'Manufacturer')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${automobileInstanceList}" status="i" var="automobileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${automobileInstance.id}">${fieldValue(bean: automobileInstance, field: "prodName")}</g:link></td>
					
						<td>${fieldValue(bean: automobileInstance, field: "storeID")}</td>
					
						<td>${fieldValue(bean: automobileInstance, field: "image")}</td>
					
						<td>${fieldValue(bean: automobileInstance, field: "imageType")}</td>
					
						<td>${fieldValue(bean: automobileInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: automobileInstance, field: "manufacturer")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${automobileInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
