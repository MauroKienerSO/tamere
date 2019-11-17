package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class VideoController {

    static scaffold = Video

    def body(){
        log.debug "$actionName -> $params"

        render template: 'videoTemplate'
    }
}
