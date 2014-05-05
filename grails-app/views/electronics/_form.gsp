<%@ page import="skymall.Electronics"%>

<g:if test="${storeID == null}">
	<g:set var="storeID" value="${electronicsInstance?.storeID}"
		scope="flash" />
</g:if>

<div
	class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'prodName', 'error')} required">
	<label for="prodName"> <g:message
			code="electronics.prodName.label" default="Prod Name" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required=""
		value="${electronicsInstance?.prodName}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'model', 'error')} ">
	<label for="model"> <g:message code="electronics.model.label"
			default="Model" /><span class="required-indicator">*</span>

	</label>
	<g:textField name="model"  required="" value="${electronicsInstance?.model}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'price', 'error')} required">
	<label for="price"> <g:message code="electronics.price.label"
			default="Price" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="price"
		value="${fieldValue(bean: electronicsInstance, field: 'price')}"
		required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: electronicsInstance, field: 'description', 'error')} ">
	<label for="description"> <g:message
			code="electronics.description.label" default="Description" />

	</label>
	<g:textArea name="description"
		value="${electronicsInstance?.description}" />
</div>



<div class="fieldcontain"
	${hasErrors(bean: electronicsInstance, field: 'variants', 'error')}>
	<label for="variants"> <g:message
			code="electronics.variants.label" default="" />
	</label>
	<g:render template="variants"
		model="['electronicsInstance':electronicsInstance]" />
</div>

<g:hiddenField name="storeID" value="${electronicsInstance?.storeID}" />