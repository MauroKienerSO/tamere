<div class="custom-jumbo jumbotron jumbotron-fluid">
    <div class="container">
        <h1 class="display-4">Live</h1>
        <hr class="my-4">
        <p>All your live shows</p>
    </div>
</div>

<a data-url="${g.createLink(controller: 'liveShow', action: 'addShow')}"
   id="createDomainInstance"
   onclick="jQuery(createDomain($(this)));">
    <g:message code="liveShow.create.label"/>
</a>