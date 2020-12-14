package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class WelcomeController {

    def index() {
        log.debug "$actionName -> $params"
    }

    def live() {
        render view: 'index'
    }

    def band() {
        render view: 'index'
    }

    def music() {
        render view: 'index'
    }

    def contact() {
        render view: 'index'
    }
}
