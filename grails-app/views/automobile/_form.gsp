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

%{--<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'storeID', 'error')} required">--}%
	%{--<label for="storeID">--}%
		%{--<g:message code="automobile.storeID.label" default="Store ID" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:textField name="storeID" required="" value="${automobileInstance?.storeID}"/>--}%

%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="automobile.image.label" default="Image" />
		
	</label>
	<input type="file" id="image" name="image" />

</div>

%{--<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'imageType', 'error')} ">--}%
	%{--<label for="imageType">--}%
		%{--<g:message code="automobile.imageType.label" default="Image Type" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="imageType" value="${automobileInstance?.imageType}"/>--}%

%{--</div>--}%

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

%{--<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'cart', 'error')} ">--}%
	%{--<label for="cart">--}%
		%{--<g:message code="automobile.cart.label" default="Cart" />--}%
		%{----}%
	%{--</label>--}%
	%{----}%

%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: automobileInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="automobile.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: automobileInstance, field: 'price')}" required=""/>

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

