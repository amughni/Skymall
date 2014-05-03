<%@ page import="skymall.Book" 
import="skymall.Category" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'prodName', 'error')} required">
	<label for="prodName">
		<g:message code="book.prodName.label" default="Prod Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required="" value="${bookInstance?.prodName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="book.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${bookInstance?.author}"/>

</div>

<div
	class="fieldcontain ${hasErrors(bean: bookInstance, field: 'category', 'error')} ">
	<label for="category"> <g:message code="book.category.label"
			default="Category" />

	</label>
	<g:select id="category" name="category"
		from="${Category.getCategoryNames()}"
		value="${bookInstance?.category}"
		noSelection="['':'-Choose a category for book']" ></g:select>
		
	<g:select id="subCategory" name="subCategory"
		from="${[Category.getCategoryNames()]}"
		value="${bookInstance?.subCategory}"
		noSelection="['':'-Choose a subcategory']"></g:select>
</div>


<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="book.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${bookInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'isbn', 'error')} ">
	<label for="isbn">
		<g:message code="book.isbn.label" default="Isbn" />
		
	</label>
	<g:textField name="isbn" value="${bookInstance?.isbn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="book.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="price" value="${fieldValue(bean: bookInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'prodCount', 'error')} required">
	<label for="prodCount">
		<g:message code="book.prodCount.label" default="Prod Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="prodCount" type="number" value="${bookInstance?.prodCount}" required=""/>

</div>

<div class="fieldcontain"
	${hasErrors(bean: bookInstance, field: 'variants', 'error')}>
	<label for="variants"> <g:message code="book.variants.label"
			default="Variants" /> <span class="required-indicator">*</span>
	</label>
	<g:render template="variants"
		model="['bookInstance':bookInstance]" />
</div>

<g:hiddenField name="storeID" value="${bookInstance?.storeID}" />