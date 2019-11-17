<div class="container d-flex">
<h1 class="title"><g:message code="liveShow.create.label"/></h1>
<g:if test="${flash.message}">
<div class="message" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${this.liveShow}">
<ul class="errors" role="alert">
    <g:eachError bean="${this.liveShow}" var="error">
    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
    </g:eachError>
</ul>
</g:hasErrors>
<g:form resource="${this.liveShow}" method="POST">
    <fieldset class="form">
        <f:all bean="liveShow"/>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </fieldset>
</g:form>
</div>
