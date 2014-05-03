<div id="variant">
	<g:hiddenField name='variant[${i}].id'
		value='${variant.id}' />
	<g:textField name='variant[${i}].name'
		value='${variant.name}' />
	<g:textField name='variant[${i}].value'
		value='${variant.value}' />
	
	<input type="hidden" name='variant[${i}]._deleted' id='variant[${i}]._deleted' value='false' /> 
	<span onClick="$('#variant\\[${i}\\]\\._deleted').val('true'); $('#variant${i}').hide()">
		<img src="${resource(dir:'images/skin', file:'database_delete.png')}" />
	</span>
</div>