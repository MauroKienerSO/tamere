package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured(Role.ROLE_ADMIN)
class StoreController {

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

    def addImages(){
        log.debug "$actionName -> $params"
    }
}
