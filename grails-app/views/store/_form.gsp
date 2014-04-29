<%@ page import="skymall.Store"%>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'storeName', 'error')} ">
	<label for="storeName"> <g:message code="store.storeName.label"
			default="Store Name" />

	</label>
	<g:textField name="storeName" value="${storeInstance?.storeName}" />

</div>
<div>
	<label for="storeType"> <g:message code="store.storeType.label"
			default="Store Type" />

	</label>
	<g:select name="storeType" from="${skymall.StoreTypes.getTypeNames()}"
		value="${storeInstance?.storeType}"
		noSelection="['':'-Choose a store type']"></g:select>
</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'location', 'error')} ">
	<label for="location"> <g:message code="store.location.label"
			default="Location" />

	</label>
	<g:textField name="location" value="${storeInstance?.location}" />

</div>