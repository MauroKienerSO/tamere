<%@ page import="tamere.*" %>

<h1 class="title inside-page-container">
    Live
</h1>

<div class="inside-page-container">
    <div class="d-flex justify-content-center align-items-center subtitle">Upcoming</div>
    <g:each in="${futureLiveShows}" var="liveShow" status="index">
        <div class="d-flex flex-column flex-md-row justify-content-center align-items-start liveShowEntry ${index % 2 == 0? 'borderClass':''}">
            <div class="liveShow-date"><g:formatDate date="${liveShow.date}" format="dd.MMMM.yyyy"/></div>
            <div class="liveShow-venue">${liveShow.venue}</div>
            <div class="liveShow-city">${liveShow.city}</div>
        </div>
    </g:each>

    <div class="d-flex justify-content-center align-items-center subtitle">Past</div>
    <g:each in="${pastLiveShows}" var="liveShow" status="index">
        <div class="d-flex flex-column flex-md-row justify-content-center align-items-start liveShowEntry ${index % 2 == 0? 'borderClass':''}">
            <div class="liveShow-date"><g:formatDate date="${liveShow.date}" format="dd.MMMM.yyyy"/></div>
            <div class="liveShow-venue">${liveShow.venue}</div>
            <div class="liveShow-city">${liveShow.city}</div>
        </div>
    </g:each>
</div>
