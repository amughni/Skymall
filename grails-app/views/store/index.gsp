
<%@ page import="skymall.Store"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'store.label', default: 'Store')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-store" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<g:if test="${storeID == null}">
				<g:set var="storeID" value="${flash.storeID}" />
			</g:if>

			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<g:if test="${session.user.userRole == 'Tenant'}">
				<li>
				<g:link class="create" action="create">
						<g:message code="default.new.label" args="[entityName]" />
				</g:link>
				</li>
			</g:if>
		</ul>
	</div>
	<div id="list-store" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="storeName"
						title="${message(code: 'store.storeName.label', default: 'Store Name')}" />

					<g:sortableColumn property="storeType"
						title="${message(code: 'store.storeType.label', default: 'Store Type')}" />

					<g:sortableColumn property="city"
						title="${message(code: 'store.city.label', default: 'City')}" />
						
					<g:sortableColumn property="state"
						title="${message(code: 'store.state.label', default: 'State')}" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${storeInstanceList}" status="i" var="storeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${storeInstance.id}">
								${fieldValue(bean: storeInstance, field: "storeName")}
							</g:link></td>
						<td>
							${fieldValue(bean: storeInstance, field: "storeType")}
						</td>
						<td>
							${fieldValue(bean: storeInstance, field: "city")}
						</td>
						<td>
							${fieldValue(bean: storeInstance, field: "state")}
						</td>
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
