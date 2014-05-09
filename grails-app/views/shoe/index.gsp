
<%@ page import="skymall.Shoe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shoe.label', default: 'Shoe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shoe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shoe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prodName" title="${message(code: 'shoe.prodName.label', default: 'Prod Name')}" />
					
						<g:sortableColumn property="storeID" title="${message(code: 'shoe.storeID.label', default: 'Store ID')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'shoe.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="category" title="${message(code: 'shoe.category.label', default: 'Category')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shoeInstanceList}" status="i" var="shoeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shoeInstance.id}">${fieldValue(bean: shoeInstance, field: "prodName")}</g:link></td>
					
						<td>${fieldValue(bean: shoeInstance, field: "storeID")}</td>
					
						<td>${fieldValue(bean: shoeInstance, field: "image")}</td>
					
						<td>${fieldValue(bean: shoeInstance, field: "imageType")}</td>
					
						<td>${fieldValue(bean: shoeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: shoeInstance, field: "category")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shoeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
