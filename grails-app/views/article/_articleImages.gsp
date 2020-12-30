<div>
    <h2>Add an Image</h2>
</div>

<g:form url="[controller: 'store', action:'addImage']" name="addImageToArticle" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${article.id}">
    <input type="text" name="title" placeholder="title">
    <input type="text" name="alt"  placeholder="alt">
    <input type="file" name="image[]" multiple="true"/>
    <button type="submit" class="btn btn-primary">Submit</button>
</g:form>

<div id="imageList">
    <g:render template="/article/allImages" model="[article: article]"/>
</div>