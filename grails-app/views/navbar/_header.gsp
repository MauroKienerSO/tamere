<nav class="navbar navbar-expand-sm navbar-custom bg-custom" id="myHeader">
    <a class="navbar-brand" href="/tamere" style="width: 20vw;">
        <asset:image src="Logo2.jpg" id="headerlogo" width="100" class="d-inline-block align-top" alt="Ta Mère Logo"/>
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
%{--        <form class="form-inline my-2 my-lg-0">--}%
%{--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--}%
%{--            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--}%
%{--        </form>--}%
    </div>
</nav>