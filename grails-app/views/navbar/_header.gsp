<nav class="navbar navbar-expand-lg navbar-custom bg-transparent" id="myHeader">
    <a class="navbar-brand" href="/tamere" style="width: 20vw;">
        <asset:image src="header2TM.svg" id="headerlogo" width="100" class="d-none" alt="Ta Mère Logo"/>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a data-url="${g.createLink(controller: 'liveShow', action: 'body')}" data-target="myTemplate" class="nav-link clickableHeader">
                        <g:message code="liveShowController.label"/>
                </a>
            </li>
            <li class="nav-item">
                <a data-url="${g.createLink(controller: 'band', action: 'body')}" data-target="myTemplate" class="nav-link clickableHeader">
                        <g:message code="band.label"/>
                </a>
            </li>
            <li class="nav-item">
                <a data-url="${g.createLink(controller: 'music', action: 'body')}" data-target="myTemplate" class="nav-link clickableHeader">
                    <g:message code="music.label"/>
                </a>
            </li>
            <li class="nav-item">
                <a data-url="${g.createLink(controller: 'video', action: 'body')}" data-target="myTemplate" class="nav-link clickableHeader">
                    <g:message code="video.label"/>
                </a>
            </li>
            <li class="nav-item">
                <a data-url="${g.createLink(controller: 'contact', action: 'body')}" data-target="myTemplate" class="nav-link clickableHeader">
                    <g:message code="contact.label"/>
                </a>
            </li>
        </ul>
    </div>
</nav>