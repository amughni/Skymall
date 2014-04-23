<%@ page import="skymall.Store" %>



<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'storeID', 'error')} required">
	<label for="storeID">
		<g:message code="store.storeID.label" default="Store ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="storeID" required="" value="${storeInstance?.storeID}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="store.location.label" default="Location" />
		
	</label>
	<g:textField name="location" value="${storeInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'storeName', 'error')} ">
	<label for="storeName">
		<g:message code="store.storeName.label" default="Store Name" />
		
	</label>
	<g:textField name="storeName" value="${storeInstance?.storeName}"/>

</div>

