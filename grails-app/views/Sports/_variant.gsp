<div id="variant${i}">
	<g:hiddenField name='variants[${i}].id' value='${variant.id}' />
	<label for='variants[${i}].name'> Sports Feature </label>
	<g:textField name='variants[${i}].name' value='${variant.name}' />
	<label for='value'>Description </label>
	<g:textField name='variants[${i}].value' value='${variant.value}' />
	<input type="hidden" name='variants[${i}]._deleted'
		id='variants[${i}]._deleted' value='false' /> <span
		onClick="$('#variants\\[${i}\\]\\._deleted').val('true'); $('#variant${i}').hide()">
		<img src="${resource(dir:'images/skin', file:'database_delete.png')}" />
	</span>
</div>