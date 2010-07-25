<html><!-- TODO i18n -->
    <head>
        <title><g:if test="${group.exclusive}">PRIVATE GROUP</g:if><g:else>GROUP</g:else> - ${group.title}</title>
        <meta name="layout" content="main" />
    </head>
    <body>
        ${group.description}
        <div class="groupEvents">
            <g:each in="${group.events}">
                ${it.title} - <g:formatDate date="${it.eventDateStart}" />
            </g:each>
        </div>
        <div class="groupPosts">
            <g:each in="${group.posts}" var="post">
                <of:linking noImages="true">${post.title} - ${post.owner}</of:linking>
            </g:each>
        </div>
    </body>
</html>
