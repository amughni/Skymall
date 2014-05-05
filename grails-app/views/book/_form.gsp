<%@ page import="skymall.Book" import="skymall.Category"%>
<g:if test="${storeID == null}">
	<g:set var="storeID" value="${flash.storeID}" scope="flash" />
</g:if>
<div
	class="fieldcontain ${hasErrors(bean: bookInstance, field: 'prodName', 'error')} required">
	<label for="prodName"> <g:message code="book.prodName.label"
			default="Prod Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required=""
		value="${bookInstance?.prodName}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} ">
	<label for="author"> <g:message code="book.author.label"
			default="Author" />

	</label>
	<g:textField name="author" value="${bookInstance?.author}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: bookInstance, field: 'category', 'error')}">
	<label for="category"> <g:message code="book.category.label"
			default="Category" />

	</label>
	<g:select id="category" name="category"
		from="${Category.getCategoryNames()}"
		value="${bookInstance?.category}"
		onchange="${remoteFunction(
            controller:'book', 
            action:'ajaxGetSubCategory', 
            params:'\'cat=\' + escape(this.value)', 
            onSuccess:'updateSubCategory(data)')}"
		noSelection="['':'-Choose a category for book']"></g:select>

	<g:if test="${bookInstance?.category != null}">
		<g:set var="category" value="${bookInstance?.category}" scope="flash" />
	</g:if>

	<g:select id="subCategory" name="subCategory" from="${bookInstance?.subCategories}"
		value="${bookInstance?.subCategory}"
		noSelection="['':'-Choose a subcategory']"></g:select>
	<g:javascript>
  		function updateSubCategory(e) 
		{  
			if (e != null) 
			{ 
			    var scs = e.split(",")
				var rselect = document.getElementById('subCategory')
		
				// Clear all previous options 
				var l = rselect.length
				while (l > 0)
				 { 
					 l--
					  rselect.remove(l) 
				 }
				
				// Rebuild the select
				 for (var i=0; i < scs.length; i++) 
				 {
					 var sc = scs[i] 
					 var opt = document.createElement('option'); 
					 opt.text = sc 
					 if (i == 0){
					 	opt.value = ''
					 }else{
					 	opt.value = sc
					 }
					 try 
					 { 
						 rselect.add(opt, null) // standards compliant; doesn't work in IE 
					 }
					 catch(ex) 
					{
						 rselect.add(opt) // IE only
					}
				 }
			  }
		  }
	</g:javascript>
</div>

<div
	class="fieldcontain ${hasErrors(bean: bookInstance, field: 'description', 'error')} ">
	<label for="description"> <g:message
			code="book.description.label" default="Description" />

	</label>
	<g:textField name="description" value="${bookInstance?.description}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: bookInstance, field: 'isbn', 'error')} ">
	<label for="isbn"> <g:message code="book.isbn.label"
			default="Isbn" />

	</label>
	<g:textField name="isbn" value="${bookInstance?.isbn}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: bookInstance, field: 'price', 'error')} required">
	<label for="price"> <g:message code="book.price.label"
			default="Price" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="price"
		value="${fieldValue(bean: bookInstance, field: 'price')}" required="" />
</div>

<div class="fieldcontain"
	${hasErrors(bean: bookInstance, field: 'variants', 'error')}>
	<label for="variants"> <g:message code="book.variants.label"
			default="" />
	</label>
	<g:render template="variants" model="['bookInstance':bookInstance]" />
</div>
<g:hiddenField name="storeID" value="${bookInstance?.storeID}" />