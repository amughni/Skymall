
<%@ page import="skymall.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				
				<g:if test="${storeID == null}">
					<g:set var="storeID" value="${bookInstance?.storeID}" scope="flash"/>
				</g:if>
				
				<li><g:link controller="book" action="list" id="${bookInstance?.storeID}">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>			
				
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-book" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list book">
			
				<g:if test="${bookInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="book.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${bookInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="book.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${bookInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.cart}">
				<li class="fieldcontain">
					<span id="cart-label" class="property-label"><g:message code="book.cart.label" default="Cart" /></span>
					
						<g:each in="${bookInstance.cart}" var="c">
						<span class="property-value" aria-labelledby="cart-label"><g:link controller="cart" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="book.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${bookInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="book.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${bookInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.isbn}">
				<li class="fieldcontain">
					<span id="isbn-label" class="property-label"><g:message code="book.isbn.label" default="Isbn" /></span>
					
						<span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${bookInstance}" field="isbn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="book.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${bookInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.prodCount}">
				<li class="fieldcontain">
					<span id="prodCount-label" class="property-label"><g:message code="book.prodCount.label" default="Prod Count" /></span>
					
						<span class="property-value" aria-labelledby="prodCount-label"><g:fieldValue bean="${bookInstance}" field="prodCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.storeID}">
				<li class="fieldcontain">
					<span id="storeID-label" class="property-label"><g:message code="book.storeID.label" default="Store ID" /></span>
					
						<span class="property-value" aria-labelledby="storeID-label"><g:fieldValue bean="${bookInstance}" field="storeID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.subCategory}">
				<li class="fieldcontain">
					<span id="subCategory-label" class="property-label"><g:message code="book.subCategory.label" default="Sub Category" /></span>
					
						<span class="property-value" aria-labelledby="subCategory-label"><g:fieldValue bean="${bookInstance}" field="subCategory"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${bookInstance?.variants}">
				<table>
					<thead>
						<tr>

							<g:sortableColumn property="name"
								title="${message(code: 'apparel.name.label', default: 'Details')}" />

							<g:sortableColumn property="value"
								title="${message(code: 'apparel.value.label', default: 'Description')}" />							

						</tr>
					</thead>
					<tbody>
						<g:each in="${bookInstance?.variants}" status="i"
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
			<g:form url="[resource:bookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
