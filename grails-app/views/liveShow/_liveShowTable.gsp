<g:set var="liveShows" value="${tamere.LiveShow.list()}"/>
<g:set var="liveShowCounter" value="${tamere.LiveShow.count}"/>
<g:if test="${liveShows}">
    <div class="container container-table">
        <table class="table-custom bg-table" id="liveShowTable">
            <tbody class="container-table-head">
            <g:each var="show" in="${liveShows}">
                <tr class="table-row-custom">
                    <td class="date"><g:formatDate date="${show.date}" format="dd.MM.yyyy"/> </td>
                    <td class="venue">${show.venue}</td>
                    <td class="city">${show.city}</td>
                    <td class="tickets"><button class="btn btn-custom">Tickets</button></td>
                </tr>
                <tr class="table-row-custom" id="inputRow-${liveShowCounter}">
                        <td>
                            <input class="custom-liveShow-input custom-date" id="date" name="date" placeholder="Select Date" type="text" required/>
                        </td>
                        <td>
                            <input type="text" name="venue" placeholder="Venue" class="custom-liveShow-input" required/>
                        </td>
                        <td>
                            <input type="text" name="city" placeholder="City" class="custom-liveShow-input" required/>
                        </td>
                        <td>
                            <input type="text" name="tickets" placeholder="Ticket-Url" class="custom-liveShow-input"/>
                        </td>
                        <td class="tickets">
                            <button class="btn btn-custom btn-save" name="Save"
                                            id="submit" onclick="jQuery(addLiveShow(this))"
                                            data-url="${createLink(controller: 'liveShow', action: 'createShow')}"
                                            data-target="#inputRow-${liveShowCounter}" type="submit">Save
                            </button>
                        </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</g:if>
<div class="container container-button">
    <button data-url="${g.createLink(controller: 'liveShow', action: 'addShow')}"
            id="addTableRow"
            onclick="jQuery(addRow($(this)));" class="btn btn-custom btn-create" data-counter="${liveShowCounter}">
        <g:message code="liveShow.create.label"/>
    </button>
</div>
<script type="text/javascript">
    initDatePicker();
</script>