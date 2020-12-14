<nav class="navbar navbar-expand-lg navbar-custom bg-custom" id="myHeader">
    <a class="navbar-brand" href="/tamere">
        <asset:image src="header2TM.svg" id="headerlogo" width="100" class="d-none" alt="Ta Mère Logo"/>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav justify-content-between">
                <div class="nav-item ${contentTarget == 'live'? 'active' : ''}">
                    <a href="${controllerName == 'welcome'? '': g.createLink(controller: 'welcome', action: 'live')}" class="nav-link clickableHeader">
                            <g:message code="liveShowController.label"/>
                    </a>
                </div>
                <div class="nav-item ${contentTarget == 'band'? 'active' : ''}">
                    <a href="${controllerName == 'welcome'? '': g.createLink(controller: 'welcome', action: 'band')}" class="nav-link clickableHeader">
                            <g:message code="band.label"/>
                    </a>
                </div>
                <div class="nav-item ${contentTarget == 'music'? 'active' : ''}">
                    <a href="${controllerName == 'welcome'? '': g.createLink(controller: 'welcome', action: 'music')}" class="nav-link clickableHeader">
                        <g:message code="music.label"/>
                    </a>
                </div>
                <div class="nav-item ${contentTarget == 'live'? 'active' : ''}">
                    <a href="${controllerName == 'welcome'? '': g.createLink(controller: 'welcome', action: 'video')}" class="nav-link clickableHeader">
                        <g:message code="video.label"/>
                    </a>
                </div>
                <div class="nav-item ${contentTarget == 'shop'?'active':''}">
                    <g:link controller="shop" action="index" class="nav-link">
                        <g:message code="shop.label"/>
                    </g:link>
                </div>
                <div class="nav-item ${contentTarget == 'contact'? 'active' : ''}">
                    <a href="${controllerName == 'welcome'? '': g.createLink(controller: 'welcome', action: 'contact')}" class="nav-link clickableHeader">
                        <g:message code="contact.label"/>
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>