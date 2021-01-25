package tamere

import grails.plugin.springsecurity.annotation.Secured

import java.text.SimpleDateFormat

@Secured('permitAll')
class VideoController {

    static allowedMethods = [saveVideo: ['PUT', 'POST'], updateVideo: ['PUT']]

    def index() {
        log.debug "$actionName -> $params"
        List<Video> videos = Video.list([sort: "dateCreated", order: "desc"])

        render view: '/home/index', model: [templateLocation: '/video/videoTemplate', headerActive: 'video', videos: videos]
    }

    def body(){
        log.debug "$actionName -> $params"
        List<Video> videos = Video.list([sort: "dateCreated", order: "desc"])
        render template: 'videoTemplate', model: [videos: videos]
    }

    @Secured(Role.ROLE_ADMIN)
    def videos() {
        log.debug "$actionName -> $params"

        List<Video> videos = Video.list([sort: "dateCreated", order: "desc"])

        [videos: videos]
    }

    @Secured(Role.ROLE_ADMIN)
    def createVideo(){
        log.debug "$actionName -> $params"
        [video: new Video()]
    }

    @Secured(Role.ROLE_ADMIN)
    def editVideo(){
        log.debug "$actionName -> $params"

        Video video = Video.get(params.long('id'))

        if(!video){
            log.debug "No live Show has been provided"
            redirect action: 'videos'
            return
        }

        [video: video]
    }

    @Secured(Role.ROLE_ADMIN)
    def updateVideo(){
        log.debug "$actionName -> $params"

        Video video = Video.get(params.long('id'))
        if(!video){
            log.error "No found video"
            redirect action: 'videos'
            return
        }

        bindData(video, params)

        if(!video.save(flush: true)){
            log.error "Couldn't update video"
            log.debug "${video.errors}"
            redirect action: 'videos'
            return
        }

        redirect action: 'videos'
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

    @Secured(Role.ROLE_ADMIN)
    def deleteVideo(){
        log.debug "$actionName -> $params"

        Video video = Video.get(params.long('id'))
        if(!video){
            log.error "No found video"
            redirect action: 'videos'
            return
        }

        video.delete(flush:true)

        redirect action: 'videos'
    }
}
