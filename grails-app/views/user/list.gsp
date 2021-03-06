<head>
	<meta name="layout" content="main" />
	<title>Person List</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="create" action="create">New Person</g:link></span>
	</div>

	<div class="body">
		<h1>Person List</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="Id" />
					<g:sortableColumn property="username" title="Login Name" />
					<g:sortableColumn property="userRealName" title="Full Name" />
					<g:sortableColumn property="enabled" title="Enabled" />
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${userList}" status="i" var="user">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${user.id}</td>
					<td>${user.username?.encodeAsHTML()}</td>
					<td>${user.userRealName?.encodeAsHTML()}</td>
					<td>${user.enabled?.encodeAsHTML()}</td>
					<td class="actionButtons">
						<span class="actionButton">
							<g:link action="show" id="${user.id}">Show</g:link>
						</span>
					</td>
				</tr>
			</g:each>
			</tbody>
			</table>
		</div>

		<div class="paginateButtons">
			<g:paginate total="${openart.Person.count()}" />
		</div>

	</div>
</body>
