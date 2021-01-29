<g:form id="articleForm" name="articleForm" url="[controller: 'store', action: 'saveArticle']" method="post">
    <f:all bean="article" except="alias"/>
    <button type="submit" class="btn btn-primary">Submit</button>
</g:form>