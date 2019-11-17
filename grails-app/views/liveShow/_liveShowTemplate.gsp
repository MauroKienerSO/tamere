<div class="container d-flex">
    <h1 class="title">
        Live
    </h1>
</div>

<a data-url="${g.createLink(controller: 'liveShow', action: 'addShow')}"
   id="createDomainInstance"
   onclick="jQuery(createDomain($(this)));">
    <g:message code="liveShow.create.label"/>
</a>