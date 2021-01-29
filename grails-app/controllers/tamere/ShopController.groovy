package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ShopController {

    def index() {
        log.debug "$actionName -> $params"
        render view: '/home/index', model: [templateLocation: '/shop/shopTemplate', headerActive: 'shop']
    }

    def body() {
        log.debug "$actionName -> $params"
        render template: 'shopTemplate'
    }

    def showArticleAjax() {
        log.debug "$actionName -> $params"

        Article article = Article.findByAlias(params.alias)
        if(!article){
            render template: 'shopTemplate'
            return
        }

        if(params.boolean('ajax')){
            log.debug "ajax is true"
            render template: 'showArticle', model: [article: article]
            return
        }

        render view: '/home/index', model: [templateLocation: '/shop/showArticle', headerActive: 'shop', pushState: createLink(controller: 'shop', action: 'showArticleAjax', params: [alias: article.alias]), article: article]
    }

    def addToCartAjax(){
        log.debug "$actionName -> $params"



    }
}
