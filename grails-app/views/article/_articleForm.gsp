<g:formRemote id="articleForm" name="articleForm" url="[controller: 'store', action: 'saveArticle']" update="createArticleContainer" method="post">
    <f:all bean="article" except="images"/>
    <button type="submit" class="btn btn-primary">Submit</button>
</g:formRemote>