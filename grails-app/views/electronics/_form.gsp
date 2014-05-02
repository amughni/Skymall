<%@ page import="skymall.Electronics" %>



<div class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'prodName', 'error')} required">
	<label for="prodName">
		<g:message code="electronics.prodName.label" default="Prod Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required="" value="${electronicsInstance?.prodName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'cart', 'error')} ">
	<label for="cart">
		<g:message code="electronics.cart.label" default="Cart" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="electronics.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${electronicsInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="electronics.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: electronicsInstance, field: 'price')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'prodCount', 'error')} required">
	<label for="prodCount">
		<g:message code="electronics.prodCount.label" default="Prod Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="prodCount" type="number" value="${electronicsInstance.prodCount}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'storeID', 'error')} ">
	<label for="storeID">
		<g:message code="electronics.storeID.label" default="Store ID" />
		
	</label>
	<g:textField name="storeID" value="${electronicsInstance?.storeID}"/>

</div>

