<nav class="navbar navbar-expand-lg navbar-custom bg-custom" id="myHeader" style="position: relative;">
    <a class="ml-5" href="/tamere" style="position: absolute; left: 0;">
        <asset:image src="default_weiss.png" title="Logo Band Ta Mère" alt="Logo der Band Ta Mère" width="75"/>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav justify-content-between">
                <div class="nav-item">
                    <a data-url="${g.createLink(controller: 'liveShow', action: 'body')}" class="nav-link clickableHeader">
                            <g:message code="liveShowController.label"/>
                    </a>
                </div>
                <div class="nav-item">
                    <a data-url="${g.createLink(controller: 'band', action: 'body')}" class="nav-link clickableHeader">
                            <g:message code="band.label"/>
                    </a>
                </div>
                <div class="nav-item">
                    <a data-url="${g.createLink(controller: 'music', action: 'body')}" class="nav-link clickableHeader">
                        <g:message code="music.label"/>
                    </a>
                </div>
                <div class="nav-item">
                    <a data-url="${g.createLink(controller: 'video', action: 'body')}" class="nav-link clickableHeader">
                        <g:message code="video.label"/>
                    </a>
                </div>
                <div class="nav-item ${contentTarget == 'shop'?'active':''}">
                    <a data-url="${g.createLink(controller: 'shop', action: 'body')}" class="nav-link clickableHeader">
                        <g:message code="shop.label"/>
                    </a>
                </div>
                <div class="nav-item">
                    <a data-url="${g.createLink(controller: 'contact', action: 'body')}" class="nav-link clickableHeader">
                        <g:message code="contact.label"/>
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>