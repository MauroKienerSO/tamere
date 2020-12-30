package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured(Role.ROLE_ADMIN)
class StoreController {

    def fileService

    def index() {
        log.debug "$actionName -> $params"
    }

    def createArticle(){
        log.debug "$actionName -> $params"
        [article: new Article()]
    }

    def saveArticle(Article article){
        log.debug "$actionName -> $params"

        // set download and active boolen values
        article.download = params.boolean('download')?:false
        article.active = params.boolean('active')?:false

        List<Integer> sizesToAdd = params.collect { key, value ->
            if(key.startsWith('size-')){
                return Integer.parseInt(key.split('-')[1])
            }
        }.findAll()

        List<Size> sizes = Size.findAllByIdInList(sizesToAdd)
        sizes.each { sizeDomain ->
            article.addToSizes(sizeDomain)
        }

        if(!article.save(flush: true)){
            log.error "Couldn't store Article"
            return
        }

        render template: '/article/articleImages', model: [article: article]
    }

    @Secured(Role.ROLE_ADMIN)
    def addImage(){
        log.debug "$actionName -> $params"

        Article article = Article.get(params.long('id'))

        request.getFiles("image[]").each { file ->
            Image image = new Image(title: params.title, alt: params.alt)

            // Save the image on the file System
            Map result = fileService.saveImage(file, image)
            image = result['image']
            article.addToImages(image)
        }

        article.save(flush: true)

        [article: article]
    }
}
