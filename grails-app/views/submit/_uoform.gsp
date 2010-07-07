<table>
    <thead>
        <tr>
            <th colspan="2"><g:message code="openfurry.uo.sectionTitle" default="Submission information" /></th>
        </tr>
    </thead>
    <tbody>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.title" default="Title" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'title', 'errors')}">
                <g:textField name="title" value="${instance?.title}" />
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.description" default="Description" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'description', 'errors')}">
                <g:textArea name="description" rows="10" cols="100" value="${instance?.description}" />
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.externalLink" default="External link" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'externalLink', 'errors')}">
                <g:textField name="externalLink" value="${instance?.externalLink}" />
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.rating" default="Rating" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'rating', 'errors')}">
                <g:each status="i" in="${grailsApplication.config.openfurry.ratings.repr}" var="it">
                    <g:if test="${instance?.rating == i}">
                        <g:radio name="rating" value="${i}" checked="true" /> ${it}<br />
                    </g:if>
                    <g:else>
                        <g:radio name="rating" value="${i}" /> ${it}<br />
                    </g:else>
                </g:each>
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.species" default="Species" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'species', 'errors')}">
                <g:set var="depth" value="${0}" />
                <select name="species" multiple="multiple" size="5">
                    <of:speciesOptions />
                </select><br />
                <span class="message"><g:message code="openfurry.technical.selectMultiple" /></span>
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.categories" default="Categories" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'categories', 'errors')}">
                <g:set var="depth" value="${0}" />
                <select name="categories" multiple="multiple" size="5">
                    <of:categoryOptions />
                </select><br />
                <span class="message"><g:message code="openfurry.technical.selectMultiple" /></span>
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.tags" default="Tags" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'tags', 'errors')}">
                <g:textField name="tags" value="${instance?.tags}" />
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.collection" default="Collection" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'collection', 'errors')}">TODO</td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.license" default="License" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'license', 'errors')}">
                <g:select name="license.id" from="${openfurry.License.list()}" value="${instance?.license.id}", optionKey="id" />
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.published" default="Published"/></th>
            <td class="value ${hasErrors(bean: instance, field: 'published', 'errors')}">
                <g:checkBox name="published" value="${instance?.published}" />
            </td>
        </tr>
        <tr class="prop">
            <th class="name"><g:message code="openfurry.uo.friendsOnly" default="Friends only" /></th>
            <td class="value ${hasErrors(bean: instance, field: 'friendsOnly', 'errors')}">
                <g:checkBox name="friendsOnly" value="${instance?.friendsOnly}" />
            </td>
        </tr>
    </tbody>
</table>