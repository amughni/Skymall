<%@ page import="skymall.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField type="text" name="userName" required="" value="${userInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField type="password" name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userRole', 'error')} ">
	<label for="userRole">
		<g:message code="user.userRole.label" default="User Role" />
		
	</label>
<%--	<g:textField name="userRole" value="${userInstance?.userRole}"/>--%>
<g:select name="userRole" from="${skymall.UserRole.getuserRole()}"
		value="${userInstance?.userRole}"
		noSelection="['':'-Choose a user role']"></g:select>


</div>

