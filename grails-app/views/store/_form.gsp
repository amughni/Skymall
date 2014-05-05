<%@ page import="skymall.Store" import="skymall.StoreTypes"%>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'storeName', 'error')} ">
	<label for="storeName"> <g:message code="store.storeName.label"
			default="Store Name" /> <span class="required-indicator">*</span>

	</label>
	<g:textField name="storeName"  required="" value="${storeInstance?.storeName}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'storeType', 'error')} ">
	<label for="storeType"> <g:message code="store.storeType.label"
			default="Store Type" /> <span class="required-indicator">*</span>

	</label>
	<g:select id="storeType" name="storeType"  required=""
		from="${StoreTypes.getTypeNames()}"
		value="${storeInstance?.storeType}"
		noSelection="['':'-Choose a store type']"></g:select>
</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'addressLine', 'error')} ">
	<label for="addressLine"> <g:message
			code="store.addressLine.label" default="Address Line 1" /> <span class="required-indicator">*</span>

	</label>
	<g:textField name="addressLine"  required="" value="${storeInstance?.addressLine}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'city', 'error')} ">
	<label for="city"> <g:message code="store.city.label"
			default="City" /> <span class="required-indicator">*</span>

	</label>
	<g:textField name="city"  required="" value="${storeInstance?.city}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'state', 'error')} ">
	<label for="state"> <g:message code="store.state.label"
			default="State" /> <span class="required-indicator">*</span>

	</label>
	<g:textField name="state"  required="" value="${storeInstance?.state}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'zip', 'error')} ">
	<label for="zip"> <g:message code="store.zip.label"
			default="Zip" /> <span class="required-indicator">*</span>

	</label>
	<g:textField name="zip"  required="" value="${storeInstance?.zip}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: storeInstance, field: 'country', 'error')} ">
	<label for="country"> <g:message
			code="address.country.label" default="Country" />
	</label> <span class="required-indicator">*</span>
	<g:if
		test="${grailsApplication.config.grails?.plugin?.address?.countryCodes}">
		<g:countrySelect name="country"  required=""
			value="${storeInstance?.country}" noSelection="['':'']"
			from="${grailsApplication.config.grails?.plugin?.address?.countryCodes}" />
	</g:if>
	<g:else>
		<g:countrySelect name="country"  required=""
			value="${storeInstance?.country}" noSelection="['':'']" />
	</g:else>
</div>