
<%@ page import="skymall.Electronics" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'electronics.label', default: 'Electronics')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-electronics" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-electronics" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prodName" title="${message(code: 'electronics.prodName.label', default: 'Prod Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'electronics.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'electronics.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="prodCount" title="${message(code: 'electronics.prodCount.label', default: 'Prod Count')}" />
					
						<g:sortableColumn property="storeID" title="${message(code: 'electronics.storeID.label', default: 'Store ID')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${electronicsInstanceList}" status="i" var="electronicsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${electronicsInstance.id}">${fieldValue(bean: electronicsInstance, field: "prodName")}</g:link></td>
					
						<td>${fieldValue(bean: electronicsInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: electronicsInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: electronicsInstance, field: "prodCount")}</td>
					
						<td>${fieldValue(bean: electronicsInstance, field: "storeID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${electronicsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
