<form id="articleForm" name="articleForm" action="${createLink(controller: 'store', action: 'saveArticle')}" method="post">
    <f:all bean="article"/>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>