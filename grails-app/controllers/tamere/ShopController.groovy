package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ShopController {

    def body() {
        log.debug "$actionName -> $params"
        render template: 'shopTemplate'
    }
}
