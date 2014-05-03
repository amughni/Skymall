<div id="variant">
	<g:hiddenField name='expandableVariantList[${i}].id'
		value='${variant.id}' />
	<g:textField name='expandableVariantList[${i}].name'
		value='${variant.name}' />
	<g:textField name='expandableVariantList[${i}].value'
		value='${variant.name}' />
	
	<input type="hidden" name='expandableVariantList[${i}]._deleted' id='expandableVariantList[${i}]._deleted' value='false' /> 
	<span onClick="$('#expandableVariantList\\[${i}\\]\\._deleted').val('true'); $('#variant${i}').hide()">
		<img src="${resource(dir:'images/skin', file:'database_delete.png')}" />
	</span>
</div>