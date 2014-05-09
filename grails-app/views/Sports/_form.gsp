<%@ page import="skymall.Sports"%>

<g:if test="${storeID == null}">
	<g:set var="storeID" value="${sportsInstance?.storeID}" scope="flash" />
</g:if>

<div
	class="fieldcontain ${hasErrors(bean: sportsInstance, field: 'prodType', 'error')} required">
	<label for="prodType"> <g:message code="sports.prodType.label"
			default="prodType" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="prodType" required=""
		value="${sportsInstance?.prodType}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: sportsInstance, field: 'prodName', 'error')} required">
	<label for="prodName"> <g:message code="sports.prodName.label"
			default="Prod Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required=""
		value="${sportsInstance?.prodName}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: sportsInstance, field: 'accessories', 'error')} ">
	<label for="accessories"> <g:message code="sports.accessories.label"
			default="Accessories" />

	</label>
	<g:textField name="accessories" value="${sportsInstance?.accessories}" />

</div> 

<div
	class="fieldcontain ${hasErrors(bean: sportsInstance, field: 'price', 'error')} required">
	<label for="price"> <g:message code="sports.price.label"
			default="Price" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="price"
		value="${fieldValue(bean: sportsInstance, field: 'price')}"
		required="" />
</div>

 
 
<!-- 
<div
	class="fieldcontain
	${hasErrors(bean: sportsInstance, field: 'image', 'error')}">
	<label for="price"> <g:message code="sports.image.label"
			default="Product Image" />
	</label> <input type="file" name="image" id="image" />

	<g:if test="${sports?.image}">
		<img class="image"
			src="${createLink(controller:'sports', action:'getImage', id:sportsInstance.id)}" />
	</g:if>
</div>  -->


<!--  
<div
	class="fieldcontain ${hasErrors(bean: sportsInstance, field: 'description', 'error')} ">
	<label for="description"> <g:message
			code="sports.description.label" default="Description" />

	</label>
	<g:textArea name="description" value="${sportsInstance?.description}" />

</div>  -->

<div class="fieldcontain"
	${hasErrors(bean: sportsInstance, field: 'variants', 'error')}>
	<label for="variants"> <g:message code="sports.variants.label"
			default="" />
	</label>
	<g:render template="variants"
		model="['sportsInstance':sportsInstance]" />
</div>

<g:hiddenField name="storeID" value="${sportsInstance?.storeID}" />