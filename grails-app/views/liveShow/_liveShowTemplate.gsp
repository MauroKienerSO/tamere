<%@ page import="tamere.*" %>

<h1 class="title">
    Live
</h1>

<g:set var="liveShows" value="${tamere.LiveShow.list()}"/>

<div class="container" id="liveShowContainer" style="color:white;">
    <g:each var="show" in="${liveShows}" status="i">
        <g:render template="/liveShow/liveShowEntry" model="[show: show, i: i]"/>
    </g:each>
</div>
%{--New Live Show come into this container--}%
<div class="container" id="newLiveShows"></div>

<div class="container">
    <div class="row">
        <div class="col">
            <button class="float-right btn btn-custom btn-create addLiveShow" data-url="${createLink(controller: 'liveShow', action: 'create')}" data-target="#newLiveShows">
                Add Live Show
            </button>
        </div>
    </div>
</div>