<script type="text/javascript">
var childCount = ${apparelInstance?.variants.size()} + 0;

var childCount = ${sportsInstance?.variants.size()} + 0;

function addChild() {
var htmlId = "variant" + childCount;
var deleteIcon = "${resource(dir:'images/skin', file:'database_delete.png')}";
var templateHtml = "<div id='" + htmlId + "' name='" + htmlId + "'>\n";
templateHtml += "<input type='text' id='expandableVariantList[" + childCount + "].name' name='expandableVariantList[" + childCount + "].name' />\n";
templateHtml += "<span onClick='$(\"#" + htmlId + "\").remove();'><img src='" + deleteIcon + "' /></span>\n"
templateHtml += "</div>\n";
$("#childList").append(templateHtml);
childCount++;
}

</script>
<div id="childList">
	<g:each var="variant"
		in="${apparelInstance.variants}" status="i">
		<g:render template='variant'
			model="['variant':variant,'i':i]" />
	</g:each>
</div>
<div id="childList">
	<g:each var="variant"
		in="${sportsInstance.variants}" status="j">
		<g:render template='variant'
			model="['variant':variant,'j':j]" />
	</g:each>
</div>

<input type="button" value="Add Variant Feature" onclick="addChild();" />