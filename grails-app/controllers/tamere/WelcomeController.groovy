package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def index() {
        log.debug "$actionName -> $params"
        [templateLocation: '/home/startPage', headerActive: 'home']
    }

    def body() {
        log.debug "$actionName -> $params"
        render template: '/home/startPage'
    }
}
