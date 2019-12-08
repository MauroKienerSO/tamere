<div id="newShow">
    <g:formRemote name="addLiveShow" onSuccess="addLiveShowToRow(data)" url="[controller: 'liveShow', action: 'save']">
        <div class="form-group row">
            <div class="col-lg-6 col-md-12">
                <input class="form-control custom-date" id="date" name="date" autocomplete="off" placeholder="Select Date" type="text" required/>
            </div>
            <div class="col-lg-6 col-md-12">
                <input type="text" name="venue" placeholder="Venue" class="form-control" required/>
            </div>
            <div class="col-lg-6 col-md-12">
                <input type="text" name="city" placeholder="City" class="form-control" required/>
            </div>
            <div class="col-lg-6 col-md-12">
                <input type="text" name="tickets" placeholder="Ticket-Url" class="form-control"/>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <button type="submit" class="btn btn-custom float-right">Save</button>
            </div>
        </div>
    </g:formRemote>
</div>

<script type="text/javascript">
    initDatePicker();

    function addLiveShowToRow(data){
        $('#newShow').remove();
        $(data).hide().appendTo('#liveShowContainer').fadeIn(1000);
    }
</script>