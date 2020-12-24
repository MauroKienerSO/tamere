<div class="form-group d-flex ${invalid ? 'has-error' : ''}">
    <label for="${property}">${label} ${required ? '*' : ''}</label>

    <f:widget property="${property}"/>
</div>
<g:if test="${errors}">
    <g:each in="${errors}" var="error">
        <span class="help-block"><g:message error="${error}"/></span>
    </g:each>
</g:if>