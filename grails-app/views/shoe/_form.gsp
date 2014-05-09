<%@ page import="skymall.Shoe" import="skymall.ShoeCategory"%>
<g:if test="${storeID == null}">
	<g:set var="storeID" value="${flash.storeID}" scope="flash" />
</g:if>



<div
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'prodName', 'error')} required">
	<label for="prodName"> <g:message code="shoe.prodName.label"
			default="Prod Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required=""
		value="${shoeInstance?.prodName}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'storeID', 'error')} required">
	<label for="storeID"> <g:message code="shoe.storeID.label"
			default="Store ID" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="storeID" required=""
		value="${shoeInstance?.storeID}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'image', 'error')} ">
	<label for="image"> <g:message code="shoe.image.label"
			default="Image" />

	</label> <input type="file" id="image" name="image" />

</div>


<div
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'description', 'error')} ">
	<label for="description"> <g:message
			code="shoe.description.label" default="Description" />

	</label>



	<g:textField name="description" value="${shoeInstance?.description}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'category', 'error')} ">
	<label for="category"> <g:message code="shoe.category.label"
			default="ShoeCategory" /><span class="required-indicator">*</span>

	</label>



	<g:select id="category" name="category" required=""
		from="${ShoeCategory.getShoeCategoryNames()}"
		value="${shoeInstance?.category}"
		onchange="${remoteFunction(
            controller:'shoe', 
            action:'ajaxGetStyle', 
            params:'\'cat=\' + escape(this.value)', 
            onSuccess:'updateStyle(data)')}"
		noSelection="['':'-Choose a category for shoe']"></g:select>

	<g:if test="${shoeInstance?.category != null}">
		<g:set var="category" value="${shoeInstance?.category}" scope="flash" />
	</g:if>

	<g:select id="style" name="style" required=""
		from="${shoeInstance?.style}" value="${shoeInstance?.style}"
		noSelection="['':'-Choose a style']"></g:select>
	<g:javascript>
  		function updateStyle(e) 
		{  
			if (e != null) 
			{ 
			    var scs = e.split(",")
				var rselect = document.getElementById('style')
		
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
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'color', 'error')} ">
	<label for="color"> <g:message code="shoe.color.label"
			default="Color" />

	</label>
	<g:textField name="color" value="${shoeInstance?.color}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'price', 'error')} required">
	<label for="price"> <g:message code="shoe.price.label"
			default="Price" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="price" required=""
		value="${fieldValue(bean: shoeInstance, field: 'price')}" required="" />
</div>


<div
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'size', 'error')} ">
	<label for="size"> <g:message code="shoe.size.label"
			default="Size" />

	</label>
	<g:textField name="size" value="${shoeInstance?.size}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: shoeInstance, field: 'variants', 'error')} ">
	<label for="variants"> <g:message code="shoe.variants.label"
			default="Variants" />

	</label>

	<ul class="one-to-many">
		<g:each in="${shoeInstance?.variants?}" var="v">
			<li><g:link controller="variant" action="show" id="${v.id}">
					${v?.encodeAsHTML()}
				</g:link></li>
		</g:each>
		<li class="add"><g:link controller="variant" action="create"
				params="['shoe.id': shoeInstance?.id]">
				${message(code: 'default.add.label', args: [message(code: 'variant.label', default: 'Variant')])}
			</g:link></li>
	</ul>


</div>

