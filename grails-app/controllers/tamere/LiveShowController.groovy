package tamere

import grails.validation.ValidationException

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class LiveShowController {

    LiveShowService liveShowService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", createShow: "GET"]

    def index() {
        log.debug "$actionName -> $params"
        List<LiveShow> futureLiveShows = LiveShow.findAllByDateGreaterThan(new Date(), [sort: "date", order: "desc"])
        List<LiveShow> pastLiveShows = LiveShow.findAllByDateLessThanEquals(new Date(), [sort: "date", order: "desc"])
        render view: '/home/index', model: [templateLocation: '/liveShow/liveShowTemplate', headerActive: 'live', futureLiveShows: futureLiveShows, pastLiveShows: pastLiveShows]
    }

    /**
     * renders liveShow Template (Start Page of LiveShows)
     * @return
     */
    def body(){
        log.debug "$actionName -> $params"
        List<LiveShow> futureLiveShows = LiveShow.findAllByDateGreaterThan(new Date(), [sort: "date", order: "desc"])
        List<LiveShow> pastLiveShows = LiveShow.findAllByDateLessThanEquals(new Date(), [sort: "date", order: "desc"])
        render template: 'liveShowTemplate', model: [futureLiveShows: futureLiveShows, pastLiveShows: pastLiveShows]
    }

    @Secured(Role.ROLE_ADMIN)
    def liveShows() {
        log.debug "$actionName -> $params"
        List<LiveShow> futureLiveShows = LiveShow.findAllByDateGreaterThan(new Date(), [sort: "date", order: "desc"])
        List<LiveShow> pastLiveShows = LiveShow.findAllByDateLessThanEquals(new Date(), [sort: "date", order: "desc"])
        [futureLiveShows: futureLiveShows, pastLiveShows: pastLiveShows]
    }

    @Secured(Role.ROLE_ADMIN)
    def createLiveShow(){
        log.debug "$actionName -> $params"
        [liveShow: new LiveShow()]
    }

    @Secured(Role.ROLE_ADMIN)
    def saveLiveShow(LiveShow liveShow){
        log.debug "$actionName -> $params"

        if(!liveShow){
            log.error "No found liveShow"
            redirect action: 'liveShows'
            return
        }

        if(!liveShow.save(flush: true)){
            log.error "Couldn't save liveShows"
            redirect action: 'liveShows'
            return
        }

        redirect action: 'liveShows'
    }


}
