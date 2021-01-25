<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="liveShow.label"/></title>
</head>
<body>

<h1 class="title inside-page-container">
    <g:message code="liveShow.label"/>
</h1>

<div class="inside-page-container">
    <div class="d-flex mb-5">
        <g:link controller="admin" action="index" class="d-flex align-items-center btn btn-primary">
            <span class="material-icons">
                keyboard_backspace
            </span>
            Admin
        </g:link>
    </div>
    <div class="d-flex justify-content-center align-items-center subtitle">Upcoming</div>
    <g:each in="${futureLiveShows}" var="liveShow" status="index">
        <div class="d-flex flex-column flex-md-row justify-content-center align-items-start liveShowEntry ${index % 2 == 0? 'borderClass':''}">
            <div class="liveShow-date"><g:formatDate date="${liveShow.date}" format="dd.MMMM.yyyy"/></div>
            <div class="liveShow-venue">${liveShow.venue}</div>
            <div class="liveShow-city d-flex justify-content-between">${liveShow.city}
                <div class="d-flex flex-row">
                    <g:link controller="liveShow" action="editShow" params="[id: liveShow.id]" title="edit">
                        <span class="material-icons">
                            create
                        </span>
                    </g:link>
                    <g:link controller="liveShow" action="deleteShow" params="[id: liveShow.id]" title="delete">
                        <span class="material-icons">
                            delete
                        </span>
                    </g:link>
                </div>
            </div>
        </div>
    </g:each>

    <div class="d-flex justify-content-center align-items-center subtitle">Past</div>
    <g:each in="${pastLiveShows}" var="liveShow" status="index">
        <div class="d-flex flex-column flex-md-row justify-content-center align-items-start liveShowEntry ${index % 2 == 0? 'borderClass':''}">
            <div class="liveShow-date"><g:formatDate date="${liveShow.date}" format="dd.MMMM.yyyy"/></div>
            <div class="liveShow-venue">${liveShow.venue}</div>
            <div class="liveShow-city d-flex justify-content-between">${liveShow.city}
                <div class="d-flex flex-row">
                    <g:link controller="liveShow" action="editLiveShow" params="[id: liveShow.id]" title="edit">
                        <span class="material-icons">
                            create
                        </span>
                    </g:link>
                    <g:link controller="liveShow" action="deleteLiveShow" params="[id: liveShow.id]" title="delete">
                        <span class="material-icons">
                            delete
                        </span>
                    </g:link>
                </div></div>
        </div>
    </g:each>
</div>

<div class="inside-page-container">
    <g:link controller="liveShow" action="createLiveShow" class="btn btn-primary">
        <g:message code="liveShow.create.label"/>
    </g:link>
</div>

</body>
</html>