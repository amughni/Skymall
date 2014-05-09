<script type="text/javascript">
var childCount = ${shoeInstance?.variants.size()} + 0;

function addChild() {
	var htmlId = "variant" + childCount;
	var deleteIcon = "${resource(dir:'images/skin', file:'database_delete.png')}";
	var templateHtml = "<div id='" + htmlId + "' name='" + htmlId + "'>\n";
	templateHtml += "<div id='fieldcontain'>\n";
	templateHtml += "<label for='variants[" + childCount +"].name'> Details </label>\n";
	templateHtml += "<input type='text' id='variants[" + childCount + "].name' name='variants[" + childCount + "].name'  />\n";
	templateHtml += "<label for='variants[" + childCount +"].value'>Description</label>\n";
	templateHtml += "<input type='text' name='variants[" + childCount +"].value' id='variants[" + childCount +"].value'/>\n";
	templateHtml += "<span onClick='$(\"#" + htmlId + "\").remove();'><img src='" + deleteIcon + "' /></span>\n"
	templateHtml += "</div>\n";
	templateHtml += "</div>\n";
	$("#childList").append(templateHtml);
	childCount++;
	}

</script>

<span onclick="addChild();"> Add Feature &nbsp;<img
	src="${resource(dir:'images/skin', file:'database_add.png')}" />
</span>

<div class="fieldcontain">
	<div id="childList">
		<g:each var="variant" in="${shoeInstance.variants}" status="i">
			<g:render template='variant' model="['variant':variant,'i':i]" />
		</g:each>
	</div>
</div>