<%@ page import="skymall.BookCategory" %>


<div class="fieldcontain ${hasErrors(bean: bookCategoryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="bookCategory.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${bookCategoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookCategoryInstance, field: 'bookSubCategories', 'error')} ">
	<label for="bookSubCategories">
		<g:message code="bookCategory.bookSubCategories.label" default="Book Sub Categories" />
		
	</label>
	<g:select name="bookSubCategories" from="${skymall.BookSubCategory.list()}" multiple="multiple" optionKey="id" size="5" value="${bookCategoryInstance?.bookSubCategories*.id}" class="many-to-many"/>

</div>



<div class="fieldcontain ${hasErrors(bean: bookCategoryInstance, field: 'storeID', 'error')} ">
	<g:hiddenField name="storeID" value="${bookCategoryInstance?.storeID}" />

</div>

