package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def storeService

    def index() {
        log.debug "$actionName -> $params"
        Integer amountOfItemsInShoppingCart = storeService.getNumberOfItemsInShoppingCart(session)
        [templateLocation: '/home/startPage', headerActive: 'home', amountOfItemsInShoppingCart: amountOfItemsInShoppingCart]
    }

    def body() {
        log.debug "$actionName -> $params"
        render template: '/home/startPage'
    }
}
