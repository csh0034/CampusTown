<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="item" items="${mainUserList}">
	<c:out value="${item.USERNAME}"/> / 
	<c:out value="${item.USER_ID}"/> / 
	<c:out value="${item.CREATED}"/><br>
</c:forEach>
