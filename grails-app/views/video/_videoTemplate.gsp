<h1 class="title inside-page-container">
    Videos
</h1>

<div class="inside-page-container">

    <div class="d-flex flex-column justify-content-start align-items-start mb-4">
        <div class="subtitle">Videos</div>
        <div class="video-subinfo">For the latest videos subscribe to our Youtube channel</div>
    </div>


    <g:each in="${videos}" var="video" status="index">
        <div class="d-flex flex-column flex-md-row pt-3 pb-3">
            <div class="video-container">
                <iframe width="100%" class="box-shadow-light" src="https://www.youtube.com/embed/${video.youtubeVideoCode}"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen>
                </iframe>
            </div>
            <div class="ml-0 ml-md-5 mt-3 mb-3 video-description">
                <h6 class="video-title">${video.title}</h6>
                <p class="font-italic">${video.description}</p>
            </div>
        </div>
    </g:each>
</div>