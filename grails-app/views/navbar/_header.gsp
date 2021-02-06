<nav class="navbar navbar-expand-lg navbar-custom bg-custom" id="myHeader">
    <a href="${g.createLink(controller: 'home', action: 'body')}" data-url="${g.createLink(controller: 'home', action: 'body')}" data-pushstate="home" class="home-image clickableHeader" title="Home">
        tamere
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="material-icons">
            subject
        </span>
    </button>

    <div class="container navbar-container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-nav justify-content-end">
                <div class="nav-item ${headerActive == 'live'?'active':''}">
                    <a href="${g.createLink(controller: 'live', action: 'index')}" data-url="${g.createLink(controller: 'live', action: 'body')}" data-pushstate="live" class="nav-link clickableHeader">
                            <g:message code="liveShowController.label"/>
                    </a>
                </div>
                <div class="nav-item ${headerActive == 'music'?'active':''}">
                    <a href="${g.createLink(controller: 'music', action: 'index')}" data-url="${g.createLink(controller: 'music', action: 'body')}" data-pushstate="music" class="nav-link clickableHeader">
                        <g:message code="music.label"/>
                    </a>
                </div>
                <div class="nav-item ${headerActive == 'video'?'active':''}">
                    <a href="${g.createLink(controller: 'video', action: 'index')}" data-url="${g.createLink(controller: 'video', action: 'body')}" data-pushstate="videos" class="nav-link clickableHeader">
                        <g:message code="video.label"/>
                    </a>
                </div>
                <div class="nav-item ${headerActive == 'shop'?'active':''}">
                    <a href="${g.createLink(controller: 'shop', action: 'index')}" data-url="${g.createLink(controller: 'shop', action: 'body')}" data-pushstate="shop" class="nav-link clickableHeader">
                        <g:message code="shop.label"/>
                    </a>
                </div>
                <div class="nav-item ${headerActive == 'contact'?'active':''}">
                    <a href="${g.createLink(controller: 'contact', action: 'index')}" data-url="${g.createLink(controller: 'contact', action: 'body')}" data-pushstate="contact" class="nav-link clickableHeader">
                        <g:message code="contact.label"/>
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>