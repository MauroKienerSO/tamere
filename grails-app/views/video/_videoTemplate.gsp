<h1 class="title inside-page-container">
    Videos
</h1>

<div class="inside-page-container">
    <div class="d-flex align-items-center justify-content-center mb-5">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/${videos.first().youtubeVideoCode}"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
        </iframe>
    </div>

    <div class="d-flex align-items-center justify-content-center page-info">
        Follow us on Youtube
    </div>

    <div class="d-flex mt-5 justify-content-between">
        <g:each in="${videos.subList(1, videos.size())}" var="video">
            <iframe width="280" src="https://www.youtube.com/embed/${video.youtubeVideoCode}"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen>
            </iframe>
        </g:each>
    </div>
</div>