
<%@ page import="skymall.Cart"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'cart.label', default: 'Cart')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-cart" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>

		</ul>
	</div>
	<div id="show-cart" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<g:set var="cid" value="${cartInstance?.id}" scope="flash" />

		<ol class="property-list cart">
			<g:if test="${cartInstance?.productList}">
				<table>
					<thead>
						<tr>
							<g:sortableColumn property="name"
								title="${message(code: 'apparel.name.label', default: 'Name')}" />

							<g:sortableColumn property="description"
								title="${message(code: 'apparel.name.label', default: 'Description')}" />

							<g:sortableColumn property="price"
								title="${message(code: 'apparel.name.label', default: 'Price')}" />

							<g:sortableColumn property="Action"
								title="${message(code: 'apparel.action.label', default: 'Action')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${cartInstance?.productList}" status="i"
							var="productInstance">

							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td>
									${fieldValue(bean: productInstance, field: "prodName")}
								</td>

								<td>
									${fieldValue(bean: productInstance, field: "description")}
								</td>

								<td>
									${fieldValue(bean: productInstance, field: "price")}
								</td>

								<td><g:link controller="cart" action="deleteProduct"
										id="${productInstance?.id}">
										Remove
									</g:link></td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</g:if>

		</ol>

		<g:form>
			<fieldset class="buttons">
				<g:link controller="apparel" action="show" id="${flash.prodID}">
					<g:message code="default.button.back.label"
						default="Back to product" />
				</g:link>
			</fieldset>
		</g:form>

	</div>
</body>
</html>
