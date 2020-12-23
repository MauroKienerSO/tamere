package tamere

import grails.core.GrailsApplication

class TamereTagLib {

    GrailsApplication grailsApplication

    def imageDisplay = { attrs, body ->

        Image image = attrs.image
        if(!image){
            out << ""
        }

        def width = attrs.width?:grailsApplication.config.grails.image.default.width
        def height = attrs.height?:grailsApplication.config.grails.image.default.height

        out << render(template: "/image/displayTemplate", model: [image: attrs.image, width: width, height: height])
    }
}
