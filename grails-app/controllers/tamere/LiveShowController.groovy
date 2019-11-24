package tamere

import grails.validation.ValidationException

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import tamere.LiveShowService

@Secured('permitAll')
class LiveShowController {

    LiveShowService liveShowService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", createShow: "GET"]

    def body(){
        log.debug "$actionName -> $params"

        render template: 'liveShowTemplate'
    }

    def createShow(){
        log.debug "$actionName -> $params"

        LiveShow newLiveShow = new LiveShow()
        bindData(newLiveShow, params, ['exclude': ['date']])

        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        Date liveShowDate = sdf.parse(params.date);

        render template: 'liveShowTable'
    }


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond liveShowService.list(params), model:[liveShowCount: liveShowService.count()]
    }

    def show(Long id) {
        respond liveShowService.get(id)
    }

    def addShow() {
        log.debug "$actionName -> $params"
        render template: 'create', model: [liveShow: new LiveShow(params)]
    }

    def save(LiveShow liveShow) {
        if (liveShow == null) {
            notFound()
            return
        }

        try {
            liveShowService.save(liveShow)
        } catch (ValidationException e) {
            respond liveShow.errors, view:'_create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'liveShow.label', default: 'LiveShow'), liveShow.id])
                redirect liveShow
            }
            '*' { respond liveShow, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond liveShowService.get(id)
    }

    def update(LiveShow liveShow) {
        if (liveShow == null) {
            notFound()
            return
        }

        try {
            liveShowService.save(liveShow)
        } catch (ValidationException e) {
            respond liveShow.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'liveShow.label', default: 'LiveShow'), liveShow.id])
                redirect liveShow
            }
            '*'{ respond liveShow, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        liveShowService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'liveShow.label', default: 'LiveShow'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'liveShow.label', default: 'LiveShow'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
