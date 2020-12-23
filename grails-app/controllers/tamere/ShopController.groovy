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
}
