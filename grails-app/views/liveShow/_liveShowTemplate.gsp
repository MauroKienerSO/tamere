<%@ page import="tamere.*" %>

<div class="custom-jumbo jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4" id="titleID">Live</h1>
    </div>
</div>

<g:set var="liveShows" value="${tamere.LiveShow.list()}"/>
<g:if test="${liveShows}">

    <div class="container">

    <table class="table-custom bg-table">
        <thead class="container-table-head">
        <tr class="table-row-custom">
            <th class="date"><g:message code="liveShow.date.label"/></th>
            <th class="venue"><g:message code="liveShow.venue.label"/></th>
            <th class="city"><g:message code="liveShow.city.label"/></th>
            <th class="tickets"><g:message code="liveShow.tickets.label"/></th>
        </tr>
        </thead>
        <thead class="container-table-head">
        <g:each var="show" in="${liveShows}">
            <tr class="table-row-custom">
                <th class="date"><g:formatDate date="${show.date}" format="dd.MM.yyyy"/> </th>
                <th class="venue">${show.venue}</th>
                <th class="city">${show.city}</th>
                <th class="tickets"><button class="btn btn-custom">Tickets</button></th>
            </tr>
        </g:each>
        </thead>
    </table>
    </div>

</g:if>

<a data-url="${g.createLink(controller: 'liveShow', action: 'addShow')}"
   id="createDomainInstance"
   onclick="jQuery(createDomain($(this)));">
    <g:message code="liveShow.create.label"/>
</a>