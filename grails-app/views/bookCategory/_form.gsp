<%@ page import="skymall.BookCategory" %>

<div class="fieldcontain ${hasErrors(bean: bookCategoryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="bookCategory.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${bookCategoryInstance?.name}"/>

</div>

<g:hiddenField name="storeID" value="1" />

<tr class="prop">
	<td valign="top" class="name"><label for="bookSubCategories">SubCategories:</label></td>
	<td valign="top"
		class="value ${hasErrors(bean:bookCategoryInstance, field:'bookSubCategories','errors')}">
		<g:render template="bookSubCategories"
			model="['bookCategoryInstance':bookCategoryInstance]" />
	</td>
</tr>


