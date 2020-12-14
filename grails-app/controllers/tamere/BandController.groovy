package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class BandController {

    static scaffold = Band

    def body() {
        log.debug "$actionName -> $params"
        render template: 'bandTemplate'
    }
}
