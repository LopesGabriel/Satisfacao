<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!-- JQuery -->
<script src="./vendor/jquery/jquery-3.3.1.js"></script>
<!-- Plugins -->
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="./vendor/chartJs/Chart.js"></script>
<script src="./vendor/bootbox/bootbox.js"></script>
<script src="./vendor/bootbox/bootbox.locales.js"></script>

<!-- Menu Toggle Script -->
<script>
	$("#menu-toggle").click(function(e) {
    		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
</script>