package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class MusicController {

    static scaffold = Music

    def body(){
        log.debug "$actionName -> $params"
        render template: 'musicTemplate'
    }
}
