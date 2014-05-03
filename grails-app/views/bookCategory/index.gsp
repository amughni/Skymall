
<%@ page import="skymall.BookCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bookCategory.label', default: 'BookCategory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bookCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bookCategory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'bookCategory.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="storeID" title="${message(code: 'bookCategory.storeID.label', default: 'Store ID')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bookCategoryInstanceList}" status="i" var="bookCategoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bookCategoryInstance.id}">${fieldValue(bean: bookCategoryInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: bookCategoryInstance, field: "storeID")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bookCategoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>