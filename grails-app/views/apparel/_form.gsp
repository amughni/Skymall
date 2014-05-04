<%@ page import="skymall.Apparel"%>

<g:if test="${storeID == null}">
	<g:set var="storeID" value="${apparelInstance?.storeID}" scope="flash" />
</g:if>

<div
	class="fieldcontain ${hasErrors(bean: apparelInstance, field: 'prodName', 'error')} required">
	<label for="prodName"> <g:message code="apparel.prodName.label"
			default="Prod Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required=""
		value="${apparelInstance?.prodName}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: apparelInstance, field: 'description', 'error')} ">
	<label for="description"> <g:message
			code="apparel.description.label" default="Description" />

	</label>
	<g:textField name="description" value="${apparelInstance?.description}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: apparelInstance, field: 'price', 'error')} required">
	<label for="price"> <g:message code="apparel.price.label"
			default="Price" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="price"
		value="${fieldValue(bean: apparelInstance, field: 'price')}"
		required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: apparelInstance, field: 'color', 'error')} ">
	<label for="color"> <g:message code="apparel.color.label"
			default="Color" />

	</label>
	<g:textField name="color" value="${apparelInstance?.color}" />

</div>


<div
	class="fieldcontain ${hasErrors(bean: apparelInstance, field: 'apparelSize', 'error')} ">
	<label for="size"> <g:message code="apparel.apparelSize.label"
			default="Size" />

	</label>
	<g:textField name="apparelSize" value="${apparelInstance?.apparelSize}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: apparelInstance, field: 'prodCount', 'error')} required">
	<label for="count"> <g:message code="apparel.prodCount.label"
			default="Count" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="prodCount" type="number"
		value="${apparelInstance?.prodCount}" required="" />

</div>

<div class="fieldcontain"
	${hasErrors(bean: apparelInstance, field: 'variants', 'error')}>
	<label for="variants"> <g:message code="apparel.variants.label"
			default="" /> 
	</label>
	<g:render template="variants"
		model="['apparelInstance':apparelInstance]" />
</div>

<g:hiddenField name="storeID" value="${apparelInstance?.storeID}" />