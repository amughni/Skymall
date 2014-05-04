
<%@ page import="skymall.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'book.label', default: 'Book')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-book" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<g:if test="${storeID == null}">
				<g:set var="storeID" value="${flash.storeID}" scope="flash" />
			</g:if>
			
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
						
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-book" class="content scaffold-list" role="main">
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

					<g:sortableColumn property="prodName"
						title="${message(code: 'book.prodName.label', default: 'Prod Name')}" />

					<g:sortableColumn property="author"
						title="${message(code: 'book.author.label', default: 'Author')}" />

					<g:sortableColumn property="category"
						title="${message(code: 'book.category.label', default: 'Category')}" />

					<g:sortableColumn property="description"
						title="${message(code: 'book.description.label', default: 'Description')}" />

					<g:sortableColumn property="isbn"
						title="${message(code: 'book.isbn.label', default: 'Isbn')}" />

					<g:sortableColumn property="price"
						title="${message(code: 'book.price.label', default: 'Price')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${bookInstanceList}" status="i" var="bookInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${bookInstance.id}">
								${fieldValue(bean: bookInstance, field: "prodName")}
							</g:link></td>

						<td>
							${fieldValue(bean: bookInstance, field: "author")}
						</td>

						<td>
							${fieldValue(bean: bookInstance, field: "category")}
						</td>

						<td>
							${fieldValue(bean: bookInstance, field: "description")}
						</td>

						<td>
							${fieldValue(bean: bookInstance, field: "isbn")}
						</td>

						<td>
							${fieldValue(bean: bookInstance, field: "price")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${bookInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
