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

        out << render(template: "/tagLib/displayTemplate", model: [image: attrs.image, width: width, height: height])
    }

    def checkboxDisplay = { attrs, body ->
        out << render(template: "/tagLib/checkbox", model: [checked: attrs.checked, id: attrs.id, name: attrs.name, value: attrs.value])
    }
}
