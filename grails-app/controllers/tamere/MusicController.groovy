package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class MusicController {

    def index() {
        log.debug "$actionName -> $params"
        render view: '/home/index', model: [templateLocation: '/music/musicTemplate', headerActive: 'music']
    }

    def body(){
        log.debug "$actionName -> $params"
        render template: 'musicTemplate'
    }
}
