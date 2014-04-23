
<%@ page import="skymall.Store" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-store" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="list-store" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
			<thead>
					<tr>
						
						<g:sortableColumn property="storeID" title="${message(code: 'store.storeID.label', default: 'Store ID')}" />
					
						<g:sortableColumn property="location" title="${message(code: 'store.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="storeName" title="${message(code: 'store.storeName.label', default: 'Store Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${storeInstanceList}" status="i" var="storeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="Product" action="list" id="${storeInstance.storeID}">${fieldValue(bean: storeInstance, field: "storeID")}</g:link></td>
					
						<td>${fieldValue(bean: storeInstance, field: "location")}</td>
					
						<td>${fieldValue(bean: storeInstance, field: "storeName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${storeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
