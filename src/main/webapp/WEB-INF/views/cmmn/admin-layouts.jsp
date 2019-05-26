<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="en">
<head>
<tiles:insertAttribute name="header" />
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<tiles:insertAttribute name="nav" />
		<tiles:insertAttribute name="left" />
		<tiles:insertAttribute name="content" />
		<div class="clearfix"></div>
		<tiles:insertAttribute name="footer" />
	</div>
	<tiles:insertAttribute name="js" />
</body>

</html>
