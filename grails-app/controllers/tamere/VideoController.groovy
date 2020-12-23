package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class VideoController {

    def index() {
        log.debug "$actionName -> $params"
        render view: '/home/index', model: [templateLocation: '/video/videoTemplate', headerActive: 'video']
    }

    def body(){
        log.debug "$actionName -> $params"
        render template: 'videoTemplate'
    }
}
