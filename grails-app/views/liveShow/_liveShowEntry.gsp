<div id="show_${show.id}">
    <div class="row mb-3">
        <div class="col"><div class="float-right"><g:formatDate date="${show.date}" format="dd.MM.yyyy"/></div> </div>
        <div class="col">${show.venue}</div>
        <div class="col"><div class="float-right">${show.city}</div></div>
        <div class="col">
            <g:if test="${show.tickets}">
                <a href="${show.tickets}" target="_blank" class="btn btn-custom">Tickets</a>
            </g:if>
            <g:else>
                No tickets available
            </g:else>
        </div>
        <sec:ifLoggedIn>
            <div class="col">
                <button class="btn btn-danger deleteShow" data-url="${createLink(controller: 'liveShow', action: 'delete', params: [id: show.id])}" data-target="#show_${show.id}" type="submit">Delete</button>
            </div>
        </sec:ifLoggedIn>
    </div>

    <g:if test="${flash.message}">
        <div class="alert alert-info">
            ${flash.message}
        </div>
    </g:if>
</div>