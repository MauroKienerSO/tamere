package tamere

import grails.validation.ValidationException

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class LiveShowController {

    LiveShowService liveShowService

    static allowedMethods = [saveLiveShow: ['PUT', 'POST'], updateLiveShow: ['PUT']]

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
    def editLiveShow(){
        log.debug "$actionName -> $params"

        LiveShow liveShow = LiveShow.get(params.long('id'))

        if(!liveShow){
            log.debug "No live Show has been provided"
            redirect action: 'liveShows'
            return
        }

        [liveShow: liveShow]
    }

    @Secured(Role.ROLE_ADMIN)
    def updateLiveShow(){
        log.debug "$actionName -> $params"

        LiveShow liveShow = LiveShow.get(params.long('id'))
        if(!liveShow){
            log.error "No found liveShow"
            redirect action: 'liveShows'
            return
        }

        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy")
        Date liveShowDate = sdf.parse(params.date)

        bindData(liveShow, params, ['exclude': ['date']])

        liveShow.date = liveShowDate

        if(!liveShow.save(flush: true)){
            log.error "Couldn't update liveShows"
            log.debug "${liveShow.errors}"
            redirect action: 'liveShows'
            return
        }

        redirect action: 'liveShows'
    }

    @Secured(Role.ROLE_ADMIN)
    def saveLiveShow(LiveShow liveShow){
        log.debug "$actionName -> $params"

        if(!liveShow){
            log.error "No found liveShow"
            redirect action: 'liveShows'
            return
        }

        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy")
        Date liveShowDate = sdf.parse(params.date)

        bindData(liveShow, params, ['exclude': ['date']])

        liveShow.date = liveShowDate

        if(!liveShow.save(flush: true)){
            log.error "Couldn't save liveShows"
            log.debug "${liveShow.errors}"
            redirect action: 'liveShows'
            return
        }

        redirect action: 'liveShows'
    }

    @Secured(Role.ROLE_ADMIN)
    def deleteLiveShow(){
        log.debug "$actionName -> $params"

        LiveShow liveShow = LiveShow.get(params.long('id'))
        if(!liveShow){
            log.error "No found liveShow"
            redirect action: 'liveShows'
            return
        }

        liveShow.delete(flush:true)

        redirect action: 'liveShows'
    }


}
