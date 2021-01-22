<h1 class="title inside-page-container">
    Contact
</h1>

<g:if test="${messageSent}">
    <div class="inside-page-container subtitle response">
        We have received your message, thank you very much!
    </div>
</g:if>

<g:if test="${errorMessage}">
    <div class="inside-page-container subtitle response">
        ${errorMessage}
    </div>
</g:if>

<div class="inside-page-container">
    <g:formRemote id="contactForm" name="contactForm" url="[controller: 'contact', action: 'sendMessage']" update="page-container" onLoading="showSpinner()" onComplete="hideSpinner()">
        <div class="form-group d-flex">
            <label for="name">Your Name</label>
            <input type="text" class="form-control smaller-width" id="name" name="name" placeholder="Your Name" value="${contact?.name}">
        </div>
        <div class="form-group d-flex">
            <label for="email">Email address</label>
            <input type="email" class="form-control smaller-width" id="email" name="email" placeholder="name@example.com" value="${contact?.email}" required>
        </div>
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control smaller-width" id="title" name="title" value="${contact?.title}">
        </div>
        <div class="form-group">
            <label for="message">Your Message</label>
            <textarea class="form-control" id="message" name="message" rows="3" value="${contact?.message}" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </g:formRemote>
</div>