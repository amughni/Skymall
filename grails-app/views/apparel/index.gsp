
<%@ page import="skymall.Apparel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'apparel.label', default: 'Apparel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-apparel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-apparel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prodName" title="${message(code: 'apparel.prodName.label', default: 'Prod Name')}" />
					
						<g:sortableColumn property="color" title="${message(code: 'apparel.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="prodCount" title="${message(code: 'apparel.prodCount.label', default: 'Product Count')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'apparel.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'apparel.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="size" title="${message(code: 'apparel.apparelSize.label', default: 'Size')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${apparelInstanceList}" status="i" var="apparelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${apparelInstance.id}">${fieldValue(bean: apparelInstance, field: "prodName")}</g:link></td>
					
						<td>${fieldValue(bean: apparelInstance, field: "color")}</td>
					
						<td>${fieldValue(bean: apparelInstance, field: "prodCount")}</td>
					
						<td>${fieldValue(bean: apparelInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: apparelInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: apparelInstance, field: "apparelSize")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${apparelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
