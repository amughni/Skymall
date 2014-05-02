<div id="bookSubCategory${i}">
	<g:hiddenField name='expandableBookSubCategoryList[${i}].id'
		value='${bookSubCategory.id}' />
	<g:textField name='expandableBookSubCategoryList[${i}].name'
		value='${bookSubCategory.name}' />
	<input type="hidden" name='expandableBookSubCategoryList[${i}]._deleted' id='expandableBookSubCategoryList[${i}]._deleted' value='false' /> 
	<span onClick="$('#expandableBookSubCategoryList\\[${i}\\]\\._deleted').val('true'); $('#bookSubCategory${i}').hide()">
		<img src="${resource(dir:'images/skin', file:'database_delete.png')}" />
	</span>
</div>