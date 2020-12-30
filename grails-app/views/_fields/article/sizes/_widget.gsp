<%@ page import="tamere.*" %>

<div id="sizesContainer" class="d-flex">
    <g:each in="${Size.list()}" var="sizeDomain">
        <div class="d-flex">
            <g:checkboxDisplay checked="${false}" id="size-${sizeDomain.id}" name="size-${sizeDomain.id}"/>
            <label>${sizeDomain.size}</label>
        </div>
    </g:each>
</div>