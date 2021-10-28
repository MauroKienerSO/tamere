<h1 class="title inside-page-container">
    Contact
</h1>

<div class="inside-page-container">

    <g:if test="${messageSent}">
        <div class="mb-3">
            <div class="subtitle response">
                We have received your message, thank you very much!
            </div>
            <div class="error-message">
                Please check your Spam folder if you didn't receive any confirmation!
            </div>
        </div>
    </g:if>
    <g:if test="${errorMessage}">
        <div class="subtitle response mb-3">
            ${errorMessage}
        </div>
    </g:if>
    <g:formRemote id="contactForm" name="contactForm" url="[controller: 'contact', action: 'sendMessage']" update="page-container" onLoading="showSpinner()" onComplete="hideSpinner()">
        <div class="form-group d-flex align-items-stretch flex-column flex-md-row">
            <label for="name">Your Name</label>
            <input type="text" class="form-control smaller-width" id="name" name="name" placeholder="Your Name" value="${contact?.name}" autocomplete="off">
        </div>
        <div class="form-group d-flex align-items-stretch flex-column flex-md-row">
            <label for="email">Email address</label>
            <input type="email" class="form-control smaller-width" id="email" name="email" placeholder="name@example.com" value="${contact?.email}"  autocomplete="off" required>
        </div>
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control smaller-width" id="title" name="title" value="${contact?.title}"  autocomplete="off">
        </div>
        <div class="form-group">
            <label for="message">Your Message</label>
            <textarea class="form-control" id="message" name="message" rows="3" value="${contact?.message}"  autocomplete="off" required></textarea>
        </div>
        <button class="btn btn-primary g-recaptcha"
                type="submit"
                data-sitekey="6Ldza_wcAAAAALobAKzBPhpl7WfO1aM5mBtsuNxb"
                data-callback='onSubmitCaptcha'
                data-action='submit'>Submit</button>
    </g:formRemote>
</div>

<script>
    hideSpinner();

    function onSubmitCaptcha(token) {
        showSpinner();
        document.getElementById("contactForm").submit();
    }
</script>