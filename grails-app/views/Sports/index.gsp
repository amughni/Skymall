
<%@ page import="skymall.Sports"%> 
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'sports.label', default: 'Sports]')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-sports" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<g:if test="${storeID == null}">
					<g:set var="storeID" value="${flash.storeID}" scope="flash"/>
			</g:if>
			
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			
			<g:if test="${session.user.userRole == 'Tenant'}">
				<li><g:link class="create" action="create">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link>
				</li>
			</g:if>
				
		</ul>
	</div>
	<div id="list-sports" class="content scaffold-list" role="main">
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


<!-- *******CHANGE******** Dropdown list eg. Indoor, Outdoor etc -->
					
					<g:sortableColumn property="prodName"
						title="${message(code: 'sports.prodName.label', default: 'Name of Sports')}" />

				
					<g:sortableColumn property="Price"
						title="${message(code: 'sports.price.label', default: 'Price')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${sportsInstanceList}" status="j" var="sportsInstance">
					<tr class="${(j % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${sportsInstance.id}">
								${fieldValue(bean: sportsInstance, field: "prodName")}
							</g:link></td>



						<td>
							${fieldValue(bean: sportsInstance, field: "price")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${sportsInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
