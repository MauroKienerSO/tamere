package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured(Role.ROLE_ADMIN)
class AdminController {

    def index() {
        log.debug "$actionName -> $params"
    }
}
