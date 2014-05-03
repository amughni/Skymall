<script type="text/javascript">
var childCount = ${bookInstance?.variants.size()} + 0;

function addChild() {
var htmlId = "variant" + childCount;
var deleteIcon = "${resource(dir:'images/skin', file:'database_delete.png')}";
var templateHtml = "<div id='" + htmlId + "' name='" + htmlId + "'>\n";
templateHtml += "<input type='text' id='variants[" + childCount + "].name' name='variants[" + childCount + "].name'  />\n";
templateHtml += "<input type='text' id='variants[" + childCount + "].value' name='variants[" + childCount + "].value'  />\n";
templateHtml += "<span onClick='$(\"#" + htmlId + "\").remove();'><img src='" + deleteIcon + "' /></span>\n"
templateHtml += "</div>\n";
$("#childList").append(templateHtml);
childCount++;
}

</script>

<input type="button" value="Add Book Details" onclick="addChild();" />
<div id="childList">
	<g:each var="variant" in="${bookInstance.variants}" status="i">
		<g:render template='variant' model="['variant':variant,'i':i]" />
	</g:each>
</div>