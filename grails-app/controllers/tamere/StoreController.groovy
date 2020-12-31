package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured(Role.ROLE_ADMIN)
class StoreController {

    def fileService

    static allowedMethods = [saveArticle: ['PUT', 'POST']]

    def index() {
        log.debug "$actionName -> $params"
    }

    def createArticle(){
        log.debug "$actionName -> $params"
        [article: new Article()]
    }

    def saveArticle(Article article){
        log.debug "$actionName -> $params"

        if(!article){
            log.error "No Article Provided Article"
            redirect action: 'index'
            return
        }

        // set download and active boolen values
        article.download = params.boolean('download')?:false
        article.active = params.boolean('active')?:false

        // Add article to the sizes
        List<Integer> sizesToAdd = params.collect { key, value ->
            if(key.startsWith('size-')){
                return Integer.parseInt(key.split('-')[1])
            }
        }.findAll()

        List<Size> sizes = Size.findAllByIdInList(sizesToAdd)
        sizes.each { sizeDomain ->
            article.addToSizes(sizeDomain)
        }

        // Add article to the images
        List<Integer> imagesToAdd = params.collect { key, value ->
            if(key.startsWith('image-')){
                return Integer.parseInt(key.split('-')[1])
            }
        }.findAll()

        List<Image> images = Image.findAllByIdInList(imagesToAdd)
        images.each { imageDomain ->
            article.addToImages(imageDomain)
        }

        if(!article.save(flush: true)){
            log.error "Couldn't store Article"
            redirect action: 'index'
            return
        }

        redirect action: 'index'
    }

    def editArticle(){
        log.debug "$actionName -> $params"
        Article article = Article.get(params.long('id'))
        [article: article]
    }

    /**
     * updates an article
     */
    def updateArticle(){
        log.debug "$actionName -> $params"

        Article article = Article.get(params.long('id'))

        if(!article){
            log.error "Couldn't find Article"
            redirect action: 'index'
            return
        }

        // set download and active boolen values
        article.download = params.boolean('download')?:false
        article.active = params.boolean('active')?:false
        article.title = params.title
        article.description = params.description

        List<Integer> sizesToAdd = params.collect { key, value ->
            if(key.startsWith('size-')){
                return Integer.parseInt(key.split('-')[1])
            }
        }.findAll()

        List<Size> sizes = Size.findAllByIdInList(sizesToAdd)
        sizes.each { sizeDomain ->
            article.addToSizes(sizeDomain)
        }

        // Add article to the images
        List<Integer> imagesToAdd = params.collect { key, value ->
            if(key.startsWith('image-')){
                return Integer.parseInt(key.split('-')[1])
            }
        }.findAll()

        List<Image> images = Image.findAllByIdInList(imagesToAdd)
        images.each { imageDomain ->
            article.addToImages(imageDomain)
        }

        if(!article.save(flush: true)){
            log.error "Couldn't store Article"
            redirect action: 'index'
            return
        }

        redirect action: 'index'
    }

    /**
     * saves an image on the database and inside the filename
     */
    def addImage(){
        log.debug "$actionName -> $params"

        List<Image> images = []

        params.file.each { file ->
            Image image = new Image()

            // Save the image on the file System
            Map result = fileService.saveImage(file, image)
            image = result['image']
            images.push(image)
        }

        render template: '/article/articleImages', model: [value: images]
    }

    /**
     * deletes an article
     */
    def deleteArticle(){
        log.debug "$actionName -> $params"
        Article article = Article.get(params.long('id'))

        article.sizes.removeAll()

        List<Image> imagesToDelete = article.images.toList()
        article.images.removeAll()

        article.delete(flush: true)

        imagesToDelete.each { image ->
            fileService.deleteImage(image.fileName)
        }

        Image.deleteAll(imagesToDelete)

        redirect action: 'index'
    }

    /**
     * deletes an image with ajax method from create/edit view of article
     */
    def removeImageFromArticle(){
        log.debug "$actionName -> $params"

        Image image = Image.get(params.long('imageId'))
        String fileName = image.fileName

        try {
            image.delete(flush: true)
        } catch(Exception e) {
            log.error "Exception occurred: ${e.message}"
            List<Article> articles = Article.list().findAll { article ->
                if(article.images.find {it.fileName == fileName}){
                    return article
                }
            }
            articles.each { article ->
                article.removeFromImages(image)
            }
        }

        try {
            image.delete(flush: true)
        } catch(Exception e) {
            log.error "Couldn't Delete Image"
            log.error "Exception occurred: ${e.message}"
            response.status = 500
            render 'not ok'
            return
        }

        fileService.deleteImage(image.fileName)

        response.status = 200
        render 'ok'
    }
}
