<%@ page import="tamere.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="default.contactMessages.label"/></title>
</head>
<body>

    <h1 class="title inside-page-container">
        <g:message code="default.contactMessages.label"/>
    </h1>

    <div class="inside-page-container">
        <div class="d-flex mb-5">
            <g:link controller="admin" action="index" class="d-flex align-items-center btn btn-primary">
                <span class="material-icons">
                    keyboard_backspace
                </span>
                Admin
            </g:link>
        </div>

        <div class="d-flex flex-column contact-list-container">
            <g:each in="${Contact.list(sort: 'date', order: 'desc')}" var="contact">
                <div class="d-flex flex-row contact-entry pb-2 mt-2">
                    <div class="d-flex flex-column mr-3 w-30">
                        <div><g:formatDate date="${contact.date}" format="dd.MM.yyyy"/></div>
                        <div class="font-weight-bold">${contact.name}</div>
                        <div>${contact.email}</div>
                    </div>
                    <div class="d-flex flex-column flex-grow-1">
                        <div class="font-weight-bold mb-1">${contact.title}</div>
                        <div class="flex-grow-1">${contact.message}</div>
                    </div>
                    <div>
                        <g:if test="${!contact.responded}">
                            <g:link class="btn btn-primary mt-1 mb-1" controller="contact" action="respondToMessage" params="[id: contact.id]">
                                Responded?
                            </g:link>
                        </g:if>
                        <g:else>
                            <div class="color-primary">Responded :)</div>
                        </g:else>
                    </div>
                </div>

            </g:each>
        </div>
    </div>

</body>
</html>