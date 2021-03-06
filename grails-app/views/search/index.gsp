<html>
    <head>
        <title><g:message code="openart.search" default="Search" /></title>
        <meta name="layout" content="main" />
        <script type="text/javascript">
            $(function() {
                $('#accordion').accordion({
                    autoHeight: false
                });
            });
        </script>
    </head>
    <body>
        <div id="accordion">
            <h3><a href="#"><g:message code="openart.search.submissions" default="Submissions" /></a></h3>
            <div>
                <g:form action="submissions" method="get">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.term" default="Search term" /></th>
                                <td class="value"><g:textField name="q" /></td>
                            </tr>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.options" default="Options" /></th>
                                <td class="value">
                                    <p><input type="checkbox" name="includeTags" /> <g:message code="openart.search.submissions.tags" default="Search tags" /></p>
                                    <p><input type="checkbox" name="includeCategories" /> <g:message code="openart.search.submissions.categories" default="Search categories" /></p>
                                    <p><input type="checkbox" name="includeSpecies" /> <g:message code="openart.search.submissions.species" default="Search species" /></p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="buttons"><input type="submit" /></div>
                </g:form>
            </div>

            <h3><a href="#"><g:message code="openart.search.users" default="Users" /></a></h3>
            <div>
                <g:form action="users" method="get">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.users" default="Users" /></th>
                                <td class="value"><g:textField name="q" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="buttons"><input type="submit" /></div>
                </g:form>
            </div>

            <h3><a href="#"><g:message code="openart.search.issues" default="Issues" /></a></h3>
            <div>
                <g:form action="issues" method="get">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.term" default="Search term" /></th>
                                <td class="value"><g:textField name="q" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="buttons"><input type="submit" /></div>
                </g:form>
            </div>

            <h3><a href="#"><g:message code="openart.search.groups" default="Groups" /></a></h3>
            <div>
                <g:form action="groups" method="get">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.term" default="Search term" /></th>
                                <td class="value"><g:textField name="q" /></td>
                            </tr>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.options" default="Options" /></th>
                                <td class="value">
                                    <p><input type="checkbox" name="includePrivate" /> <g:message code="openart.search.groups.private" default="Include private groups" /></p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="buttons"><input type="submit" /></div>
                </g:form>
            </div>

            <h3><a href="#"><g:message code="openart.search.threads" default="Group threads" /></a></h3>
            <div>
                <g:form action="posts" method="get">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.term" default="Search term" /></th>
                                <td class="value"><g:textField name="q" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="buttons"><input type="submit" /></div>
                </g:form>
            </div>
            
            <h3><a href="#"><g:message code="openart.search.events" default="Group events" /></a></h3>
            <div>
                <g:form action="events" method="get">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.term" default="Search term" /></th>
                                <td class="value"><g:textField name="q" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="buttons"><input type="submit" /></div>
                </g:form>
            </div>
            
            <h3><a href="#"><g:message code="openart.search.pages" default="Site pages" /></a></h3>
            <div>
                <g:form action="Pages" method="get">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <th class="name"><g:message code="openart.search.term" default="Search term" /></th>
                                <td class="value"><g:textField name="q" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="buttons"><input type="submit" /></div>
                </g:form>
            </div>
        </div>
    </body>
</html>
