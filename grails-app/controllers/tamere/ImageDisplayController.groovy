package tamere

import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.http.HttpServletResponse

@Secured('permitAll')
class ImageDisplayController {

    /**
     * displays an image
     */
    def displayImage() {
        log.debug "$actionName -> ${params}"

        Image image = Image.get(params.long('id'))
        if(!image){
            log.debug "no image present"
            response.setStatus(HttpServletResponse.SC_NOT_FOUND)
            response.outputStream << ''
            return
        }

        String filePath = grailsApplication.config.grails.image.basepath + "/" + image.fileName
        File file = new File(filePath)

        if(!file.exists()){
            log.error "No file with fileName ${image.fileName} could be found."
            response.setStatus(HttpServletResponse.SC_NOT_FOUND)
            response.outputStream << ''
            return
        }

        String fileType = image.fileName.split('\\.')[1]

        def img = file.bytes
        response.contentType = "image/${fileType}"
        response.outputStream << img
        response.outputStream.flush()
        response.status = 200
    }
}
