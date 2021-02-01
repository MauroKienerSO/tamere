package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class MusicController {

    def storeService

    def index() {
        log.debug "$actionName -> $params"

        Integer amountOfItemsInShoppingCart = storeService.getNumberOfItemsInShoppingCart(session)

        render view: '/home/index', model: [templateLocation: '/music/musicTemplate', headerActive: 'music', amountOfItemsInShoppingCart: amountOfItemsInShoppingCart]
    }

    def body(){
        log.debug "$actionName -> $params"
        render template: 'musicTemplate'
    }
}
