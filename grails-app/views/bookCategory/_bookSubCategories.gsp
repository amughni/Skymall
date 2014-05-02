<script type="text/javascript">
var childCount = ${bookCategoryInstance?.bookSubCategories.size()} + 0;

function addChild() {
var htmlId = "bookSubCategory" + childCount;
var deleteIcon = "${resource(dir:'images/skin', file:'database_delete.png')}";
var templateHtml = "<div id='" + htmlId + "' name='" + htmlId + "'>\n";
templateHtml += "<input type='text' id='expandableBookSubCategoryList[" + childCount + "].name' name='expandableBookSubCategoryList[" + childCount + "].name' />\n";
templateHtml += "<span onClick='$(\"#" + htmlId + "\").remove();'><img src='" + deleteIcon + "' /></span>\n"
templateHtml += "</div>\n";
$("#childList").append(templateHtml);
childCount++;
}
</script>
<div id="childList">
	<g:each var="bookSubCategory"
		in="${bookCategoryInstance.bookSubCategories}" status="i">
		<g:render template='bookSubCategory'
			model="['bookSubCategory':bookSubCategory,'i':i]" />
	</g:each>
</div>
<input type="button" value="Add SubCategory" onclick="addChild();" />