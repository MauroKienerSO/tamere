<%@ page import="tamere.*" %>

<div class="custom-jumbo jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4" id="titleID">Live</h1>
    </div>
</div>

<div class="container">

    <g:set var="liveShows" value="${tamere.LiveShow.list()}"/>
    <g:set var="liveShowCounter" value="${tamere.LiveShow.count}"/>
    <g:if test="${liveShows}">
        <div class="container container-table">
        <table class="table-custom bg-table" id="liveShowTable">
            <tbody class="container-table-head">
            <g:each var="show" in="${liveShows}">
                <tr class="table-row-custom">
                    <td class="date"><g:formatDate date="${show.date}" format="dd.MM.yyyy"/> </td>
                    <td class="venue">${show.venue}</td>
                    <td class="city">${show.city}</td>
                    <td class="tickets"><button class="btn btn-custom">Tickets</button></td>
                </tr>
                <tr class="table-row-custom d-none" id="inputRow-${liveShowCounter}">
                    <td class="date">Date </td>
                    <td class="venue">Venue</td>
                    <td class="city">City</td>
                    <td class="tickets"><button class="btn btn-custom">Tickets</button></td>
                </tr>
            </g:each>
            </tbody>
        </table>
        </div>
    </g:if>
    <div class="container container-button">
            <button data-url="${g.createLink(controller: 'liveShow', action: 'addShow')}"
               id="addTableRow"
               onclick="jQuery(addRow($(this)));" class="btn btn-custom btn-create" data-counter="${liveShowCounter}" data-target="#inputRow-${liveShowCounter}">
                <g:message code="liveShow.create.label"/>
            </button>
    </div>

</div>