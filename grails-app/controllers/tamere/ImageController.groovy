package tamere

import grails.core.GrailsApplication
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(Role.ROLE_ADMIN)
class ImageController {

    FileService fileService
    ImageService imageService
    GrailsApplication grailsApplication

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond imageService.list(params), model:[imageCount: imageService.count()]
    }

    def show(Long id) {
        respond imageService.get(id)
    }

    def create() {
        respond new Image()
    }

    def save(Image image) {
        log.debug "$actionName -> $params"

        def file = request.getFile('image')
        if (image == null || !file) {
            flash.message = "You didn't provide an image"
            render view:'create'
            return
        }

        // Save the image on the file System
        Map result = fileService.saveImage(file, image)

        if(!result.success){
            if(result.message){
                flash.message = result.message
            }
            render view:'create', model: [image: image]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect image
            }
            '*' { respond image, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond imageService.get(id)
    }

    def update(Image image) {
        if (image == null) {
            notFound()
            return
        }

        try {
            imageService.save(image)
        } catch (ValidationException e) {
            respond image.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect image
            }
            '*'{ respond image, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        // get the fileName for deleting the image
        String fileName = Image.get(id).fileName

        imageService.delete(id)

        // delete the image on the fileSystem
        fileService.deleteImage(fileName)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
