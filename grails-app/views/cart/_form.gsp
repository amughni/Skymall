<%@ page import="skymall.Cart" %>



<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'productList', 'error')} ">
	<label for="productList">
		<g:message code="cart.productList.label" default="Product List" />
		
	</label>
	<g:select name="productList" from="${skymall.Product.list()}" multiple="multiple" optionKey="id" size="5" value="${cartInstance?.productList*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="cart.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${skymall.User.list()}" optionKey="id" required="" value="${cartInstance?.user?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cartInstance, field: 'userID', 'error')} ">
	<label for="userID">
		<g:message code="cart.userID.label" default="User ID" />
		
	</label>
	<g:textField name="userID" value="${cartInstance?.userID}"/>

</div>

