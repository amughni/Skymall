<script type="text/javascript">
var childCount = ${automobileInstance?.variants.size()} + 0;

function addChild() {
	var htmlId = "variant" + childCount;
	var deleteIcon = "${resource(dir:'images/skin', file:'database_delete.png')}";
	var templateHtml = "<div id='" + htmlId + "' name='" + htmlId + "'>\n";
	templateHtml += "<label for='variants[" + childCount +"].name'> Automobile Feature </label>\n";
	templateHtml += "<input type='text' id='variants[" + childCount + "].name' name='variants[" + childCount + "].name'  />\n";
	templateHtml += "<label for='variants[" + childCount +"].value'>Description</label>\n";
	templateHtml += "<input type='text' name='variants[" + childCount +"].value' id='variants[" + childCount +"].value'/>\n";
	templateHtml += "<span onClick='$(\"#" + htmlId + "\").remove();'><img src='" + deleteIcon + "' /></span>\n"
	templateHtml += "</div>\n";
	$("#childList").append(templateHtml);
	childCount++;
	}
</script>

<span onclick="addChild();" id="addButton"> Add Custom Feature &nbsp;<img
	src="${resource(dir:'images/skin', file:'database_add.png')}" />
</span>

<div class="fieldcontain">
	<div id="childList">
		<g:each var="variant" in="${automobileInstance.variants}" status="i">
			<g:render template='variant' model="['variant':variant,'i':i]" />
		</g:each>
	</div>
</div>