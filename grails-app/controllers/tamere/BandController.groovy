package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class BandController {

    def storeService

    def index() {
        log.debug "$actionName -> $params"

        Integer amountOfItemsInShoppingCart = storeService.getNumberOfItemsInShoppingCart(session)

        render view: '/home/index', model: [templateLocation: '/band/bandTemplate',  headerActive: 'band', amountOfItemsInShoppingCart: amountOfItemsInShoppingCart]
    }

    def body() {
        log.debug "$actionName -> $params"
        render template: 'bandTemplate'
    }
}
