<%@ page import="skymall.Automobile" %>

<g:if test="${storeID == null}">
    <g:set var="storeID" value="${automobileInstance?.storeID}" scope="flash" />
</g:if>

<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'prodName', 'error')} required">
	<label for="prodName">
		<g:message code="automobile.prodName.label" default="Prod Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required="" value="${automobileInstance?.prodName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="automobile.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${automobileInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'manufacturer', 'error')} ">
	<label for="manufacturer">
		<g:message code="automobile.manufacturer.label" default="Manufacturer" />
		
	</label>
	<g:textField name="manufacturer" value="${automobileInstance?.manufacturer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'warranty', 'error')} ">
	<label for="warranty">
		<g:message code="automobile.warranty.label" default="Warranty" />
		
	</label>
	<g:textField name="warranty" value="${automobileInstance?.warranty}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="automobile.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="price" required="" value="${fieldValue(bean: automobileInstance, field: 'price')}"/>

</div>

<div class="fieldcontain"
    ${hasErrors(bean: automobileInstance, field: 'variants', 'error')}>
    <label for="variants"> <g:message code="automobile.variants.label"
                                      default="" />
    </label>
    <g:render template="variants"
              model="['AutomobileInstance':automobileInstance]" />
</div>

<g:hiddenField name="storeID" value="${automobileInstance?.storeID}" />

