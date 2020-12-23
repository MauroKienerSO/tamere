package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class BandController {

    def index() {
        log.debug "$actionName -> $params"
        render view: '/home/index', model: [templateLocation: '/band/bandTemplate',  headerActive: 'band']
    }

    def body() {
        log.debug "$actionName -> $params"
        render template: 'bandTemplate'
    }
}
