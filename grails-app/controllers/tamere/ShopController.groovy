package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ShopController {

    def index() {
        log.debug "$actionName -> $params"

        String contentTarget = 'shop'

        [contentTarget: contentTarget]
    }
}
