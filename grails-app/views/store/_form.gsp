<%@ page import="skymall.Store" import="skymall.StoreTypes"%>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'storeName', 'error')} ">
	<label for="storeName"> <g:message code="store.storeName.label"
			default="Store Name" />

	</label>
	<g:textField name="storeName" value="${storeInstance?.storeName}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'storeType', 'error')} ">
	<label for="storeType"> <g:message code="store.storeType.label"
			default="Store Type" />

	</label>
	<g:select id="storeType" name="storeType"
		from="${StoreTypes.getTypeNames()}"
		value="${storeInstance?.storeType}"
		noSelection="['':'-Choose a store type']"></g:select>
</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'addressLine', 'error')} ">
	<label for="addressLine"> <g:message
			code="store.addressLine.label" default="Address Line 1" />

	</label>
	<g:textField name="addressLine" value="${storeInstance?.addressLine}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'city', 'error')} ">
	<label for="city"> <g:message code="store.city.label"
			default="City" />

	</label>
	<g:textField name="city" value="${storeInstance?.city}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'state', 'error')} ">
	<label for="state"> <g:message code="store.state.label"
			default="State" />

	</label>
	<g:textField name="state" value="${storeInstance?.state}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'zip', 'error')} ">
	<label for="zip"> <g:message code="store.zip.label"
			default="Zip" />

	</label>
	<g:textField name="zip" value="${storeInstance?.zip}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'country', 'error')} ">
	<label for="country"> <g:message
			code="address.country.label" default="Country" />
	</label>
	<g:if
		test="${grailsApplication.config.grails?.plugin?.address?.countryCodes}">
		<g:countrySelect name="country"
			value="${storeInstance?.country}" noSelection="['':'']"
			from="${grailsApplication.config.grails?.plugin?.address?.countryCodes}" />
	</g:if>
	<g:else>
		<g:countrySelect name="country"
			value="${storeInstance?.country}" noSelection="['':'']" />
	</g:else>
</div>

</div>