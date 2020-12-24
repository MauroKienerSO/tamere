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

    def saveArticle(){
        log.debug "$actionName -> $params"
    }
}
