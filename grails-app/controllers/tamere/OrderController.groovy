package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured(Role.ROLE_ADMIN)
class OrderController {

    def index() { }
}
