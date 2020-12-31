<%@ page import="tamere.*" %>

<div id="sizesContainer" class="d-flex">
    <g:set var="idValues" value="${value*.id}"/>
    <g:each in="${Size.list()}" var="sizeDomain">
        <div class="d-flex">
            <g:set var="checked" value="${idValues?idValues.contains(sizeDomain.id):false}"/>
            <g:checkboxDisplay checked="${checked}" id="size-${sizeDomain.id}" name="size-${sizeDomain.id}"/>
            <label>${sizeDomain.size}</label>
        </div>
    </g:each>
</div>