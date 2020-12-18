package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class WelcomeController {

    def index() {
        log.debug "$actionName -> $params"
    }

    def body() {
        log.debug "$actionName -> $params"
        render template: '/home/startPage'
    }
}
