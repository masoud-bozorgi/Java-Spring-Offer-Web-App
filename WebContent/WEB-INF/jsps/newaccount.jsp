<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/jquery.js"></script>

<script type="text/javascript">
	function onLoad(){
		
		$("#password").keyup(checkPasswordMatch);
		$("#confirmpass").keyup(checkPasswordMatch);
		
		$("#details").submit(canSubmit);
	}
	
	function canSubmit() {
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();
		
		if(password != confirmpass) {
			alert("<fmt:message key='UnmatchedPasswords.user.password' />")
			return false;
		}
		else {
			return true;
		}
	}
	
	
	function checkPasswordMatch(){
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();
		
		if (password.length > 3 || confirmpass.length > 3) {

			if (password == confirmpass) {
				$("#matchpass").text("<fmt:message key='MatchedPasswords.user.password' />");
				$("#matchpass").addClass("valid");
				$("#matchpass").removeClass("error");
			} else {
				$("#matchpass").text("<fmt:message key='UnmatchedPasswords.user.password' />");
				$("#matchpass").addClass("error");
				$("#matchpass").removeClass("valid");
			}
		}
		
	}
	
	$(document).ready(onLoad);	

</script>



<title>Create new Account</title>
</head>
<body>

	<h2>Create New Account</h2>
	<sf:form id="details" method="post" action="${pageContext.request.contextPath}/createaccount" commandName="user">
		<table class="formtable">
			<tr>
				<td class="label">Username:</td>
				<td>
					<div class="error">
						<sf:input class="control" path="username" name="username" type="text" /><br/>
						<sf:errors path="username"></sf:errors>
					</div>
				</td>
			</tr>
			<tr>
				<td class="label">Email:</td>
				<td>
					<div class="error">
						<sf:input class="control" path="email" name="email" type="text" /><br/>
						<sf:errors path="email" cssClass="error"></sf:errors>
					</div>
				</td>
			</tr>
			<tr>
				<td class="label">Password:</td>
				<td>
					<div class="error">
						<sf:input id="password" class="control" path="password" name="password" type="password" /><br/>
						<sf:errors path="password" cssClass="error"></sf:errors>
					</div>
				</td>
			</tr>
			<tr>
				<td class="label">Confirm Password:</td>
				<td><input id="confirmpass" class="control" name="confirmpassword" type="password" /><div id="matchpass" ></div></td><br/>
			</tr>



			<tr>
				<td class="label"></td>
				<td><input class="control" value="Create account" type="submit" /></td>
			</tr>
		</table>
	</sf:form>


</body>
</html>