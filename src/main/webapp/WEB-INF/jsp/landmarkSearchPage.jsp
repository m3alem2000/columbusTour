<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>		
<c:url value="/js" var="jsHref" />
<script src="${jsHref}/blacklist.js"></script>

<div class="container-fluid">
	<div class="col-sm-8 text-left">
        <input id="reviewInput" type="text" value="write a review">
		<button onclick="blackListWord()">submit review</button>
	</div>
</div>
