package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class VideoController {

    static allowedMethods = [saveVideo: ['PUT', 'POST']]

    def index() {
        log.debug "$actionName -> $params"
        List<Video> videos = Video.list()

        render view: '/home/index', model: [templateLocation: '/video/videoTemplate', headerActive: 'video', videos: videos]
    }

    def body(){
        log.debug "$actionName -> $params"
        List<Video> videos = Video.list()
        render template: 'videoTemplate', model: [videos: videos]
    }

    @Secured(Role.ROLE_ADMIN)
    def videos() {
        log.debug "$actionName -> $params"

        List<Video> videos = Video.list()

        [videos: videos]
    }

    @Secured(Role.ROLE_ADMIN)
    def createVideo(){
        log.debug "$actionName -> $params"
        [video: new Video()]
    }

    @Secured(Role.ROLE_ADMIN)
    def saveVideo(Video video){
        log.debug "$actionName -> $params"

        if(!video){
            log.error "No found Video"
            redirect action: 'videos'
            return
        }

        if(!video.save(flush: true)){
            log.error "Couldn't save Video"
            redirect action: 'videos'
            return
        }

        redirect action: 'videos'
    }
}
