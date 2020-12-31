<g:each in="${value}" var="image">
    <div class="image-display-field" id="image-field-${image?.id}">
        <input type="hidden" name="image-${image?.id}" id="image-${image?.id}"/>
        <g:imageDisplay image="${image}" width="100%"></g:imageDisplay>
        <a class="remove-link" data-remove="#image-field-${image?.id}" data-url="${createLink(controller: 'store', action: 'removeImageFromArticle', params: [imageId: image?.id])}" onclick="deleteImage(this)">Delete</a>
    </div>
</g:each>
<input id="fileInput" class="form-control" type="file" name="image[]" multiple="true" data-url="${createLink(controller: 'store', action: 'addImage')}" data-update="#imagesContainer"/>