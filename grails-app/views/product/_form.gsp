<%@ page import="skymall.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'prodID', 'error')} required">
	<label for="prodID">
		<g:message code="product.prodID.label" default="Prod ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prodID" required="" value="${productInstance?.prodID}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'count', 'error')} required">
	<label for="count">
		<g:message code="product.count.label" default="Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="count" type="number" value="${productInstance.count}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${productInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="product.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: productInstance, field: 'price')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'prodName', 'error')} ">
	<label for="prodName">
		<g:message code="product.prodName.label" default="Prod Name" />
		
	</label>
	<g:textField name="prodName" value="${productInstance?.prodName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'storeID', 'error')} ">
	<label for="storeID">
		<g:message code="product.storeID.label" default="Store ID" />
		
	</label>
	<g:textField name="storeID" value="${productInstance?.storeID}"/>

</div>

